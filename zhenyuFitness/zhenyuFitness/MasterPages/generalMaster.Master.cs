using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.DAO;

namespace zhenyuFitness.MasterPages
{
    public partial class generalMaster : System.Web.UI.MasterPage
    {
        public string appRootPath = Common.Common.appRootPath;
        public string resourceRootPath = Common.Common.resourceRootPath;
        public string pagePath = string.Empty;

        public string htmlUserLogin = "";
        public string profilePicDisplay = "";//前台用户登录样式
        public string userNotLogin = "";//前台用户未登录样式
        public string profilePic = "";//前台用户登录头像
        public string userName = "";//前台用户登录名
        public string Show_Logout = "";
        public string Show_LoginBox = "";

        protected void Page_Load(object sender, EventArgs e)//加载任何一个页面，都会调用。用于加载模板页上的相关信息
        {
            HttpRequest request = HttpContext.Current.Request;
            //如果用户未登录
            if (Session["UserID"] == null)
            {
                //用户处于未登录状态
                this.SetUserLoginArea(false);

            }
            else//如果用户已经登录
            {
                this.SetUserLoginArea(true);


            }

        }

        private void SetUserLoginArea(bool isLogin)
        {
            if (isLogin)//如果已经登录
            {

                profilePicDisplay = "normal";
                userNotLogin = "none";
                this.Show_LoginBox = "none";
                this.Show_Logout = "normal";

                DataTable dt = Session["UserProfile"] as DataTable;

                if (dt != null && dt.Rows.Count > 0)
                {

                    if (dt.Rows[0]["MainProfilePhoto"] != null) { this.profilePic = dt.Rows[0]["MainProfilePhoto"].ToString(); }
                    else { this.profilePic = ""; }
                    if (dt.Rows[0]["UserName"] != null) { this.userName = dt.Rows[0]["UserName"].ToString(); }
                    else { this.userName = "没有用户名"; }

                }


            }
            else//如果尚未登录
            {
                profilePicDisplay = "none";
                userNotLogin = "normal";
                this.Show_LoginBox = "normal";
                this.Show_Logout = "none";
            }
        }
    }
}