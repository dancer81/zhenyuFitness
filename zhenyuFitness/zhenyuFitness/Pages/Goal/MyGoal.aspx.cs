using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.MasterPages;
using static zhenyuFitness.Common.Common;

namespace zhenyuFitness.Pages.Goal
{
    public partial class MyGoal : BasePage
    {
        //未完成：TrackActivity、更新后刷新图标、第三个图表、（已完成、已过期、已取消3种状态页面上的不同显示）、状态的更新判断
        private string userID;

        protected new void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (request.Form.Count == 0)
            {
                this.InitPage();

                this.InitPageSections();
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

            if (!this.InitPageData())
            {
                commonWeb.MessageBox(Page, "数据加载失败！请重试。", "loaddatafail");
                return;
            }


        }

        private void DealWithForm()
        {

        }

        #region 本页面特有
        //UserBFRGoal
        private string goalID;
        private float height;
        private int goalPhysique = -1;
        private int liftingExperience;
        private int motivationLevel;
        private float startWeight;
        private float startBodyFat;
        private float startWaistSize;
        private int goalDirection = -1;
        private float goalWeight;
        private float goalBodyFat;
        private float goalWaistSize;
        private DateTime goalStartDate;
        private int goalCostDays;
        private int goalAlertWeight;
        private int goalAlertBodyFat;
        private string picBeforeID;
        private string picCurrentID;
        private int status;

        private float lastMeasuredWeight = 0;
        private DateTime lastWeightMeasuredDate = DateTime.Parse(Common.Common.DateTiemPassedForCertain);
        private float lastMeasuredBFR = 0;
        private DateTime lastBFRMeasuredDate = DateTime.Parse(Common.Common.DateTiemPassedForCertain);
        private string weightHistory = string.Empty;
        private string weightHistoryDate = string.Empty;
        private string bfrHistory = string.Empty;
        private string bfrHistoryDate = string.Empty;
        //private List<Pair> weightHistory = new List<Pair>();
        private string squatsID = string.Empty;
        private string deadLiftID = string.Empty;
        private string barbellPress = string.Empty;
        private string shoulderPress = string.Empty;
        private string barbellRow = string.Empty;
        private string barbellCurl = string.Empty;

        public string SquatsID
        {
            get
            {
                return "55FFF643-8EA6-4DF5-BCB8-44EF3DC78E22";
            }
        }

        public string GoalID
        {
            get
            {
                return this.goalID;
            }
        }

        #region 前台属性
        public string StartWeight
        {
            get
            {
                return this.startWeight.ToString("0.0"); ;
            }
        }

        public string CurrentWeight
        {
            get
            {
                if (this.lastMeasuredWeight != 0) return this.lastMeasuredWeight.ToString("0.0");
                else return this.startWeight.ToString("0.0");
            }
        }

        public string GoalWeight
        {
            get
            {
                return this.goalWeight.ToString("0.0");
            }
        }

        public string WeightGoalAchievedPercent
        {
            get
            {
                if(this.goalWeight < this.startWeight)
                {
                    if (float.Parse(this.CurrentWeight) < this.startWeight)
                    {
                        if (string.IsNullOrEmpty(this.goalID)) return "0";
                        float changePercent = (100 * (float.Parse(this.CurrentWeight) - float.Parse(this.StartWeight)) / (float.Parse(this.GoalWeight) - float.Parse(this.StartWeight)));
                        return changePercent > 0 ? changePercent.ToString("0.0") : (0 - changePercent).ToString("0.0");
                    }
                    else
                        return "0";
                }
                else
                {
                    if (float.Parse(this.CurrentWeight) >= this.startWeight)
                    {
                        if (string.IsNullOrEmpty(this.goalID)) return "0";
                        float changePercent = (100 * (float.Parse(this.CurrentWeight) - float.Parse(this.StartWeight)) / (float.Parse(this.GoalWeight) - float.Parse(this.StartWeight)));
                        return changePercent > 0 ? changePercent.ToString("0.0") : (0 - changePercent).ToString("0.0");
                    }
                    else
                        return "0";
                }
            }
        }

        public string WeightChangeTotal
        {
            get
            {
                float weightchange = float.Parse(this.CurrentWeight) - float.Parse(this.StartWeight);
                return weightchange > 0 ? weightchange.ToString("0.0") : (0 - weightchange).ToString("0.0");
            }
        }

        public string WeightChangeDirection
        {
            get
            {
                float weightchange = float.Parse(this.CurrentWeight) - float.Parse(this.StartWeight);
                return weightchange > 0 ? "总共增加" : weightchange == 0 ? "没有变化" : "总共减少";
            }
        }

