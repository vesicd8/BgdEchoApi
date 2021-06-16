using BgdEcho.Api.Core;
using BgdEcho.Api.Core.Extensions;
using BgdEcho.Api.Core.FileManager;
using BgdEcho.Api.Core.Identity;
using BgdEcho.Api.Core.Jwt;
using BgdEcho.Application;
using BgdEcho.Application.UseCases;
using BgdEcho.EfDataAccess;
using BgdEcho.Implementation;
using BgdEcho.Implementation.Logging;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace BgdEcho.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<Context>();
            services.AddHttpContextAccessor();
            services.AddTransient<IJwtStorage, JwtStorage>();
            services.AddTransient<IJwtValidator, JwtStorage>();
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddTransient<IExceptionLogger, DatabaseExceptionLogger>();
            services.AddTransient<JwtManager>();
            services.AddTransient<UseCaseExecutor>();
            services.AddAutoMapper(typeof(QueryBuilder).Assembly);
            services.AddJwt();
            services.AddApplicationActor();
            services.AddEntityAccessor();
            services.AddTransient<IIdentityProvider, HttpIdentityProvider>();
            services.AddValidators();
            services.AddUseCases();
            services.AddTransient<PostCoverFileManager>();
            services.AddTransient<PostImagesFileManager>();
            services.AddSwagger();
            services.AddControllers();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseStaticFiles();

            app.UseSwagger();

            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Bgd Echo"));

            app.UseRouting();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
