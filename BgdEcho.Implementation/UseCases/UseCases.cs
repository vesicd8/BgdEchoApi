using BgdEcho.Application.UseCases;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BgdEcho.Implementation.UseCases
{
    public static class UseCases
    {
        public static List<UseCaseDoc> UseCaseList
        {
            get
            {
                var list = new List<UseCaseDoc>();

                var implementations = typeof(QueryBuilder).Assembly.GetTypes()
                    .Where(x => x.IsClass &&
                            !x.IsAbstract &&
                            x.GetInterfaces().Any(x => x.Name == typeof(IUseCaseOperation<,>).Name)
                            ).ToList();

                foreach (var i in implementations)
                {
                    var ctorArgs = i.GetConstructors().FirstOrDefault().GetParameters().Length;

                    var instance = Activator.CreateInstance(i, new object[ctorArgs]);

                    var useCaseName = (string)i.GetProperty("Name").GetValue(instance);
                    var useCaseId = (int)i.GetProperty("Id").GetValue(instance);

                    list.Add(new UseCaseDoc
                    {
                        Id = useCaseId,
                        Name = useCaseName
                    });
                }

                return list.OrderBy(x => x.Id).ToList();
            }
        }
    }

    public class UseCaseDoc
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
