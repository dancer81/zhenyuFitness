using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.Common;
using zhenyuFitness.DAO;

namespace zhenyuFitness.Pages.Goal
{
    public partial class GoalSetting : BasePage
    {
        public float startHeight;
        public float startWeight;
        public float startWaistSize;
        public float startBFR;
        public int goalDirection;
        public int goalPhysique;
        public float goalWeight;
        public float goalBFR;
        public int goalCostDays;
        public bool isKnowBFR;

        private MssqlDal dal;
        private HttpRequest request = HttpContext.Current.Request;
        private CommonWeb commonWeb = new CommonWeb(HttpContext.Current);

        protected new void Page_Load(object sender, EventArgs e)
        {
            dal = new MssqlDal(Common.Common.DBConnectionStr, Server.MapPath(Common.Common.DbLog));

            base.Page_Load(sender, e);

            this.DealWithForm();
        }

        private void DealWithForm()
        {
            if (request.Form.Count > 0)//可能是form提交的post,也可能是ajax提交的post
            {
                if (request.Form["ajaxtype"] != null)
                {
                    //处理用户的ajax提交的post

                }
                else
                {
                    //处理form提交的post,（登录表单除外，登录表单在BasePage中实现)
                    
                }
            }
        }
    }
}