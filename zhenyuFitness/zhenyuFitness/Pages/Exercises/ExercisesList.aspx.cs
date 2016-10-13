using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.DAO;
using zhenyuFitness.MasterPages;

namespace zhenyuFitness.Pages.Exercises
{
    public partial class ExercisesList : BasePage
    {
        public string tableShow = "";
        public string muscleID = "";
        public string equipmentID = "";
        public string mechanicType = "";
        public string forceType = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            ((generalMaster)this.Master).pagePath = @"<li>训练大厅</li><li>健身动作库</li><li>动作列表页</li>";
            if (!IsPostBack)
            {

                this.muscleID = Request.QueryString["muscleID"] != null ? Request.QueryString["muscleID"].ToString() : string.Empty;
                this.equipmentID = Request.QueryString["equipmentID"] != null ? Request.QueryString["equipmentID"].ToString() : string.Empty;
                this.mechanicType = Request.QueryString["mechanicType"] != null ? Request.QueryString["mechanicType"].ToString() : string.Empty;
                this.forceType = Request.QueryString["force"] != null ? Request.QueryString["force"].ToString() : string.Empty;


                string[] names = new string[] { "MainMuscleID", "EquipmentID", "MechanicsType", "[Force]" };
                string[] values = new string[] { this.muscleID, this.equipmentID, this.mechanicType, this.forceType };

                string whereConditionEqual = Common.Common.WhereCondition_Equal(names, values);
                string sql =
                    string.Format(@"select a.[MechanicsType],a.ID,a.OfficialName,a.RateScore,a.[Force],a.[Level],b.EquipmentName,c.MuscleName from 
                                        (SELECT [ID]
                                        ,[OfficialName]
                                        ,[MainMuscleID]
                                        ,[EquipmentID]
                                        ,[MechanicsType]
                                        ,[Force],
                                        case 
		                                when   [RateUserCount] > {0} then [RateOverrall]/[RateUserCount]
		                                else [RateDefault]
	                                    end as RateScore
                                        ,[Level]
                                        ,[ExerciseValue]
                                    FROM [zhenyuFitness].[dbo].[Exercise] where Valid = 1 {1}) a, 
                                    [zhenyuFitness].[dbo].[Equipment] b,[zhenyuFitness].[dbo].[Muscle] c
                                    where a.EquipmentID = b.ID and a.MainMuscleID = c.ID order by RateScore desc", Common.Common.MinExerciseRateCount, whereConditionEqual);

                MssqlDal dal = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, System.Configuration.ConfigurationManager.AppSettings["DbLog"]);

                DataTable dt = dal.DoSelectToTable(sql, "list");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    this.tableShow += "<tr class=\"gradeB\"" + "onclick =" + string.Format("javascript:window.open('ExerciseContent.aspx?exerciseID={0}')", Common.Common.ObjectToString(dt.Rows[i]["ID"])) + ">" +
                        string.Format("<td>{0}</td><td>{1}</td><td class=\"hidden-xs\">{2}</td><td class=\"center\">{3}</td><td class=\"center hidden-xs\">{4}</td><td class=\"center hidden-xs\">{5}</td>"
                        , Common.Common.ObjectToString(dt.Rows[i]["OfficialName"])
                        , Common.Common.ObjectToString(dt.Rows[i]["MuscleName"])
                        , Common.Common.ObjectToString(dt.Rows[i]["EquipmentName"])
                        , this.GetDesc(Common.Common.ObjectToString(dt.Rows[i]["MechanicsType"]).ToString())
                        , this.GetDesc1(Common.Common.ObjectToString(dt.Rows[i]["Force"]).ToString())
                        , Common.Common.ObjectToString(dt.Rows[i]["RateScore"]))
                        + "</tr>";
                }

            }
        }

        private string GetDesc(string s)
        {
            if (s == "0") return "复合运动";
            else if (s == "1") return "单关节运动";
            else if (s == "2") return "拉伸";
            else return "其他";

        }
        private string GetDesc1(string s)
        {
            if (s == "0") return "推";
            else if (s == "1") return "拉";
            else return "其他";

        }

    }
}