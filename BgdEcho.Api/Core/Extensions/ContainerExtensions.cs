using BgdEcho.Api.Core.Actors;
using BgdEcho.Api.Core.Jwt;
using BgdEcho.Application;
using BgdEcho.Application.UseCases;
using BgdEcho.EfDataAccess;
using BgdEcho.Implementation;
using BgdEcho.Implementation.UseCases;
using FluentValidation;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BgdEcho.Api.Core.Extensions
{
    public static class ContainerExtensions
    {
        public static void AddEntityAccessor(this IServiceCollection services)
        {
            services.AddTransient(x =>
            {
                var context = x.GetService<EfDataAccess.Context>();
                var actor = x.GetService<IApplicationActor>();

                return new QueryBuilder(context, actor);
            });
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;
            });
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = ApplicationSettings.JwtIssuer,
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ApplicationSettings.JwtKey)),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddUseCases(this IServiceCollection services)
        {
            var interfaces = typeof(IUseCaseOperation<,>).Assembly.GetTypes()
                .Where(type => 
                        type.IsInterface && 
                        type.GetInterfaces().Any(x => x.Name == typeof(IUseCaseOperation<,>).Name)
                        ).ToList();

            var implementations = typeof(EFGenericFind<,>).Assembly.GetTypes()
                .Where(type => 
                        !type.IsAbstract && 
                        type.GetInterfaces().Any(x => x.Name == typeof(IUseCaseOperation<,>).Name)
                        ).ToList();

            foreach(var i in interfaces)
            {
                var implementation = implementations.FirstOrDefault(x => x.GetInterface(i.Name) != null);

                if(implementation != null)
                {
                    services.AddTransient(i, implementation);
                }
            }
        }

        public static void AddValidators(this IServiceCollection services)
        {
            var validators = typeof(EFGenericFind<,>).Assembly.GetTypes()
               .Where(type =>
                   !type.IsAbstract &&
                   type.BaseType.Name == typeof(AbstractValidator<>).Name
               ).ToList();

            foreach (var validator in validators)
            {
                var args = validator.BaseType.GetGenericArguments().FirstOrDefault();

                var specificValidator = typeof(AbstractValidator<>).MakeGenericType(args);

                services.AddTransient(validator);
                services.AddTransient(specificValidator, validator);
            }
        }

        public static void AddSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "BgdEco.api", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. Enter 'Bearer' [space] and then your token in the text input below. Example: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            },
                            Scheme = "oauth2",
                            Name = "Bearer",
                            In = ParameterLocation.Header
                            },
                            new List<string>()
                        }
                    });
            });
        }
    }
}
