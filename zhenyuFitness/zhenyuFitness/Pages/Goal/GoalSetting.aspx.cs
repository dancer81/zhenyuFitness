﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.Common;
using zhenyuFitness.DAO;
using zhenyuFitness.MasterPages;

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

        public string gender;
        public string age;
        //public string resourceRootPath = Common.Common.ResourceRootPath;

        //private MssqlDal dal;
        //private HttpRequest request = HttpContext.Current.Request;
        //private CommonWeb commonWeb = new CommonWeb(HttpContext.Current);

        protected new void Page_Load(object sender, EventArgs e)
        {
            //dal = new MssqlDal(Common.Common.DBConnectionStr, Server.MapPath(Common.Common.DbLog));
            base.Page_Load(sender, e);
            ((generalMaster)this.Master).pagePath = @"<li><a href='../Home/FitSpaceHome.aspx'>FitSpace社区</a></li><li>目标</li><li>健身目标制定</li>";
            if (request.Form.Count == 0)
            {
                this.InitPage();
            }
            else
            {
                this.DealWithForm();
            }
        }

        private void HasProcessingGoal()
        {
            if(!Common.Common.OpenGoalSettingPrivilege)
            {
                return;
            }

            string sql = string.Format(@"
                SELECT [ID] FROM [zhenyuFitness].[dbo].[UserBFRGoal] 
                where Valid = 1 and IsProcessing = 1 and UserID = '{0}'", Session["UserID"].ToString());
            DataTable dtIDs = dal.DoSelectToTable(sql, "");
            if (dtIDs != null && dtIDs.Rows.Count > 0)
            {
                string callback = string.Format("function(){{ window.location = '{0}'}}", "MyGoal.aspx");
                commonWeb.MessageBoxAlertWithCallBack(Page, "您已有正在进行的健身目标，点击确定跳转至“我的目标”页面。", "hasgoal", callback);
            }
        }

        private void InitPage()
        {
            this.HasProcessingGoal();
            //初始化用户的年龄和性别
            if (Common.Common.NoneOrEmptyString( Session["Age"]) || Common.Common.NoneOrEmptyString(Session["Gender"]))
            {
                commonWeb.MessageBox(Page, "获取用户的性别和年龄时出错！", "erroragegender1");
                return;
            }
            this.age = Session["Age"].ToString();
            this.gender = Session["Gender"].ToString();


        }

        //只处理Form Submit。ajax处理请求移至DealAjax.ashx
        private void DealWithForm()
        {
            //step 1
            this.startHeight = float.Parse(Common.Common.ObjectToString(request.Form["startHeight"]));
            this.startWeight = float.Parse(Common.Common.ObjectToString(request.Form["startWeight"]));
            this.startWaistSize = float.Parse(Common.Common.ObjectToString(request.Form["startWaist"]));
            //step 2
            this.goalDirection = this.translateFitnesstarget(request.Form["selectfitnesstarget"]);
            //step 3
            this.startBFR = float.Parse(Common.Common.ObjectToString(request.Form["defaultBFR"]));
            //step 4
            if(Session["Gender"] != null)
            {
                this.goalPhysique = this.translatePhysique(request.Form["selectphysique"], Session["Gender"].ToString());
            }
            else
            {
                commonWeb.MessageBox(Page, "出错，获取不到用户的性别！", "errorgender1");
                return;
            }
            //step 5
            this.goalBFR = float.Parse(Common.Common.ObjectToString(request.Form["goalBFR"]));
            this.goalWeight = float.Parse(Common.Common.ObjectToString(request.Form["goalWeight"]));
            //step 6
            this.goalCostDays = int.Parse(Common.Common.ObjectToString(request.Form["goalCostDays"]));

            if(Common.Common.NoneOrEmptyString(Session["UserID"]))
            {
                commonWeb.MessageBox(Page, "您尚未登录，请登录后重试。", "erroruserid1");
                return;
            }
            string guid = Guid.NewGuid().ToString();
            string sql =
                string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[UserBFRGoal]
                           ([ID]
                           ,[UserID]
                           ,[Height]
                           ,[GoalPhysique]
                           ,[StartWeight]
                           ,[StartBodyFat]
                           ,[StartWaistSize]
                           ,[IsKnowBFR]
                           ,[GoalDirection]
                           ,[GoalWeight]
                           ,[GoalBodyFat]
                           ,[GoalStartDate]
                           ,[GoalCostDays]
                           ,[Status]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           ('{13}'
                           ,'{0}'
                           ,{1}
                           ,{2}
                           ,{3}
                           ,{4}
                           ,{5}
                           ,{6}
                           ,{7}
                           ,{8}
                           ,{9}
                           ,GETDATE()
                           ,{10}
                           ,{14}
                           ,'{11}'
                           ,GETDATE()
                           ,'{12}'
                           ,GETDATE()
                           ,1)", Session["UserID"].ToString(), this.startHeight,
                           this.goalPhysique, this.startWeight, this.startBFR, this.startWaistSize,
                           this.isKnowBFR ? 0 : 1, this.goalDirection, this.goalWeight, this.goalBFR,
                           this.goalCostDays, Session["UserID"].ToString(), Session["UserID"].ToString(),guid,(int)Common.Common.BFRGoalStatus.Processing);
            try
            {
                dal.ExecSQL(sql);
            }
            catch(System.Data.SqlClient.SqlException ex)
            {
                commonWeb.MessageBox(Page, "保存健身目标时出错！", "inserterror1");
                return;
            }

            #region track
            string sqlTrackActivity = 
                string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[TrackActivity]
                   ([ID]
                   ,[UserID_Master]
                   ,[Type]
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
                   ,GETDATE()
                   ,'{3}'
                   ,GETDATE()
                   ,1)", Session["UserID"].ToString(),(int)Common.Common.ActivityTracked.AddFitnessGoal,
                   Session["UserID"].ToString(), Session["UserID"].ToString());

            try
            {
                dal.ExecSQL(sqlTrackActivity);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                commonWeb.MessageBox(Page, "保存Track健身目标制定时出错！", "inserterror2");
            }
            #endregion

            Response.Redirect("MyGoal.aspx");
        }

        private int translateFitnesstarget(object o)
        {
            string fitnesstargetValue = Common.Common.ObjectToString(o);
            if (fitnesstargetValue != string.Empty)
            {
                switch (fitnesstargetValue)
                {
                    case "0":
                        return (int)Common.Common.GoalDirection.GainMuscle;
                    case "1":
                        return (int)Common.Common.GoalDirection.LoseFat;
                    case "2":
                        return (int)Common.Common.GoalDirection.Transform;
                    case "3":
                        return (int)Common.Common.GoalDirection.Enduarence;
                    case "4":
                        return (int)Common.Common.GoalDirection.Sports;
                    case "5":
                        return (int)Common.Common.GoalDirection.Flexibility;
                    case "6":
                        return (int)Common.Common.GoalDirection.Other;
                    default:
                        return -2;
                }
            }
            return -1;
        }

        private int translatePhysique(object o,string gender)
        {
            string physique = Common.Common.ObjectToString(o);
            int retPhysique;
            if(physique != string.Empty)
            {
                switch(physique)
                {
                    case "0":
                        retPhysique = (int)(gender == "0" ? Common.Common.GoalPhysique.Male_SkinnyRipped : Common.Common.GoalPhysique.Female_Model);
                        break;
                    case "1":
                        retPhysique = (int)(gender == "0" ? Common.Common.GoalPhysique.Male_Model : Common.Common.GoalPhysique.Female_SwimSuit);
                        break;
                    case "2":
                        retPhysique = (int)(gender == "0" ? Common.Common.GoalPhysique.Male_Athlete : Common.Common.GoalPhysique.Female_FitWomen);
                        break;
                    case "3":
                        retPhysique = (int)(gender == "0" ? Common.Common.GoalPhysique.Male_Bodybuilder : Common.Common.GoalPhysique.Female_FitnessModel);
                        break;
                    case "4":
                        retPhysique = (int)(gender == "0" ? Common.Common.GoalPhysique.Male_Strongman : Common.Common.GoalPhysique.Femal_BodyBuilder);
                        break;
                    case "5":
                        retPhysique = (int)Common.Common.GoalPhysique.Male_ProBodybuilder;
                        break;
                    default:
                        retPhysique = -2;
                        break;
                }
                return retPhysique;
            }
            return -1;
        }
    }
}