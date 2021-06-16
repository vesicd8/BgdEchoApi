using System;

namespace BgdEcho.Application.Exceptions
{
    public class EntityNotFoundException : Exception
    {
        public EntityNotFoundException(int id, Type type)
            : base($"Entity of a type '{type.Name}' with an ID of {id} was not found in the system.")
        {
        }
    }
}
