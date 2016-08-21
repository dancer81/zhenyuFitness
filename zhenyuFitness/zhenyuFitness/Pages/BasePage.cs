using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using zhenyuFitness.DAO;
using System.Web.UI;

namespace zhenyuFitness.Pages
{
    public class BasePage : System.Web.UI.Page
    {
        private MssqlDal dal = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, System.Configuration.ConfigurationManager.AppSettings["DbLog"]);
        private HttpRequest request = HttpContext.Current.Request;


        protected void Page_Load(object sender, EventArgs e)
        {
            if(ViewState["test"] != null)
            {
                this.MessageBox(Page, ViewState["test"].ToString(), "abc");
            }
            
            this.UserLogin();
            this.UserLogout();
            ViewState["test"] = "hello world!";
        }

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
                DataTable DT_userProfile = dal.DoSelectToTable(sql, "userProfile", paramers);
                if (DT_userProfile != null && DT_userProfile.Rows.Count > 0)
                {
                    //TO DO: 用户登录成功，初始化模板页中用户相关信息：通知、信息、任务、登录头像、特别关注、Session["User"] = userID、登录次数，最后登录时间、登录IP


                    //登录头像和Session["user"]
                    Session["UserProfile"] = DT_userProfile;
                    Session["UserID"] = DT_userProfile.Rows[0]["ID"].ToString();
                    this.MessageBox(Page, "登录成功", "loginSuccess");
                }
                else//用户名或者密码错误
                {
                    this.MessageBox(Page, "您的用户名或者登录密码错误，请重新输入!", "loginFail");
                }
            }
        }

        private void UserLogout()
        {
            if (request.Form["logoutHidden"] != null)
            {
                //this.SetUserLoginArea(false);
                Session["UserProfile"] = null;
                Session["UserID"] = null;
            }
        }

        /// <summary>
        /// 根据关键字，取得对应实体的ID，比如exerciseID
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetID(string key)
        {
            if (Request.QueryString[key] != null)
            {
                return Request.QueryString[key].ToString();
            }
            //post方式进入此页面
            else if (request.Form["exerciseID"] != null)
            {
                return request.Form[key].ToString();
            }
            else
            {
                this.MessageBox(Page, "ID 错误！请关闭页面！", "wrongID");
                return "";
            }
        }

        public void MessageBox(Page page, string msg, string key)
        {
            page.ClientScript.RegisterStartupScript(GetType(), key, "<script>bootbox.alert('" + msg + "')</script>");
        }
    }
}