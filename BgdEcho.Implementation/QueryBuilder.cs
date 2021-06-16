using BgdEcho.Application;
using BgdEcho.Application.Exceptions;
using BgdEcho.Domain;
using BgdEcho.EfDataAccess;
using BgdEcho.EfDataAccess.Extensions;
using System;
using System.Linq;

namespace BgdEcho.Implementation
{
    public class QueryBuilder
    {
        private readonly Context _context;
        private readonly IApplicationActor _actor;

        public QueryBuilder(Context context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public IApplicationActor Actor => _actor;

        public TEntity FindById<TEntity>(int id)
            where TEntity : Entity
        {
            var query = SetupQuery<TEntity>();
            
            var item = query.Where(x => x.Id == id).FirstOrDefault();

            if (item == null)
            {
                throw new EntityNotFoundException(id, typeof(TEntity));
            }

            return item;
        }

        public IQueryable<TEntity> BuildQuery<TEntity>()
            where TEntity : Entity
        {
            return SetupQuery<TEntity>();
        }

        public IQueryable<TEntity> Query<TEntity>()
            where TEntity : class
        {
            return _context.Set<TEntity>().AsQueryable();
        }

        public void DeleteById<TEntity>(int id)
            where TEntity : Entity
        {
            var query = SetupQuery<TEntity>();

            var item = query.FirstOrDefault(x => x.Id == id);

            if (item == null)
            {
                throw new EntityNotFoundException(id, typeof(TEntity));
            }

            item.DeletedAt = DateTime.UtcNow;
            _context.SaveChanges();
        }

        public void DeactivateById<TEntity>(int id)
            where TEntity : Entity
        {
            var query = SetupQuery<TEntity>();

            var item = query.FirstOrDefault(x => x.Id == id);

            if (item == null)
            {
                throw new EntityNotFoundException(id, typeof(TEntity));
            }

            item.IsActive = false;
            _context.SaveChanges();
        }

        public void ChangeActivityStatus<TEntity>(int id)
            where TEntity : Entity
        {
            var query = SetupQuery<TEntity>();

            var item = query.FirstOrDefault(x => x.Id == id);

            if (item == null)
            {
                throw new EntityNotFoundException(id, typeof(TEntity));
            }

            item.IsActive = !item.IsActive;
            _context.SaveChanges();
        }

        public void Insert<TEntity>(TEntity item)
            where TEntity : Entity
        {
            _context.Set<TEntity>().Add(item);
            _context.SaveChanges();
        }

        public void Commit() => _context.SaveChanges();
        
        public void Update<TEntity>(TEntity item)
            where TEntity : Entity
        {
            _context.Set<TEntity>().Update(item);

            _context.SaveChanges();
        }

        private IQueryable<TEntity> SetupQuery<TEntity>()
            where TEntity : Entity
        {
            var query = _context.Set<TEntity>().AsQueryable();

            if (!_actor.IsSuperAdmin)
            {
                query = query.ExcludeInactive();
            }

            return query;
        }
    }
}
