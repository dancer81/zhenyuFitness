using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.MasterPages;

namespace zhenyuFitness.Pages.PhotoManager
{
    public partial class PhotoUpload : BasePage
    {
        protected new void Page_Load(object sender, EventArgs e)
        {
            
            base.Page_Load(sender, e);

            if (request.Form.Count == 0)
            {
                this.commonWeb.MessageBox(Page, "1.此处进入！", "");
                this.InitPage();
            }
            else
            {
                this.commonWeb.MessageBox(Page, "2.此处进入！", "");
                this.DealWithForm();
            }
        }

        private void InitPage()
        {
            //页面路径
            ((generalMaster)this.Master).pagePath = @"<li>图片管理</li><li>图片上传</li>";

            if (!this.InitPageData())
            {
                commonWeb.MessageBox(Page, "数据加载失败！请重试。", "loaddatafail");
                return;
            }


        }

        private void DealWithForm()
        {
            
        }

        private bool InitPageData()
        {
            return true;
        }
    }
}