using BgdEcho.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BgdEcho.Application.UseCases.Comments
{
    public interface FindCommentUseCase : IUseCaseOperation<int, CommentDto>
    {
    }
}
