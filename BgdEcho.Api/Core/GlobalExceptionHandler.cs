using BgdEcho.Api.Core.Exceptions;
using BgdEcho.Application;
using BgdEcho.Application.Exceptions;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BgdEcho.Api.Core
{
    public class GlobalExceptionHandler
    {
        private readonly RequestDelegate _next;
        private readonly IExceptionLogger _logger;

        public GlobalExceptionHandler(RequestDelegate next, IExceptionLogger logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                httpContext.Response.ContentType = "application/json";
                object response = null;
                var statusCode = StatusCodes.Status500InternalServerError;

                switch (ex)
                {
                    case UnauthorizedUseCaseException _:
                        statusCode = StatusCodes.Status403Forbidden;
                        response = new
                        {
                            message = "You are not allowed to execute this operation."
                        };
                        break;
                    case EntityNotFoundException _:
                        statusCode = StatusCodes.Status404NotFound;
                        response = new
                        {
                            message = "Resource not found."
                        };
                        break;
                    case ValidationException validationException:
                        statusCode = StatusCodes.Status422UnprocessableEntity;

                        response = new
                        {
                            message = "Failed due to validation errors.",
                            errors = validationException.Errors.Select(x => new
                            {
                                x.PropertyName,
                                x.ErrorMessage
                            })
                        };
                        break;
                    case UserNotFoundException notFoundException:
                        statusCode = StatusCodes.Status403Forbidden;

                        response = new
                        {
                            message = "User not found in the system. Please check your input and try again."
                        };
                        break;
                    case ExtensionNotAllowedException ext:
                        statusCode = StatusCodes.Status400BadRequest;

                        response = new
                        {
                            message = ext.Message,
                            file = ext.FileName
                        };
                        break;
                    case MaxFileSizeExceededException ext:
                        statusCode = StatusCodes.Status400BadRequest;

                        response = new
                        {
                            message = ext.Message,
                            file = ext.FileName
                        };
                        break;
                    case UnauthorizedActionException e:
                        statusCode = StatusCodes.Status403Forbidden;

                        response = new
                        {
                            message = "You are not allowed to execute this operation."
                        };
                        break;
                    default:
                        statusCode = StatusCodes.Status500InternalServerError;
                        response = new
                        {
                            message = "There was an unexpected error. Please try again later or contact our support."
                        };

                        _logger.Log(ex);
                        break;
                }

                httpContext.Response.StatusCode = statusCode;

                if (response != null)
                {
                    await httpContext.Response.WriteAsync(JsonConvert.SerializeObject(response));
                    return;
                }

                await Task.FromResult(httpContext.Response);
            }
        }
    }
}
