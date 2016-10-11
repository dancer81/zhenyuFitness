using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.MasterPages;

namespace zhenyuFitness.Pages.Goal
{
    public partial class MyGoal : BasePage
    {
        protected new void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            
            if (request.Form.Count == 0)
            {
                this.InitPage();
            }
            else
            {
                this.DealWithForm();
            }
        }

        //
        private void InitPage()
        {
            //页面路径
            ((generalMaster)this.Master).pagePath = @"<li><a href='../Home/FitSpaceHome.aspx'>FitSpace社区</a></li><li>目标</li><li>我的目标</li>";

            this.InitPageData();

            this.InitGoalWeightAndBFSection();
            this.InitCurrentBodyCompositionSection();
            this.InitSecondRowSection();
            this.InitChartsSection();
            this.InitStrenthGoalSection();
            this.InitMesurementGoalSection();
            this.InitProgressPhotosSection();
        }

        private void DealWithForm()
        {

        }

        #region 本页面特有
        private string userID;
        //UserBFRGoal
        private float height;
        private int goalPhysique;
        private int liftingExperience;
        private int motivationLevel;
        private float startWeight;
        private float startBodyFat;
        private float startWaistSize;
        private int goalDirection;
        private float goalWeight;
        private float goalBodyFat;
        private float goalWaistSize;
        private DateTime goalStartDate;
        private int goalCostDays;
        private int goalAlertWeight;
        private int goalAlertBodyFat;
        private string picBeforeID;
        private string picCurrentID;
        private bool isExpired;
        private bool isAchieved;
        private bool isProcessing;
        private bool isCanceled;

        
        /// <summary>
        /// 初始化页面所需的数据
        /// </summary>
        /// <returns>0：初始化数据失败；1：初始化成功</returns>
        private int InitPageData()
        {
            if(Common.Common.NoneOrEmptyString(Session["UserID"]))
            {
                return 0;
            }
            this.userID = Session["UserID"].ToString();

            string sql = string.Format(@"
                SELECT [ID]
                  ,[UserID]
                  ,[Height]
                  ,[GoalPhysique]
                  ,[LiftingExperience]
                  ,[MotivationLevel]
                  ,[StartWeight]
                  ,[StartBodyFat]
                  ,[StartWaistSize]
                  ,[IsKnowBFR]
                  ,[GoalDirection]
                  ,[GoalWeight]
                  ,[GoalBodyFat]
                  ,[GoalWaistSize]
                  ,[GoalStartDate]
                  ,[GoalCostDays]
                  ,[GoalAlertWeight]
                  ,[GoalAlertBodyFat]
                  ,[PicBeforeID]
                  ,[PicCurrentID]
                  ,[IsExpired]
                  ,[IsAchieved]
                  ,[IsProcessing]
                  ,[IsCanceled]
              FROM [zhenyuFitness].[dbo].[UserBFRGoal] where Valid = 1 and UserID='{0}
              order by IsProcessing desc, IsAchieved desc, IsCanceled desc, IsExpired desc'", this.userID);

            DataTable dtBFRGoal = dal.DoSelectToTable(sql,"");
            if (dtBFRGoal != null && dtBFRGoal.Rows.Count > 0)
            {
                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["Height"]))
                {
                    this.height = float.Parse(dtBFRGoal.Rows[0]["Height"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalPhysique"]))
                {
                    this.goalPhysique = int.Parse(dtBFRGoal.Rows[0]["GoalPhysique"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["LiftingExperience"]))
                {
                    this.liftingExperience = int.Parse(dtBFRGoal.Rows[0]["LiftingExperience"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["MotivationLevel"]))
                {
                    this.motivationLevel = int.Parse(dtBFRGoal.Rows[0]["MotivationLevel"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["StartWeight"]))
                {
                    this.startWeight = float.Parse(dtBFRGoal.Rows[0]["StartWeight"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["StartBodyFat"]))
                {
                    this.startBodyFat = float.Parse(dtBFRGoal.Rows[0]["StartBodyFat"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["StartWaistSize"]))
                {
                    this.startWaistSize = float.Parse(dtBFRGoal.Rows[0]["StartWaistSize"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalDirection"]))
                {
                    this.goalDirection = int.Parse(dtBFRGoal.Rows[0]["GoalDirection"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalWeight"]))
                {
                    this.goalWeight = float.Parse(dtBFRGoal.Rows[0]["GoalWeight"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalBodyFat"]))
                {
                    this.goalBodyFat = float.Parse(dtBFRGoal.Rows[0]["GoalBodyFat"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalWaistSize"]))
                {
                    this.goalWaistSize = float.Parse(dtBFRGoal.Rows[0]["GoalWaistSize"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalStartDate"]))
                {
                    this.goalStartDate = DateTime.Parse(dtBFRGoal.Rows[0]["GoalStartDate"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalCostDays"]))
                {
                    this.goalCostDays = int.Parse(dtBFRGoal.Rows[0]["GoalCostDays"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalAlertWeight"]))
                {
                    this.goalAlertWeight = int.Parse(dtBFRGoal.Rows[0]["GoalAlertWeight"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["GoalAlertBodyFat"]))
                {
                    this.goalAlertBodyFat = int.Parse(dtBFRGoal.Rows[0]["GoalAlertBodyFat"].ToString());
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["PicBeforeID"]))
                {
                    this.picBeforeID = dtBFRGoal.Rows[0]["PicBeforeID"].ToString();
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["PicCurrentID"]))
                {
                    this.picCurrentID = dtBFRGoal.Rows[0]["PicCurrentID"].ToString();
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["IsExpired"]))
                {
                    this.isExpired = dtBFRGoal.Rows[0]["IsExpired"].ToString() == "1" ? true : false;
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["IsAchieved"]))
                {
                    this.isAchieved = dtBFRGoal.Rows[0]["IsAchieved"].ToString() == "1" ? true : false;
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["IsProcessing"]))
                {
                    this.isProcessing = dtBFRGoal.Rows[0]["IsProcessing"].ToString() == "1" ? true : false;
                }

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["IsCanceled"]))
                {
                    this.isCanceled = dtBFRGoal.Rows[0]["IsCanceled"].ToString() == "1" ? true : false;
                }
            }
            else return 0;



            return 1;
        }
        private void InitCurrentBodyCompositionSection()
        {

        }

        private void InitGoalWeightAndBFSection()
        {

        }

        private void InitSecondRowSection()
        {

        }

        private void InitChartsSection()
        {

        }

        private void InitStrenthGoalSection()
        {

        }

        private void InitMesurementGoalSection()
        {

        }

        private void InitProgressPhotosSection()
        {

        }

        #endregion
    }
}