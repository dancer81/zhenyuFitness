using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.MasterPages;

namespace zhenyuFitness.Pages.Login
{
    public partial class Register : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            ((generalMaster)this.Master).pagePath = @"<li>用户注册</li>";
            //((generalMaster)this.Master).pageTitle = "用户注册";
            //((generalMaster)this.Master).pageTitleDesc = "创建账号并填写相关信息";
            //this.Master 
            string s = "123123123";
            string email = "";
            string password = "";
            string userName = "";
            string province = "";
            string phone = "";
            string gender = "";
            string birthday = "";
            string height = "";
            string weight = "";
            string fitHis = "";
            if (IsPostBack)
            {
                HttpRequest request = HttpContext.Current.Request;

                if (request.Form["email"] != null)
                {
                    email = request.Form["email"].ToString();
                }
                if (request.Form["name"] != null)
                {
                    userName = request.Form["name"].ToString();
                }
                if (request.Form["password"] != null)
                {
                    password = request.Form["password"].ToString();
                }
                if (request.Form["province"] != null)
                {
                    province = request.Form["province"].ToString();
                }
                if (request.Form["phone"] != null)
                {
                    phone = request.Form["phone"].ToString();
                }
                if (request.Form["gender"] != null)
                {
                    gender = request.Form["gender"].ToString();
                }
                if (request.Form["birthday"] != null)
                {
                    birthday = request.Form["birthday"].ToString();
                }
                if (request.Form["height"] != null)
                {
                    height = request.Form["height"].ToString();
                }
                if (request.Form["weight"] != null)
                {
                    weight = request.Form["weight"].ToString();
                }
                if (request.Form["fitHis"] != null)
                {
                    fitHis = request.Form["fitHis"].ToString();
                }

                Page.ClientScript.RegisterStartupScript(GetType(), "key2", string.Format("<script>bootbox.alert('{0} && {1} && {2} &&{3} &&{4} &&{5} &&{6} &&{7} &&{8} &&{9} ')</script>",
                    email, userName, password, province, phone, gender, birthday, height, weight, fitHis));

                //Response.Write(string.Format("<script>bootbox.alert('{0} && {1} && {2} &&{3} &&{4} &&{5} &&{6} &&{7} &&{8} &&{9} ')</script>",
                //    email, userName, password, province, phone, gender, birthday, height, weight, fitHis));
            }
            else
            {
                //Page.ClientScript.RegisterStartupScript(GetType(), "key2","bootbox.alert('123123132')", true);
            }
        }
    }
}