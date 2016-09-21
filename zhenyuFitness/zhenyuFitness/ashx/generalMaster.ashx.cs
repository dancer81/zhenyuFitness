using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;

namespace zhenyuFitness.ashx
{
    /// <summary>
    /// generalMaster 的摘要说明
    /// </summary>
    public class generalMaster : IHttpHandler,IReadOnlySessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            Common.CommonWeb commonWeb = new Common.CommonWeb(context);

            string ajaxType = context.Request.Form["ajaxtype"].ToString();
            
            switch(ajaxType)
            {
                case "pagePermission":
                    int permissionType;
                    string urlAbsolutePath = context.Request.Form["url"].ToString();
                    //根据Session[urlAbsolutePath]来判定用户之前是否访问过该页面，如果其值为Common.Common.HasPermission,那么跳过判定
                    if (context.Session[urlAbsolutePath] != null && context.Session[urlAbsolutePath].ToString() == Common.Common.HasPermission)
                    {
                        permissionType = 0;
                    }
                    else//如果Session[urlAbsolutePath]为空或者不为Common.Common.HasPermission，则需进行判定
                    {
                        permissionType = commonWeb.HasPermission_Page(urlAbsolutePath);
                        //如果判定结果显示用户有权访问，则给Session[urlAbsolutePath]赋值
                        if (permissionType == 0 || permissionType == 1)
                        {
                            context.Session[urlAbsolutePath] = Common.Common.HasPermission;
                        }
                    }
                    context.Response.Clear();
                    context.Response.Write(permissionType);
                    context.Response.End();
                    break;
                default:
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private void DealAjax_PagePermission()
        {

        }


    }
}