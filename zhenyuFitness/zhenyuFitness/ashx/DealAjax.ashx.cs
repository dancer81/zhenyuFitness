using System;
using System.Collections.Generic;
using System.Data;
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
                    string addOtherGoal_retType = this.AddStrengthGoal(context);

                    context.Response.Clear();
                    context.Response.Write(addOtherGoal_retType);
                    context.Response.End();
                    break;
                case "updateLiftWeightStats":
                    int updateLiftWeightStats_retType = this.UpdateLiftWeightStats(context);

                    context.Response.Clear();
                    context.Response.Write(updateLiftWeightStats_retType);
                    context.Response.End();
                    break;
                case "deleteOtherGoal":
                    int deleteStrengthGoal_retType = this.DeleteStrengthGoal(context);

                    context.Response.Clear();
                    context.Response.Write(deleteStrengthGoal_retType);
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

        //更新当前体脂率
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

        //删除当前BFR健身目标
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

        //增加力量型健身目标
        private string AddStrengthGoal(HttpContext context)
        {
            string retType = "0";
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                retType = "1";
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

                string sqlSelect = string.Format(@"SELECT [ID] FROM [zhenyuFitness].[dbo].[UserOtherGoal] 
                    where UserID = '{0}' and Valid = 1 and TypeMain={2} and TypeSub={3} and [GoalStatus] = {1}", userID,(int)Common.Common.OtherGoalStatus.Processing, listType[0], listType[1]);
                DataTable dtSelect = dal.DoSelectToTable(sqlSelect, "");
                if(dtSelect != null && dtSelect.Rows.Count > 0)
                {
                    retType = "3";//有未完成且尚在进行中的力量型目标
                    return retType;
                }

                string guid = Guid.NewGuid().ToString();
                //List<string> listType = this.getOtherGoalType(type);
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
                    ('{11}'
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
                    ,{10})", userID,listType[0],listType[1],startValue,goalValue, goalDaysCount,(int)Common.Common.OtherGoalStatus.Processing, startLiftWeight, startRepsCount, goalLiftWeight, goalRepsCount,guid);

                string insertIntoTrackActivity = string.Format(@"
                    INSERT INTO [zhenyuFitness].[dbo].[TrackActivity]
                           ([ID]
                           ,[UserID_Master]
                           ,[Type]
                           ,[ActivityID]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           (NEWID()
                           ,'{0}'
                           ,{1}
                           ,'{2}'
                           ,'{0}'
                           ,GETDATE()
                           ,'{0}'
                           ,GETDATE()
                           ,1)", context.Session["UserID"].ToString()
                           , this.getTrackActivityType("add", type), guid);
                List<string> listSql = new List<string>() { sqlAddOtherGoal, insertIntoTrackActivity };
                try
                {
                    dal.ExecuteSqlTran(listSql);
                    retType = guid;
                }
                catch
                {
                    retType = "2";
                }
            }
            return retType;
        }

        //更新力量型目标的当前数据
        private int UpdateLiftWeightStats(HttpContext context)
        {
            int retType = 0;
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                return retType;

            }

            string type = context.Request.Form["type"].ToString();
            List<string> listType = this.getOtherGoalType(type);

            string currentWeight = context.Request.Form["currentWeight"].ToString();
            string currentReps = context.Request.Form["currentReps"].ToString();
            string oneRepsMax = context.Request.Form["oneRepsMax"].ToString();
            string strengthGoalID = context.Request.Form["strengthGoalID"].ToString();
            string goalAmount = context.Request.Form["goalAmounts"].ToString();

            string idTrackStrengthGoal = Guid.NewGuid().ToString();
            string sqlInsertTrackStrengthGoal = string.Format(@"
                INSERT INTO [zhenyuFitness].[dbo].[TrackStrengthGoal]
                   ([ID]
                   ,[UserID]
                   ,[TypeMain]
                   ,[TypeSub]
                   ,[LiftWeightAmount]
                   ,[LiftWeightReps]
                   ,[OneRepsMax]
                   ,[CreateDate]
                   ,[CreateUser]
                   ,[LastModifiedDate]
                   ,[LastModifedUser]
                   ,[Valid]
                   ,[StrengthGoalID])
             VALUES
                   ('{6}'
                   ,'{0}'
                   ,{1}
                   ,{2}
                   ,{3}
                   ,{4}
                   ,{5}
                   ,GETDATE()
                   ,'{0}'
                   ,GETDATE()
                   ,'{0}'
                   ,1
                   ,'{7}')", context.Session["UserID"].ToString(), listType[0], listType[1], currentWeight, currentReps, oneRepsMax, idTrackStrengthGoal,strengthGoalID);

            string insertIntoTrackActivity = string.Format(@"
                    INSERT INTO [zhenyuFitness].[dbo].[TrackActivity]
                           ([ID]
                           ,[UserID_Master]
                           ,[Type]
                           ,[ActivityID]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           (NEWID()
                           ,'{0}'
                           ,{1}
                           ,'{2}'
                           ,'{0}'
                           ,GETDATE()
                           ,'{0}'
                           ,GETDATE()
                           ,1)", context.Session["UserID"].ToString()
                           , this.getTrackActivityType("update", type), idTrackStrengthGoal);

            List<string> listSql = new List<string>() { sqlInsertTrackStrengthGoal, insertIntoTrackActivity };
            try
            {
                dal.ExecuteSqlTran(listSql);
                retType = 1;

                ///如果该力量型目标完成，则更新目标完成状态
                if(int.Parse(goalAmount) <= int.Parse(oneRepsMax))
                {
                    string sql = string.Format(@"UPDATE [zhenyuFitness].[dbo].[UserOtherGoal]
                                                   SET 
                                                      [GoalStatus] = {0}
                                                      ,[LastModifiedDate] = GETDATE()
                                                 WHERE ID = '{1}' and Valid = 1", (int)Common.Common.OtherGoalStatus.Achieved, strengthGoalID);
                    dal.ExecSQL(sql);

                    retType = 3;//正常，且目标完成
                }
            }
            catch
            {
                retType = 2;
            }
            return retType;
        }

        //删除力量型目标
        private int DeleteStrengthGoal(HttpContext context)
        {
            int retType = 0;
            if (Common.Common.NoneOrEmptyString(context.Session["UserID"]))
            {
                return retType;

            }

            string guid = Guid.NewGuid().ToString();
            string strengthGoalID = context.Request.Form["strengthGoalID"].ToString();
            string type = context.Request.Form["type"].ToString();
            string userID = context.Session["UserID"].ToString();

            string sql_deleteTrackStrengthGoal = string.Format(@"
                UPDATE [zhenyuFitness].[dbo].[TrackStrengthGoal]
                   SET 
                      [Valid] = 0
                 WHERE [Valid]=1 and [UserID] = '{0}' and [StrengthGoalID] = '{1}'", userID,strengthGoalID);

            string sql_deleteUserOtherGoal = string.Format(@"
                UPDATE [zhenyuFitness].[dbo].[UserOtherGoal]
                   SET 
                      [GoalStatus] = {0}
                 WHERE [Valid] = 1 and [ID]='{1}'", (int)Common.Common.OtherGoalStatus.Canceled, strengthGoalID);

            string sql_insertIntoTrackActivity = string.Format(@"
                INSERT INTO [zhenyuFitness].[dbo].[TrackActivity]
                           ([ID]
                           ,[UserID_Master]
                           ,[Type]
                           ,[ActivityID]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           (NEWID()
                           ,'{0}'
                           ,{1}
                           ,'{2}'
                           ,'{0}'
                           ,GETDATE()
                           ,'{0}'
                           ,GETDATE()
                           ,1)", userID
                           , this.getTrackActivityType("delete", type), strengthGoalID);

            List<string> listSql = new List<string>() { sql_deleteTrackStrengthGoal, sql_deleteUserOtherGoal, sql_insertIntoTrackActivity };
            try
            {
                dal.ExecuteSqlTran(listSql);
                retType = 1;
            }
            catch
            {
                retType = 2;
            }
            return retType;
        }


















        //根据type(ajax过来)字段获取目标的类型
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

        private int getTrackActivityType(string opType,string type)
        {
            int trackActivityType = -1;
            if (opType=="add" && type == "squats")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_Squats;
            }
            else if (opType == "update" && type == "squats")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_Squats_CurrentStatus;
            }
            else if (opType == "delete" && type == "squats")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_Squats;
            }

            else if (opType == "add" && type == "deadLift")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_DeadLift;
            }
            else if (opType == "update" && type == "deadLift")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_DeadLift_CurrentStatus;
            }
            else if (opType == "delete" && type == "deadLift")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_DeadLift;
            }

            else if (opType == "add" && type == "barbellPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_BarbellPress;
            }
            else if (opType == "update" && type == "barbellPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_BarbellPress_CurrentStatus;
            }
            else if (opType == "delete" && type == "barbellPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_BarbellPress;
            }

            else if (opType == "add" && type == "shoulderPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_ShoulderPress;
            }
            else if (opType == "update" && type == "shoulderPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_ShoulderPress_CurrentStatus;
            }
            else if (opType == "delete" && type == "shoulderPress")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_ShoulderPress;
            }

            else if (opType == "add" && type == "barbellRow")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_BarbellRow;
            }
            else if (opType == "update" && type == "barbellRow")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_BarbellRow_CurrentStatus;
            }
            else if (opType == "delete" && type == "barbellRow")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_BarbellRow;
            }


            else if (opType == "add" && type == "barbellCurl")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.AddStrengthGoal_BarbellCurl;
            }
            else if (opType == "update" && type == "barbellCurl")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.UpdateStrengthGoal_BarbellCurl_CurrentStatus;
            }
            else if (opType == "delete" && type == "barbellCurl")
            {
                trackActivityType = (int)Common.Common.ActivityTracked.DeleteStrengthGoal_BarbellCurl;
            }






            else
            { }

            return trackActivityType;
        }
    }
}