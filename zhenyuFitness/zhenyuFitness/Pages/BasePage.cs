using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using zhenyuFitness.DAO;
using System.Web.UI;
using System.Data.SqlClient;
using zhenyuFitness.Common;

namespace zhenyuFitness.Pages
{
    public class BasePage : System.Web.UI.Page
    {
        protected MssqlDal dal = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, System.Configuration.ConfigurationManager.AppSettings["DbLog"]);
        protected HttpRequest request = HttpContext.Current.Request;
        protected CommonWeb commonWeb = new CommonWeb(HttpContext.Current);

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UserLogin();
            this.UserLogout();
            this.UserPermission();
            
        }

        #region 登录相关
        /// <summary>
        /// 判断用户是否登录
        /// </summary>
        /// <returns>true:尚未登录；false:已经登录</returns>
        private void UserLogin()
        {
            if (request.Form["loginHidden"] != null)
            {
                string email = "";
                string password = "";
                if (request.Form["emailLogin"] != null)
                {
                    email = request.Form["emailLogin"].ToString();
                }
                if (request.Form["passwordLogin"] != null)
                {
                    password = request.Form["passwordLogin"].ToString();
                }

                MssqlDal dal = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["DbLog"]));
                string sql = "select * from [zhenyuFitness].[dbo].[User] where [Email] = @email and [Password] = @password and Valid = 1";
                Object[] paramers = new object[] { email, password };

                DataTable DT_userProfile;
                try
                {
                    DT_userProfile = dal.DoSelectToTable(sql, "userProfile", paramers);
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    commonWeb.MessageBox(Page, "登录时数据库出错！", "inserterror1");
                    return;
                }
                if (DT_userProfile != null && DT_userProfile.Rows.Count > 0)
                {
                    //TO DO: 用户登录成功，初始化模板页中用户相关信息：通知、信息、任务、登录头像、特别关注、Session["User"] = userID、登录次数，最后登录时间、登录IP


                    //登录头像和Session["user"]
                    Session["UserProfile"] = DT_userProfile;
                    Session["UserID"] = DT_userProfile.Rows[0]["ID"].ToString();
                    Session["Age"] = DT_userProfile.Rows[0]["Age"].ToString();
                    Session["Gender"] = DT_userProfile.Rows[0]["Gender"].ToString();
                    commonWeb.MessageBox(Page, "登录成功", "loginSuccess");
                }
                else//用户名或者密码错误
                {
                    commonWeb.MessageBox(Page, "您的用户名或者登录密码错误，请重新输入!", "loginFail");
                }
            }
        }
        private void UserLogout()
        {
            if (request.Form["logoutHidden"] != null)
            {
                //this.SetUserLoginArea(false);
                //Session["UserProfile"] = null;
                //Session["UserID"] = null;

                for(int i = 0;i<Session.Keys.Count;i++)
                {
                    Session[Session.Keys[i].ToString()] = null;
                }

                string url = commonWeb.GetAbsolutePath();
                int accessType = commonWeb.HasPermission_Page(url);
                if(accessType ==2 || accessType ==3)
                {
                    Response.Redirect(Common.Common.LogOutRedirectPage);
                }
            }
        }

        //判断用户是否有权访问此页面
        private void UserPermission()
        {
            string url = commonWeb.GetAbsolutePath();
            //如果Session[url]无法指明用户是否有权限访问该页面，则必须进行判定
            if (Session[url] == null || Session[url].ToString() != Common.Common.HasPermission)
            {
                int accessType = commonWeb.HasPermission_Page(url);

                if (accessType == 0)//表示该页面允许未登录用户访问
                {
                    Session[url] = Common.Common.HasPermission;
                }
                else if (accessType == 1)//该页面允许登录用户访问，且该用户有足够的权限访问该页面
                {
                    Session[url] = Common.Common.HasPermission;
                }
                else if (accessType == 2)//该页面拒绝用户访问，原因：用户未登录
                {
                    string callback = string.Format("function(){{ window.location = '{0}'}}", Common.Common.NotLoginRedirectPage);
                    commonWeb.MessageBoxAlertWithCallBack(Page, "您尚未登录！请登录后重试。", "notLogin", callback);
                }
                else if (accessType == 3)//该页面允许登录用户访问，但该用户没有足够的权限访问该页面
                {
                    string callback = string.Format("function(){{ window.location = '{0}'}}", Common.Common.NotPermittedRedirectPage);
                    commonWeb.MessageBoxAlertWithCallBack(Page, "您所在的用户群没有足够的权限访问该页面！", "notEnoughRight", callback);
                }
                else
                {

                }
            }
        }
        #endregion
     


    }
}