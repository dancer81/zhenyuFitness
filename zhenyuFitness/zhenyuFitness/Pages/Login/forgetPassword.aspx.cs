using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.MasterPages;

namespace zhenyuFitness.Pages.Login
{
    public partial class forgetPassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            ((generalMaster)this.Master).pagePath = @"<li>忘记密码</li>";
            //((generalMaster)this.Master).pageTitle = "忘记密码";
            //((generalMaster)this.Master).pageTitleDesc = "请填写您注册的邮箱";
        }
    }
}