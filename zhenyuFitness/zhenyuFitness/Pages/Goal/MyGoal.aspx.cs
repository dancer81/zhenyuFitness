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

        /// <summary>
        /// strength goal data
        /// </summary>
        public string squatsID = string.Empty;
        public string deadLiftID = string.Empty;
        public string barbellPress = string.Empty;
        public string shoulderPress = string.Empty;
        public string barbellRow = string.Empty;
        public string barbellCurl = string.Empty;

        public string startValue_squats = string.Empty;
        public string startDate_squats = string.Empty;
        public string goalValue_squats = string.Empty;
        public string goalDate_squats = string.Empty;
        public string currentValue_squats = string.Empty;
        public string percent_squats = string.Empty;
        public string goalStatus_squats = string.Empty;

        public string startValue_deadLift = string.Empty;
        public string startDate_deadLift = string.Empty;
        public string goalValue_deadLift = string.Empty;
        public string goalDate_deadLift = string.Empty;
        public string currentValue_deadLift = string.Empty;
        public string percent_deadLift = string.Empty;
        public string goalStatus_deadLift = string.Empty;

        public string startValue_barbellPress = string.Empty;
        public string startDate_barbellPress = string.Empty;
        public string goalValue_barbellPress = string.Empty;
        public string goalDate_barbellPress = string.Empty;
        public string currentValue_barbellPress = string.Empty;
        public string percent_barbellPress = string.Empty;
        public string goalStatus_barbellPress = string.Empty;

        public string startValue_shoulderPress = string.Empty;
        public string startDate_shoulderPress = string.Empty;
        public string goalValue_shoulderPress = string.Empty;
        public string goalDate_shoulderPress = string.Empty;
        public string currentValue_shoulderPress = string.Empty;
        public string percent_shoulderPress = string.Empty;
        public string goalStatus_shoulderPress = string.Empty;

        public string startValue_barbellRow = string.Empty;
        public string startDate_barbellRow = string.Empty;
        public string goalValue_barbellRow = string.Empty;
        public string goalDate_barbellRow = string.Empty;
        public string currentValue_barbellRow = string.Empty;
        public string percent_barbellRow = string.Empty;
        public string goalStatus_barbellRow = string.Empty;

        public string startValue_barbellCurl = string.Empty;
        public string startDate_barbellCurl = string.Empty;
        public string goalValue_barbellCurl = string.Empty;
        public string goalDate_barbellCurl = string.Empty;
        public string currentValue_barbellCurl = string.Empty;
        public string percent_barbellCurl = string.Empty;
        public string goalStatus_barbellCurl = string.Empty;

        public string ChestID = string.Empty;
        public string ArmID = string.Empty;
        public string WaistID = string.Empty;
        public string ThighID = string.Empty;
        public string ShoulderID = string.Empty;
        public string HipID = string.Empty;

        public string SquatsID
        {
            get
            {
                return this.squatsID;
            }
        }

        public string DeadLiftID
        {
            get
            {
                return this.deadLiftID;
            }
        }

        public string BarbellPress
        {
            get
            {
                return this.barbellPress;
            }
        }

        public string ShoulderPress
        {
            get
            {
                return this.shoulderPress;
            }
        }

        public string BarbellRow
        {
            get
            {
                return this.barbellRow;
            }
        }

        public string BarbellCurl
        {
            get
            {
                return this.barbellCurl;
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

        public string GreenArrowImg
        {
            get
            {
                return  Common.Common.ResourceRootPath + "/img/其他/arrow_100x60_green_rightward.png";
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

            if (this.LoadUserBFRGoalData() && this.LoadUserOtherGoalData() && this.LoadUserWeightTrack() && this.LoadUserBFRTrack())
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
            if (this.initStrengthGoalSection())
            {
                return true;
            }

            return false;
        }

        private void setOtherGoalID(int typeMain, int typeSub, string value)
        {
            if ((GoalTypeBasic)typeMain != GoalTypeBasic.Strength) return;

            GoalTypeStrength typesub = (GoalTypeStrength)typeSub;
            switch (typesub)
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

        private bool initStrengthGoalSection()
        {
            string sql = string.Format(@"SELECT [ID],[TypeMain],[TypeSub],[StartValue],[GoalValue],[GoalDaysCount],[CreateDate],[GoalStatus], DATEDIFF(day,[CreateDate],GETDATE()) AS DaysPassed
                    FROM [zhenyuFitness].[dbo].[UserOtherGoal] where [TypeMain]={1} and [Valid] = 1 and [UserID] = '{0}' and [GoalStatus] in ({2} , {3}, {4}) order by [TypeSub] asc,[GoalStatus] asc, [CreateDate] desc",
                    Session["UserID"].ToString(), (int)Common.Common.GoalTypeBasic.Strength,
                    (int)Common.Common.OtherGoalStatus.Processing,(int)Common.Common.OtherGoalStatus.Achieved,(int)Common.Common.OtherGoalStatus.Expired);
            DataTable dt;
            try
            {
                dt = dal.DoSelectToTable(sql, "");
            }
            catch
            {
                commonWeb.MessageBox(Page, "加载其他类型目标的数据时出错！", "failLoadOtherGoalData");
                return false;
            }

            if (dt != null && dt.Rows.Count > 0)
            {
                this.filerStrengthTable(ref dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (!Common.Common.NoneOrEmptyString(dt.Rows[i]["ID"]) && !Common.Common.NoneOrEmptyString(dt.Rows[i]["TypeMain"]) && !Common.Common.NoneOrEmptyString(dt.Rows[i]["TypeSub"]))
                    {
                        int typeBasic = int.Parse(dt.Rows[i]["TypeMain"].ToString());
                        int typeSub = int.Parse(dt.Rows[i]["TypeSub"].ToString());
                        string idValue = dt.Rows[i]["ID"].ToString();

                        this.setOtherGoalID(typeBasic, typeSub, idValue);


                        ///初始化力量型目标区域的前台显示数据
                        this.initOneStrengthGoalSection(dt.Rows[i]["StartValue"], dt.Rows[i]["GoalValue"], dt.Rows[i]["GoalDaysCount"], dt.Rows[i]["CreateDate"], dt.Rows[i]["DaysPassed"],dt.Rows[i]["ID"], typeSub);
                    }
                }
            }

            htmlOneStrengthGoalSection();
            return true;
        }


        /// <summary>
        /// 将初始化StrengthGoal Section的表格过滤，使之每个类型的力量型目标至多只有1条数据
        /// 这条数据的目标状态可能为：进行中、已完成
        /// </summary>
        /// <param name="dt"></param>
        private void filerStrengthTable(ref DataTable dt)
        {
            int i = 0;
            while (i < dt.Rows.Count)
            {
                if (dt.Rows[i]["TypeSub"] != null)
                {
                    int j = i + 1;
                    if (j >= dt.Rows.Count) break;

                    while (true)
                    {
                        if (j < dt.Rows.Count && dt.Rows[j]["TypeSub"] != null
                            && dt.Rows[i]["TypeSub"].ToString() == dt.Rows[j]["TypeSub"].ToString())
                        {
                            dt.Rows[j].Delete();
                            j++;

                            if (j >= dt.Rows.Count)
                            {
                                i = j;
                                break;
                            }
                        }
                        else
                        {
                            i = j;
                            break;
                        }
                    }
                }
            }

            dt.AcceptChanges();
        }

        /// <summary>
        /// 根据力量型目标类型，初始化对应力量型目标区域
        /// </summary>
        /// <param name="startValue"></param>
        /// <param name="goalValue"></param>
        /// <param name="goalDays"></param>
        /// <param name="startDate"></param>
        /// <param name="strengthGoalID"></param>
        /// <param name="type"></param>
        private void initOneStrengthGoalSection(object startValue, object goalValue, object goalDays, object startDate, object daysPassed, object strengthGoalID, int type)
        {
            bool expired = false;
            string typeString = string.Empty;
            switch (type)
            {
                case (int)Common.Common.GoalTypeStrength.Squats:
                    typeString = "squats";
                    break;
                case (int)Common.Common.GoalTypeStrength.DeadLift:
                    typeString = "deadLift";
                    break;
                case (int)Common.Common.GoalTypeStrength.BarbellPress:
                    typeString = "barbellPress";
                    break;
                case (int)Common.Common.GoalTypeStrength.ShoulderPress:
                    typeString = "shoulderPress";
                    break;
                case (int)Common.Common.GoalTypeStrength.BarbellRow:
                    typeString = "barbellRow";
                    break;
                case (int)Common.Common.GoalTypeStrength.BarbellCurl:
                    typeString = "barbellCurl";
                    break;
                default:
                    break;

            }

            if (typeString != string.Empty)
            {
                if (startValue != null)
                {
                    this.GetType().GetField("startValue_" + typeString).SetValue(this, startValue.ToString());
                }
                if (startDate != null)
                {
                    this.GetType().GetField("startDate_" + typeString).SetValue(this, startDate.ToString());
                }
                if (goalDays != null)
                {
                    this.GetType().GetField("goalDate_" + typeString).SetValue(this, goalDays.ToString());
                }
                if (goalValue != null)
                {
                    this.GetType().GetField("goalValue_" + typeString).SetValue(this, goalValue.ToString());
                }

                DataTable dtTrack = null;
                float percent = 0;
                if (strengthGoalID != null)
                {
                    string sqlTrack = string.Format(@"SELECT  top 1    OneRepsMax
                                      FROM[zhenyuFitness].[dbo].[TrackStrengthGoal] where StrengthGoalID = '{0}' order by CreateDate desc", strengthGoalID.ToString());
                    dtTrack = dal.DoSelectToTable(sqlTrack, "");
                }

                ///如果track表没有，目标刚建立，尚未更新过Track数据
                if (dtTrack == null || dtTrack.Rows.Count <= 0)
                {
                    this.GetType().GetField("currentValue_" + typeString).SetValue(this, this.GetType().GetField("startValue_" + typeString).GetValue(this));
                    this.GetType().GetField("percent_" + typeString).SetValue(this, "0");
                    if(int.Parse(daysPassed.ToString()) > int.Parse(goalDays.ToString()))
                    {
                        expired = true;
                        this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:#460046'>已过期</span>");
                    }
                    else
                    {
                        this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:green'>进行中</span>");
                    }
                    
                }
                else//如果有记录，则Track数据更新过
                {
                    if (dtTrack.Rows[0]["OneRepsMax"] != null)
                    {
                        this.GetType().GetField("currentValue_" + typeString).SetValue(this, dtTrack.Rows[0]["OneRepsMax"].ToString());
                    }
                    float start = float.Parse(this.GetType().GetField("startValue_" + typeString).GetValue(this).ToString());
                    float goal = float.Parse(this.GetType().GetField("goalValue_" + typeString).GetValue(this).ToString());
                    float current = float.Parse(this.GetType().GetField("currentValue_" + typeString).GetValue(this).ToString());
                    percent = 100 * (current - start) / (goal - start);
                    if (percent <= 0)
                    {
                        this.GetType().GetField("percent_" + typeString).SetValue(this, "0");
                        if (int.Parse(daysPassed.ToString()) > int.Parse(goalDays.ToString()))
                        {
                            expired = true;
                            this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:#460046'>已过期</span>");
                        }
                        else
                        {
                            this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:green'>进行中</span>");
                        }
                    }
                    else if (percent >= 100)
                    {
                        this.GetType().GetField("percent_" + typeString).SetValue(this, percent.ToString("0.0"));
                        this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:#3366CC'>已完成</span>");
                    }
                    else
                    {
                        this.GetType().GetField("percent_" + typeString).SetValue(this, percent.ToString("0.0"));
                        if (int.Parse(daysPassed.ToString()) > int.Parse(goalDays.ToString()))
                        {
                            expired = true;
                            this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:#460046'>已过期</span>");
                        }
                        else
                        {
                            this.GetType().GetField("goalStatus_" + typeString).SetValue(this, "<span style='color:green'>进行中</span>");
                        }
                    }
                }

                if (expired)
                {
                    if (strengthGoalID != null)
                        this.setStrengthGoalStatus_Expired(strengthGoalID.ToString());
                }
            }
        }

        private void htmlOneStrengthGoalSection()
        {
            List<string> listTypeString = new List<string>();
            listTypeString.Add("squats");
            listTypeString.Add("deadLift");
            listTypeString.Add("barbellPress");
            listTypeString.Add("shoulderPress");
            listTypeString.Add("barbellRow");
            listTypeString.Add("barbellCurl");

            string s = string.Empty;
            foreach (string typeString in listTypeString)
            {
                s = this.GetType().GetField("startValue_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "0" : s;
                this.GetType().GetField("startValue_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("startDate_" + typeString).GetValue(this).ToString();
                s = s.Split(' ')[0];
                //s = DateTime.Parse(s).ToString("yyyy-MM-dd");
                s = string.IsNullOrEmpty(s) ? "尚未制定" : s;
                this.GetType().GetField("startDate_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("goalValue_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "0" : s;
                this.GetType().GetField("goalValue_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("goalDate_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "0" : s;
                this.GetType().GetField("goalDate_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("currentValue_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "0" : s;
                this.GetType().GetField("currentValue_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("percent_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "0" : s;
                this.GetType().GetField("percent_" + typeString).SetValue(this, s);
                s = string.Empty;

                s = this.GetType().GetField("goalStatus_" + typeString).GetValue(this).ToString();
                s = string.IsNullOrEmpty(s) ? "<span style='color:red'>未开始</span>" : s;
                this.GetType().GetField("goalStatus_" + typeString).SetValue(this, s);
                s = string.Empty;
            }

        }

        private void setStrengthGoalStatus_Expired(string id)
        {
            string sql = string.Format(@"UPDATE [zhenyuFitness].[dbo].[UserOtherGoal]
                                           SET [GoalStatus] = {1}
                                         WHERE ID = '{0}'", id, (int)Common.Common.OtherGoalStatus.Expired);

            dal.ExecSQL(sql);
        }

        #endregion

    }
}