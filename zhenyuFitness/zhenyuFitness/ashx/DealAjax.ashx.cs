using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using zhenyuFitness.DAO;

namespace zhenyuFitness.ashx
{
    /// <summary>
    /// DealAjax 的摘要说明
    /// </summary>
    public class DealAjax : IHttpHandler, IReadOnlySessionState
    {
        MssqlDal dal = new MssqlDal(Common.Common.DBConnectionStr, Common.Common.DbLog);
        public void ProcessRequest(HttpContext context)
        {
            string ajaxType = context.Request.Form["ajaxtype"].ToString();

            switch (ajaxType)
            {
                case "pagePermission":
                    int pagePermission_retType = this.PagePermission(context);
                    
                    context.Response.Clear();
                    context.Response.Write(pagePermission_retType);
                    context.Response.End();
                    break;
                case "updateCurrentWeight":
                    int updateCurrentWeight_retType = this.UpdateCurrentWeight(context);

                    context.Response.Clear();
                    context.Response.Write(updateCurrentWeight_retType);
                    context.Response.End();
                    break;
                case "updateCurrentBFR":
                    int updateCurrentBFR_retType = this.UpdateCurrentBFR(context);

                    context.Response.Clear();
                    context.Response.Write(updateCurrentBFR_retType);
                    context.Response.End();
                    break;
                case "deleteCurrentBFRGoal":
                    int deleteCurrentBFRGoal_retType = this.DeleteCurrentBFRGoal(context);

                    context.Response.Clear();
                    context.Response.Write(deleteCurrentBFRGoal_retType);
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

        //判断是否有权限访问页面
        private int PagePermission(HttpContext context)
        {
            Common.CommonWeb commonWeb = new Common.CommonWeb(context);

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

            return permissionType;
        }

        //更新当前体重
        private int UpdateCurrentWeight(HttpContext context)
        {
            int retType = 1;
            string goalID = context.Request.Form["goalID"].ToString();
            string currentWeight = context.Request.Form["currentWeight"].ToString();
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                retType = 0;
            }
            else
            {
                string sqlUpdateCurrentWeight = string.Format(@"
                        INSERT INTO [zhenyuFitness].[dbo].[TrackWeight]
                                   ([ID]
                                   ,[UserID]
                                   ,[GoalID]
                                   ,[Weight]
                                   ,[CreateDate]
                                   ,[CreateUser]
                                   ,[LastModifiedDate]
                                   ,[LastModifiedUser]
                                   ,[Valid])
                             VALUES
                                   (NEWID()
                                   ,'{0}'
                                   ,'{1}'
                                   ,{2}
                                   ,GETDATE()
                                   ,'{0}'
                                   ,GETDATE()
                                   ,'{0}'
                                   ,1)", context.Session["UserID"].ToString(), goalID, currentWeight);
                retType = dal.ExecSQL(sqlUpdateCurrentWeight);
            }

            return retType;
        }

        private int UpdateCurrentBFR(HttpContext context)
        {
            int retType = 1;
            string goalID = context.Request.Form["goalID"].ToString();
            string currentBFR = context.Request.Form["currentBFR"].ToString();
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                retType = 0;
            }
            else
            {
                string sqlUpdateCurrentBFR = string.Format(@"
                        INSERT INTO [zhenyuFitness].[dbo].[TrackBFR]
                                   ([ID]
                                   ,[UserID]
                                   ,[GoalID]
                                   ,[BodyfatRate]
                                   ,[CreateUser]
                                   ,[CreateDate]
                                   ,[LastModifiedUser]
                                   ,[LastModifiedDate]
                                   ,[Valid])
                             VALUES
                                   (NEWID()
                                   ,'{0}'
                                   ,'{1}'
                                   ,{2}
                                   ,'{0}'
                                   ,GETDATE()
                                   ,'{0}'
                                   ,GETDATE()
                                   ,1)", context.Session["UserID"].ToString(), goalID, currentBFR);
                retType = dal.ExecSQL(sqlUpdateCurrentBFR);
            }

            return retType;
        }

        private int DeleteCurrentBFRGoal(HttpContext context)
        {
            int retType = 1;
            string goalID = context.Request.Form["goalID"].ToString();


            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                retType = 0;
            }
            else
            {
                string sqlDeleteCurrentBFRGoal = string.Format(@"
                DELETE FROM [zhenyuFitness].[dbo].[UserBFRGoal] where [ID] = '{0}'", goalID);

                retType = dal.ExecSQL(sqlDeleteCurrentBFRGoal);
            }
            return retType;
        }
    }
}