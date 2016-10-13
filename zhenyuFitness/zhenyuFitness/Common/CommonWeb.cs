using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using zhenyuFitness.DAO;

namespace zhenyuFitness.Common
{
    public class CommonWeb
    {
        private MssqlDal dal = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, System.Configuration.ConfigurationManager.AppSettings["DbLog"]);
        //private HttpRequest request = HttpContext.Current.Request;
        private HttpContext context;

        public CommonWeb(HttpContext context)
        {
            this.context = context;
        }

        //用户是否有访问该页面的权限
        public int HasPermission_Page(string pageUrlAbsolute)
        {
            if (!Common.OpenPrivilege)
            {
                return 0;//所有页面允许所有人访问
            }

            SqlParameter userID = new SqlParameter("@userID", SqlDbType.VarChar, 36);
            SqlParameter privilegeMaster = new SqlParameter("@privilegeMaster", SqlDbType.TinyInt);
            SqlParameter privilegeAccess = new SqlParameter("@privilegeAccess", SqlDbType.TinyInt);
            SqlParameter privilegeAccessValue = new SqlParameter("@privilegeAccessValue", SqlDbType.VarChar, 100);
            SqlParameter privilegeOperation = new SqlParameter("@privilegeOperation", SqlDbType.TinyInt);
            if (this.NotLogin()) userID.Value = null;
            else userID.Value = this.context.Session["UserID"].ToString();
            privilegeMaster.Value = (int)Common.PrivilegeMaster.Role;
            privilegeAccess.Value = (int)Common.PrivilegeAccess.Page;
            privilegeAccessValue.Value = pageUrlAbsolute;
            privilegeOperation.Value = (int)Common.PrivilegeOperation.Enabled;
            IDataParameter[] paramenters = new IDataParameter[] { userID, privilegeMaster, privilegeAccess, privilegeAccessValue, privilegeOperation };


            object o = dal.RunProcedure("HasPermission_Page", paramenters);
            //this.MessageBox(Page, this.GetAbsolutePath() + "&&&存储过程返回值=" + o.ToString(), "asdf1221");
            return int.Parse(o.ToString());
        }

        public bool NotLogin()
        {
            if (Common.NoneOrEmptyString(this.context.Session["UserID"]))
            {
                return true;
            }
            return false;
        }

        #region 弹出框相关
        /// <summary>
        /// 弹出框消失后，什么都不发生。
        /// </summary>
        /// <param name="page"></param>
        /// <param name="msg"></param>
        /// <param name="key"></param>
        public void MessageBox(Page page, string msg, string key)
        {
            page.ClientScript.RegisterStartupScript(GetType(), key, "<script>bootbox.alert('" + msg + "')</script>");
        }

        /// <summary>
        /// 带callback的弹出框，弹出框消失后调用callback
        /// </summary>
        /// <param name="page"></param>
        /// <param name="msg">弹出框里的信息</param>
        /// <param name="key">脚本标识，随意</param>
        /// <param name="callback">弹出框消失后执行的方法（前台脚本）</param>
        public void MessageBoxAlertWithCallBack(Page page, string msg, string key, string jscallback)
        {
            string alertParam = string.Format("size:'small',message:'{0}',callback:{1}", msg, jscallback);
            page.ClientScript.RegisterStartupScript(GetType(), key, "<script>bootbox.alert({" + alertParam + "})</script>");
        }
        #endregion

        #region URL Operation
        //设当前页完整地址是：http://www.jb51.net/aaa/bbb.aspx?id=5&name=kelli
        /// <summary>
        /// 
        /// </summary>
        /// <returns>http://www.jb51.net/aaa/bbb.aspx?id=5&name=kelli</returns>
        public string GetFullURL()
        {
            return this.context.Request.Url.ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns>/aaa/bbb.aspx?id=5&name=kelli</returns>
        public string GetRawURL()
        {
            return this.context.Request.RawUrl.ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns>aaa/bbb.aspx</returns>
        public string GetAbsolutePath()
        {
            return this.context.Request.Url.AbsolutePath;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns>www.jb51.net</returns>
        public string GetHost()
        {
            return this.context.Request.Url.Host;
        }

        public string GetUrlParam()
        {
            return this.context.Request.Url.Query;
        }
        #endregion

        #region 其他
        /// <summary>
        /// 根据关键字，取得对应实体的ID，比如exerciseID
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetID(string key,Page page)
        {
            //get方式进入此页面
            if (this.context.Request.QueryString[key] != null)
            {
                return this.context.Request.QueryString[key].ToString();
            }
            //post方式进入此页面
            else if (this.context.Request.Form["exerciseID"] != null)
            {
                return this.context.Request.Form[key].ToString();
            }
            else
            {
                this.MessageBox(page, "ID 错误！请关闭页面！", "wrongID");
                return "";
            }
        }
        #endregion
    }
}