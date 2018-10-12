using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryTest
{
    /// <summary>
    /// 工作单元
    /// 提供一个保存方法，它可以对调用层公开，为了减少连库次数
    /// </summary>
    interface IUnitOfWork
    {
        /// <summary>
        /// 将操作提交到数据库，
        /// </summary>
        void Save();
        /// <summary>
        /// 是否不提交到数据库，这只是在具体的repository类中的SaveChanges方法里用到的
        /// 默认为false，即默认为提交到数据库
        /// </summary>
        /// <returns></returns>
        bool IsNotSubmit { get; set; }
    }
}
