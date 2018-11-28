using System;
using System.Runtime.Serialization;

namespace UniversityTutorManageSys.Models
{
    [DataContract]
    public class ResultModel
    {
        #region 私有字段
        Int32 state;
        bool ifValidate;
        String message;
        Object obj;
        #endregion


        #region 属性
        /// <summary>
        /// 是否需要验证码
        /// </summary>
        [DataMember]
        public bool IfValidate
        {
            set { ifValidate = value; }
            get { return ifValidate; }
        }
        /// <summary>
        /// 状态编号
        /// </summary>
        [DataMember]
        public Int32 State
        {
            set { state = value; }
            get { return state; }
        }
        /// <summary>
        /// 信息
        /// </summary>
        [DataMember]
        public String Message
        {
            set { message = value; }
            get { return message; }
        }
        /// <summary>
        /// 对象
        /// </summary>
        [DataMember]
        public Object Obj
        {
            set { obj = value; }
            get { return obj; }
        }
        #endregion
    }
}
