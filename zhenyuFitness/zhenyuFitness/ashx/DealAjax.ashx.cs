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
        //删除时，更新LastModifiedDate
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
                case "addOtherGoal_squats":
                case "addOtherGoal_deadLift":
                case "addOtherGoal_barbellPress":
                case "addOtherGoal_shoulderPress":
                case "addOtherGoal_barbellRow":
                case "addOtherGoal_barbellCurl":
                    int addOtherGoal_retType = this.AddOtherGoal(context);

                    context.Response.Clear();
                    context.Response.Write(addOtherGoal_retType);
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
                string sqlDeleteCurrentBFRGoal = string.Format(@"UPDATE [zhenyuFitness].[dbo].[UserBFRGoal] SET [Valid] = 0 WHERE ID = '{0}'", goalID);
                string sqlDeleteTrackWeight = string.Format(@"UPDATE [zhenyuFitness].[dbo].[TrackWeight] SET [Valid] = 0 WHERE GoalID = '{0}'", goalID);
                string sqlDeleteTrackBFR = string.Format(@"UPDATE [zhenyuFitness].[dbo].[TrackBFR] SET [Valid] = 0 WHERE GoalID = '{0}'", goalID);

                try
                {
                    dal.ExecuteSqlTran(new List<string> { sqlDeleteTrackWeight, sqlDeleteTrackBFR, sqlDeleteCurrentBFRGoal });
                }
                catch
                {
                    retType = 0;
                }
            }
            return retType;
        }

        private int AddOtherGoal(HttpContext context)
        {
            int retType = 0;
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                retType = 1;
            }
            else
            {
                string type = context.Request.Form["type"].ToString();
                string startValue = context.Request.Form["startValue"].ToString();
                string goalValue = context.Request.Form["goalValue"].ToString();
                string goalDaysCount = context.Request.Form["goalDaysCount"].ToString();
                string userID = context.Session["UserID"].ToString();
                string startLiftWeight = context.Request.Form["startLiftWeight"].ToString();
                string startRepsCount = context.Request.Form["startRepsCount"].ToString();
                string goalLiftWeight = context.Request.Form["goalLiftWeight"].ToString();
                string goalRepsCount = context.Request.Form["goalRepsCount"].ToString();

                List<string> listType = this.getOtherGoalType(type);
                string sqlAddOtherGoal = string.Format(@"
                INSERT INTO [zhenyuFitness].[dbo].[UserOtherGoal]
                    ([ID]
                    ,[UserID]
                    ,[TypeMain]
                    ,[TypeSub]
                    ,[StartValue]
                    ,[GoalValue]
                    ,[GoalDaysCount]
                    ,[GoalStatus]
                    ,[CreateDate]
                    ,[CreateUser]
                    ,[LastModifiedDate]
                    ,[LastModifiedUser]
                    ,[Valid]
                    ,[StartLiftWeightAmount]
                    ,[StartLiftWeightReps]
                    ,[GoalLiftWeightAmount]
                    ,[GoalLiftWeightReps])
                VALUES
                    (NEWID()
                    ,'{0}'
                    ,{1}
                    ,{2}
                    ,{3}
                    ,{4}
                    ,{5}
                    ,{6}
                    ,GETDATE()
                    ,'{0}'
                    ,GETDATE()
                    ,'{0}'
                    ,1
                    ,{7}
                    ,{8}
                    ,{9}
                    ,{10})", userID,listType[0],listType[1],startValue,goalValue, goalDaysCount,(int)Common.Common.OtherGoalStatus.Processing, startLiftWeight, startRepsCount, goalLiftWeight, goalRepsCount);

                try
                {
                    dal.ExecSQL(sqlAddOtherGoal);
                    retType = 2;
                }
                catch
                {
                    retType = 3;
                }
            }
            return retType;
        }

        private List<string> getOtherGoalType(string type)
        {
            List<string> listType = new List<string>();
            if(type == "squats")
            {
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.Squats).ToString());
            }
            else if(type == "deadLift"){
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.DeadLift).ToString());
            }
            else if(type == "barbellPress")
            {
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.BarbellPress).ToString());
            }
            else if(type == "shoulderPress")
            {
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.ShoulderPress).ToString());
            }
            else if(type == "barbellRow")
            {
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.BarbellRow).ToString());
            }
            else if(type == "barbellCurl")
            {
                listType.Add(((int)Common.Common.GoalTypeBasic.Strength).ToString());
                listType.Add(((int)Common.Common.GoalTypeStrength.BarbellCurl).ToString());
            }
            else
            { }
            return listType;
        }
    }
}