        public string WeightHistory
        {
            get
            {
                return this.weightHistory;
            }
        }

        public string WeightHistoryDate
        {
            get
            {
                return this.weightHistoryDate;
            }
        }

        public string StartBFR
        {
            get
            {
                return this.startBodyFat.ToString("0.0");
            }
        }

        public string CurrentBFR
        {
            get
            {
                if (this.lastMeasuredBFR != 0) return this.lastMeasuredBFR.ToString("0.0");
                else return this.startBodyFat.ToString("0.0");
            }
        }

        public string GoalBFR
        {
            get
            {
                return this.goalBodyFat.ToString("0.0");
            }
        }

        public string BFRGoalAchievedPercent      //有问题，需根据方向判断完成率
        {
            get
            {
                if (this.goalBodyFat < this.startBodyFat)
                {
                    if (float.Parse(this.CurrentBFR) < this.startBodyFat)
                    {
                        if (string.IsNullOrEmpty(this.goalID)) return "0";
                        float changePercent = (100 * (float.Parse(this.CurrentBFR) - float.Parse(this.StartBFR)) / (float.Parse(this.GoalBFR) - float.Parse(this.StartBFR)));
                        return changePercent > 0 ? changePercent.ToString("0") : (0 - changePercent).ToString("0.0");
                    }
                    return "0";
                }
                else
                {
                    if (float.Parse(this.CurrentBFR) >= this.startBodyFat)
                    {
                        if (string.IsNullOrEmpty(this.goalID)) return "0";
                        float changePercent = (100 * (float.Parse(this.CurrentBFR) - float.Parse(this.StartBFR)) / (float.Parse(this.GoalBFR) - float.Parse(this.StartBFR)));
                        return changePercent > 0 ? changePercent.ToString("0") : (0 - changePercent).ToString("0.0");
                    }

                    return "0";
                }


                //if (string.IsNullOrEmpty(this.goalID)) return "0";
                //float changePercent = (100 * (float.Parse(this.CurrentBFR) - float.Parse(this.StartBFR)) / (float.Parse(this.GoalBFR) - float.Parse(this.StartBFR)));
                //return changePercent > 0 ? changePercent.ToString("0") : (0 - changePercent).ToString("0.0");
            }
        }

        public string BFRChangeTotal
        {
            get
            {
                float bfrchange = float.Parse(this.CurrentBFR) - float.Parse(this.StartBFR);
                return bfrchange > 0 ? bfrchange.ToString("0.0") : (0 - bfrchange).ToString("0.0");
            }
        }

        public string BFRChangeDirection
        {
            get
            {
                float bfrchange = float.Parse(this.CurrentBFR) - float.Parse(this.StartBFR);
                return bfrchange > 0 ? "总共增加" : (bfrchange == 0 ? "没有变化" : "总共减少");
            }
        }

        public string BFRHistory
        {
            get
            {
                return this.bfrHistory;
            }
        }

        public string BFRHistoryDate
        {
            get
            {
                return this.bfrHistoryDate;
            }
        }

        public string CurrentLeanBodyWeight
        {
            get
            {
                return (float.Parse(this.CurrentWeight) * (100 - float.Parse(this.CurrentBFR)) / 100).ToString("0.0"); ;
            }
        }

        public string LeanBodyWeightChangeTotal
        {
            get
            {
                float leanchange = float.Parse(CurrentLeanBodyWeight) - float.Parse(this.StartWeight) * (100 - float.Parse(this.StartBFR)) / 100;
                return leanchange > 0 ? leanchange.ToString("0.0") : (0 - leanchange).ToString("0.0");
            }
        }

        public string LeanBodyWeightChangeDirection
        {
            get
            {
                float leanchange = float.Parse(CurrentLeanBodyWeight) - float.Parse(this.StartWeight) * (100 - float.Parse(this.StartBFR)) / 100;
                return leanchange > 0 ? "总共增加" : leanchange == 0 ? "没有变化" : "总共增加";
            }
        }

        public string CurrentBodyFatWeight
        {
            get
            {
                return (float.Parse(this.CurrentWeight) * float.Parse(this.CurrentBFR) / 100).ToString("0.0");
            }
        }

        public string BodyfatChangeTotal
        {
            get
            {
                float bfchange = float.Parse(this.CurrentBodyFatWeight) - float.Parse(this.StartWeight) * (float.Parse(this.StartBFR)) / 100;
                return bfchange > 0 ? bfchange.ToString("0.0") : (0 - bfchange).ToString("0.0");
            }
        }

