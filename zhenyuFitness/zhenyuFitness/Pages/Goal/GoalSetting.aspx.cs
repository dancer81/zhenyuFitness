using System;
using System.Collections.Generic;
using System.Data;
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

            if(request.Form.Count == 0)
            {
                this.InitPage();
            }
            else
            {
                this.DealWithForm();
            }



        }

        private void InitPage()
        {
            //初始化用户的年龄和性别
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
                commonWeb.MessageBox(Page, "出错，获取不到用户的年龄！", "errorPhysique1");
                return;
            }
            //step 5
            this.goalBFR = float.Parse(Common.Common.ObjectToString(request.Form["goalBFR"]));
            this.goalWeight = float.Parse(Common.Common.ObjectToString(request.Form["goalWeight"]));
            //step 6
            this.goalCostDays = int.Parse(Common.Common.ObjectToString(request.Form["goalCostDays"]));

            string sql = 
                string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[UserBFRGoal]
                           ([ID]
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
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           (NEWID()
                           ,{0}
                           ,{1}
                           ,<GoalPhysique, tinyint,>
                           ,<LiftingExperience, tinyint,>
                           ,<MotivationLevel, tinyint,>
                           ,<StartWeight, float,>
                           ,<StartBodyFat, float,>
                           ,<StartWaistSize, float,>
                           ,<IsKnowBFR, bit,>
                           ,<GoalDirection, tinyint,>
                           ,<GoalWeight, float,>
                           ,<GoalBodyFat, float,>
                           ,<GoalWaistSize, float,>
                           ,<GoalStartDate, datetime,>
                           ,<GoalCostDays, int,>
                           ,<GoalAlertWeight, tinyint,>
                           ,<GoalAlertBodyFat, tinyint,>
                           ,<PicBeforeID, char(36),>
                           ,<PicCurrentID, char(36),>
                           ,<IsExpired, bit,>
                           ,<IsAchieved, bit,>
                           ,<IsProcessing, bit,>
                           ,<IsCanceled, bit,>
                           ,<CreateUser, char(36),>
                           ,<CreateDate, datetime,>
                           ,<LastModifiedUser, char(36),>
                           ,<LastModifiedDate, datetime,>
                           ,<Valid, bit,>)");
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