        public string BodyfatChangeDirection
        {
            get
            {
                float bfchange = float.Parse(this.CurrentBodyFatWeight) - float.Parse(this.StartWeight) * (float.Parse(this.StartBFR)) / 100;
                return bfchange > 0 ? "总共增加" : bfchange == 0 ? "没有变化" : "总共减少";
            }
        }

        public string GoalPhysiqueImg
        {
            get
            {
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_SkinnyRipped) return Common.Common.ResourceRootPath + "/img/physique/man/skinny_ripped-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Model) return Common.Common.ResourceRootPath + "/img/physique/man/male_model-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Athlete) return Common.Common.ResourceRootPath + "/img/physique/man/athlete-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Bodybuilder) return Common.Common.ResourceRootPath + "/img/physique/man/bodybuilder-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Strongman) return Common.Common.ResourceRootPath + "/img/physique/man/strongman-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_ProBodybuilder) return Common.Common.ResourceRootPath + "/img/physique/man/pro_bodybuilder-large.png";

                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_Model) return Common.Common.ResourceRootPath + "/img/physique/women/fashion_model-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_SwimSuit) return Common.Common.ResourceRootPath + "/img/physique/women/swimsuit-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_FitWomen) return Common.Common.ResourceRootPath + "/img/physique/women/fit_woman-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_FitnessModel) return Common.Common.ResourceRootPath + "/img/physique/women/fitness_model-large.png";
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Femal_BodyBuilder) return Common.Common.ResourceRootPath + "/img/physique/women/bodybuilder-large.png";

                //登录了，但没设定目标
                if (!Common.Common.NoneOrEmptyString(Session["Gender"]))
                {
                    if (Session["Gender"].ToString() == "0")
                    {
                        return Common.Common.ResourceRootPath + "/img/physique/man/skinny_ripped-large.png";
                    }
                    else
                    {
                        return Common.Common.ResourceRootPath + "/img/physique/women/fashion_model-large.png";
                    }
                }
                //没有登录
                return Common.Common.ResourceRootPath + "/img/physique/man/skinny_ripped-large.png";
            }

        }

        public string GoalPhysiqueDesc
        {
            get
            {
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_SkinnyRipped) return Common.Common.Male_SkinnyRippedDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Model) return Common.Common.Male_ModelDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Athlete) return Common.Common.Male_AthleteDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Bodybuilder) return Common.Common.Male_BodybuilderDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_Strongman) return Common.Common.Male_StrongmanDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Male_ProBodybuilder) return Common.Common.Male_ProBodybuilderDesc;

                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_Model) return Common.Common.Female_ModelDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_SwimSuit) return Common.Common.Female_SwimSuitDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_FitWomen) return Common.Common.Female_FitWomenDesc;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Female_FitnessModel) return Common.Common.Female_FitnessModel;
                if (this.goalPhysique == (int)Common.Common.GoalPhysique.Femal_BodyBuilder) return Common.Common.Female_Bodybuilder;

                return "尚未制定";
            }
        }

        public string GoalDirectionDesc
        {
            get
            {
                if (this.goalDirection == (int)Common.Common.GoalDirection.GainMuscle) return Common.Common.GainMuscleDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.LoseFat) return Common.Common.LoseFatDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.Transform) return Common.Common.TransformDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.Sports) return Common.Common.SportsDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.Flexibility) return Common.Common.FlexibilityDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.Enduarence) return Common.Common.EnduarenceDesc;
                if (this.goalDirection == (int)Common.Common.GoalDirection.Other) return Common.Common.OtherDesc;

                return "尚未制定";
            }
        }

        public string GoalStartDate
        {
            get
            {
                return this.goalStartDate.ToString("yyyy-MM-dd");
            }
        }
        public int GoalDaysLeft
        {
            get
            {
                int daysLeft = this.goalCostDays - DateTime.Today.Subtract(this.goalStartDate).Days;
                if (daysLeft > 0) return daysLeft;
                return 0;
            }
        }

        public int LastWeightMeasuredDayInterval
        {//当前时间距离上次体重测量日期已经有多少天了
            get
            {
                return DateTime.Today.Subtract(this.lastWeightMeasuredDate).Days;
            }
        }

        public int LastBFRMeasuredDayInterval
        {
            get
            {
                return DateTime.Today.Subtract(this.lastBFRMeasuredDate).Days;
            }
        }

        public string Status
        {
            get
            {
                return this.status.ToString();
            }
        }
        #endregion

        /// <summary>
        /// 初始化页面所需的数据
        /// </summary>
        /// <returns>0：初始化数据失败；1：初始化成功</returns>
        private bool InitPageData()
        {
            if (Common.Common.NoneOrEmptyString(Session["UserID"]))
            {
                return false;
            }
            this.userID = Session["UserID"].ToString();

            if (this.LoadUserBFRGoalData() && this.LoadUserWeightTrack() && this.LoadUserBFRTrack())
            {
                return true;
            }
            return false;


        }

        private bool LoadUserBFRGoalData()
        {
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
                  ,[Status]
              FROM [zhenyuFitness].[dbo].[UserBFRGoal] where Valid = 1 and UserID='{0}'
              order by Status asc, CreateDate desc", this.userID);
            DataTable dtBFRGoal;
            try
            {
                dtBFRGoal = dal.DoSelectToTable(sql, "");
            }
            catch
            {
                commonWeb.MessageBox(Page, "健身目标加载失败！", "failureLoadGoalData");
                return false;
            }
            if (dtBFRGoal != null && dtBFRGoal.Rows.Count > 0)
            {
                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["ID"]))
                {
                    this.goalID = dtBFRGoal.Rows[0]["ID"].ToString();
                }

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

                if (!Common.Common.NoneOrEmptyString(dtBFRGoal.Rows[0]["Status"]))
                {
                    this.status = int.Parse(dtBFRGoal.Rows[0]["Status"].ToString());
                }
            }
            else
            {
                commonWeb.MessageBox(Page, "您尚未制定健身目标！", "nofitnessgoal");
            }
            return true;
        }

        private bool LoadUserWeightTrack()
        {
            string sql = string.Format(@"
                SELECT [ID]
                  ,[UserID]
                  ,[GoalID]
                  ,[Weight]
                  ,[CreateDate]
                  ,[CreateUser]
                  ,[LastModifiedDate]
                  ,[LastModifiedUser]
                  ,[Valid]
              FROM [zhenyuFitness].[dbo].[TrackWeight]
              where Valid = 1 and UserID='{0}' and GoalID='{1}' 
              order by LastModifiedDate desc", this.userID, this.goalID);

            DataTable dtTrackWeight;
            try
            {
                dtTrackWeight = dal.DoSelectToTable(sql, "");
            }
            catch
            {
                commonWeb.MessageBox(Page, "体重数据加载失败！", "failureLoadWeightDate");
                return false;
            }

            if (dtTrackWeight != null && dtTrackWeight.Rows.Count > 0)
            {
                if (!Common.Common.NoneOrEmptyString(dtTrackWeight.Rows[0]["Weight"]))
                {
                    this.lastMeasuredWeight = float.Parse(dtTrackWeight.Rows[0]["Weight"].ToString());
                }
                if (!Common.Common.NoneOrEmptyString(dtTrackWeight.Rows[0]["LastModifiedDate"]))
                {
                    this.lastWeightMeasuredDate = DateTime.Parse(dtTrackWeight.Rows[0]["LastModifiedDate"].ToString());
                }

            }
            else
            {
                this.lastWeightMeasuredDate = this.goalStartDate;
            }

            //设置weightHistory
            foreach (DataRow dr in dtTrackWeight.Rows)
            {
                if (!Common.Common.NoneOrEmptyString(dr["Weight"]) && !Common.Common.NoneOrEmptyString(dr["LastModifiedDate"]))
                {
                    this.weightHistory = dr["Weight"].ToString() + "," + this.weightHistory;
                    this.weightHistoryDate = dr["LastModifiedDate"].ToString() + "," + this.weightHistoryDate;
                }
            }
            if (this.weightHistory.Length >= 1)
            {
                this.weightHistory = this.weightHistory.Substring(0, this.weightHistory.Length - 1);
            }
            else
            {
                this.weightHistory = string.Empty;
            }
            if (this.weightHistoryDate.Length >= 1)
            {
                this.weightHistoryDate = this.weightHistoryDate.Substring(0, this.weightHistoryDate.Length - 1);
            }
            else
            {
                this.weightHistoryDate = string.Empty;
            }

            return true;
        }

        private bool LoadUserBFRTrack()
        {
            string sql = string.Format(@"
                SELECT [ID]
                  ,[UserID]
                  ,[GoalID]
                  ,[BodyfatRate]
                  ,[CreateUser]
                  ,[CreateDate]
                  ,[LastModifiedUser]
                  ,[LastModifiedDate]
                  ,[Valid]
              FROM [zhenyuFitness].[dbo].[TrackBFR]
              where Valid = 1 and UserID='{0}' and GoalID='{1}' 
              order by CreateDate desc", this.userID, this.goalID);

            DataTable dtTrackBFR;
            try
            {
                dtTrackBFR = dal.DoSelectToTable(sql, "");
            }
            catch
            {
                commonWeb.MessageBox(Page, "体脂率数据加载失败！", "failureLoadBFRDate");
                return false;
            }

            if (dtTrackBFR != null && dtTrackBFR.Rows.Count > 0)
            {
                if (!Common.Common.NoneOrEmptyString(dtTrackBFR.Rows[0]["BodyfatRate"]))
                {
                    this.lastMeasuredBFR = float.Parse(dtTrackBFR.Rows[0]["BodyfatRate"].ToString());
                }
                if (!Common.Common.NoneOrEmptyString(dtTrackBFR.Rows[0]["LastModifiedDate"]))
                {
                    this.lastBFRMeasuredDate = DateTime.Parse(dtTrackBFR.Rows[0]["LastModifiedDate"].ToString());
                }
            }
            else
            {
                this.lastBFRMeasuredDate = this.goalStartDate;
            }

            foreach (DataRow dr in dtTrackBFR.Rows)
            {
                if (!Common.Common.NoneOrEmptyString(dr["BodyfatRate"]) && !Common.Common.NoneOrEmptyString(dr["LastModifiedDate"]))
                {
                    this.bfrHistory = dr["BodyfatRate"].ToString() + "," + this.bfrHistory;
                    this.bfrHistoryDate = dr["LastModifiedDate"].ToString() + "," + this.bfrHistoryDate;
                }
            }
            if (this.bfrHistory.Length >= 1)
            {
                this.bfrHistory = this.bfrHistory.Substring(0, this.bfrHistory.Length - 1);
            }
            else
            {
                this.bfrHistory = string.Empty;
            }
            if (this.bfrHistoryDate.Length >= 1)
            {
                this.bfrHistoryDate = this.bfrHistoryDate.Substring(0, this.bfrHistoryDate.Length - 1);
            }
            else
            {
                this.bfrHistoryDate = string.Empty;
            }

            return true;
        }

        private bool LoadUserOtherGoalData()
        {
            string sql = string.Format(@"SELECT [ID],[TypeMain],[TypeSub] FROM [zhenyuFitness].[dbo].[UserOtherGoal] where [Valid] = 1 and [UserID] = '{0}'", Session["UserID"].ToString());
            DataTable dt;
            try
            {
                dt = dal.DoSelectToTable(sql,"");
            }
            catch
            {
                commonWeb.MessageBox(Page,"加载其他类型目标的数据时出错！","failLoadOtherGoalData");
                return false;
            }
            if(dt != null && dt.Rows.Count > 0)
            {
                for(int i = 0;i<dt.Rows.Count;i++)
                {
                    if(!Common.Common.NoneOrEmptyString(dt.Rows[i]["TypeMain"]) && !Common.Common.NoneOrEmptyString(dt.Rows[i]["TypeSub"]))
                    {
                        int typeBasic = int.Parse(dt.Rows[i]["TypeMain"].ToString());
                        int typeSub = int.Parse(dt.Rows[i]["TypeSub"].ToString());
                    }
                }
            }

            //return true;
        }

        private void InitPageSections()
        {
            this.InitGoalWeightAndBFSection();
            this.InitCurrentBodyCompositionSection();
            this.InitSecondRowSection();
            this.InitChartsSection();
            this.InitStrenthGoalSection();
            this.InitMesurementGoalSection();
            this.InitProgressPhotosSection();
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

        private void setStrengthGoalID(int typeMain,int typeSub, string value)
        {
            if ((GoalTypeBasic)typeMain != GoalTypeBasic.Strength) return;

            GoalTypeStrength typesub = (GoalTypeStrength)typeSub;
            switch(typesub)
            {
                case GoalTypeStrength.Squats:
                    this.squatsID = value;
                    break;
                case GoalTypeStrength.DeadLift:
                    this.deadLiftID = value;
                    break;
                case GoalTypeStrength.BarbellPress:
                    this.barbellPress = value;
                    break;
                case GoalTypeStrength.ShoulderPress:
                    this.shoulderPress = value;
                    break;
                case GoalTypeStrength.BarbellRow:
                    this.barbellRow = value;
                    break;
                case GoalTypeStrength.BarbellCurl:
                    this.barbellCurl = value;
                    break;
                default:
                    break;
            }
        }
    }
}