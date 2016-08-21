using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.DAO;

namespace zhenyuFitness.Pages.LoujunjieAdmin
{
    public partial class Admin_ExerciseEdit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            MssqlDal dal = new MssqlDal(Common.Common.DBConnectionStr, Server.MapPath(Common.Common.DbLog));
            if (!IsPostBack)
            {
                if (Request.QueryString["exerciseID"] != null && Request.QueryString["exerciseID"].ToString() != string.Empty)
                {
                    ViewState["exerciseID"] = Request.QueryString["exerciseID"].ToString();
                    string sqlSelect = string.Format(@"select * from [zhenyuFitness].[dbo].[Exercise] where ID = '{0}'", Request.QueryString["exerciseID"].ToString());
                    DataTable dt = dal.DoSelectToTable(sqlSelect, "select");

                    this.OfficialName.Text = Common.Common.ObjectToString(dt.Rows[0]["OfficialName"]);
                    this.OtherName.Text = Common.Common.ObjectToString(dt.Rows[0]["OtherName"]);
                    this.Overrall.Text = Common.Common.ObjectToString(dt.Rows[0]["Overrall"]);
                    this.Type.Text = Common.Common.ObjectToString(dt.Rows[0]["Type"]);
                    this.MainMuscleID.Items.FindByValue(Common.Common.ObjectToString(dt.Rows[0]["MainMuscleID"])).Selected = true;
                    this.OtherMuscleIDs.Text = Common.Common.ObjectToString(dt.Rows[0]["OtherMuscleIDs"]);
                    this.EquipmentID.Items.FindByValue(Common.Common.ObjectToString(dt.Rows[0]["EquipmentID"])).Selected = true;
                    this.MechanicsType.Items.FindByValue(Common.Common.ObjectToString(dt.Rows[0]["MechanicsType"])).Selected = true;
                    this.Force.Items.FindByValue(Common.Common.ObjectToString(dt.Rows[0]["Force"])).Selected = true;
                    this.RateDefault.Text = Common.Common.ObjectToString(dt.Rows[0]["RateDefault"]);
                    this.RateOverrall.Text = Common.Common.ObjectToString(dt.Rows[0]["RateOverrall"]);
                    this.RateUserCount.Text = Common.Common.ObjectToString(dt.Rows[0]["RateUserCount"]);
                    this.Level.Text = Common.Common.ObjectToString(dt.Rows[0]["Level"]);
                    this.ExerciseValue.Text = Common.Common.ObjectToString(dt.Rows[0]["ExerciseValue"]);

                    //To do:视频上传地址
                    this.Video.Text = Common.Common.ObjectToString(dt.Rows[0]["Video"]);
                    this.VideoPoster.Text = Common.Common.ObjectToString(dt.Rows[0]["VideoPoster"]);
                    this.PicMaleStart.Text = Common.Common.ObjectToString(dt.Rows[0]["PicMaleStart"]);
                    this.PicMaleEnd.Text = Common.Common.ObjectToString(dt.Rows[0]["PicMaleEnd"]);
                    this.PicFemaleStart.Text = Common.Common.ObjectToString(dt.Rows[0]["PicFemaleStart"]);
                    this.PicFemaleEnd.Text = Common.Common.ObjectToString(dt.Rows[0]["PicFemaleEnd"]);
                    this.PicMuscle.Text = Common.Common.ObjectToString(dt.Rows[0]["PicMuscle"]);

                    string[] ss = Common.Common.ObjectToString(dt.Rows[0]["Detail"]).Split('|');

                    this.Detail1.Text = ss[0];
                    this.Detail2.Text = ss[1];
                    this.Detail3.Text = ss[2];

                    this.Variantion.Text = Common.Common.ObjectToString(dt.Rows[0]["Variantion"]);
                    this.Caution.Text = Common.Common.ObjectToString(dt.Rows[0]["Caution"]);
                    this.AlterNatives.Text = Common.Common.ObjectToString(dt.Rows[0]["AlterNatives"]);

                }
                else
                {
                    ViewState["exerciseID"] = Guid.NewGuid().ToString();
                }
            }
        }

        protected void btn_OnClick(object sender, EventArgs e)
        {
            MssqlDal dal = new MssqlDal(Common.Common.DBConnectionStr, Server.MapPath(Common.Common.DbLog));
            string sqlselect = string.Format("select ID from [zhenyuFitness].[dbo].[Exercise] where ID = '{0}'", Common.Common.ObjectToString(ViewState["exerciseID"]));
            string id = Common.Common.ObjectToString(ViewState["exerciseID"]);
            if (id == null || id == string.Empty)
            {
                this.MessageBox(Page, "输入超时，ViewState过期！", "overtime");
                return;
            }
            if (dal.GetSingle(sqlselect) != null)
            {
                string sqlUpdate =
                    string.Format(@"UPDATE [zhenyuFitness].[dbo].[Exercise]
                       SET [OfficialName] = '{1}'
                          ,[OtherName] = '{2}'
                          ,[Overrall] = '{3}'
                          ,[Type] = '{4}'
                          ,[MainMuscleID] = '{5}'
                          ,[OtherMuscleIDs] = '{6}'
                          ,[EquipmentID] = '{7}'
                          ,[MechanicsType] = '{8}'
                          ,[Force] = '{9}'
                          ,[RateDefault] = '{10}'
                          ,[RateOverrall] = '{11}'
                          ,[RateUserCount] = '{12}'
                          ,[Level] = '{13}'
                          ,[ExerciseValue] = '{14}'
                          ,[Video] = '{15}'
                          ,[VideoPoster] = '{16}'
                          ,[PicMaleStart] = '{17}'
                          ,[PicMaleEnd] = '{18}'
                          ,[PicFemaleStart] = '{19}'
                          ,[PicFemaleEnd] = '{20}'
                          ,[PicMuscle] = '{21}'
                          ,[Detail] = '{22}'
                          ,[Variantion] = '{23}'
                          ,[Caution] = '{24}'
                          ,[AlterNatives] = '{25}'
                          ,[CreateUser] = 'admin'
                          ,[CreateDate] = GETDATE()
                          ,[LastModifiedUser] = 'admin'
                          ,[LastModifiedDate] = GETDATE()
                          ,[Valid] = 1
                     WHERE ID = '{0}'", id, this.OfficialName.Text.Trim(), this.OtherName.Text.Trim(), this.Overrall.Text.Trim(),
                     this.Type.Text.Trim(), this.MainMuscleID.SelectedValue, this.OtherMuscleIDs.Text.Trim(),
                     this.EquipmentID.SelectedValue, this.MechanicsType.SelectedValue, this.Force.SelectedValue,
                     this.RateDefault.Text.Trim(), this.RateOverrall.Text.Trim(), this.RateUserCount.Text.Trim(),
                     this.Level.Text.Trim(), this.ExerciseValue.Text.Trim(), this.Video.Text.Trim(), this.VideoPoster.Text.Trim(),
                     this.PicMaleStart.Text.Trim(), this.PicMaleEnd.Text.Trim(), this.PicFemaleStart.Text.Trim(), this.PicFemaleEnd.Text.Trim(),
                     this.PicMuscle.Text.Trim(), this.Detail1.Text.Trim() + "|" + this.Detail2.Text.Trim() + "|" + this.Detail3.Text.Trim(),
                     this.Variantion.Text.Trim(), this.Caution.Text.Trim(), this.AlterNatives.Text.Trim());
                dal.ExecSQL(sqlUpdate);
            }
            else
            {
                string sqlInsert =
                    string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[Exercise]
                           ([ID]
                           ,[OfficialName]
                           ,[OtherName]
                           ,[Overrall]
                           ,[Type]
                           ,[MainMuscleID]
                           ,[OtherMuscleIDs]
                           ,[EquipmentID]
                           ,[MechanicsType]
                           ,[Force]
                           ,[RateDefault]
                           ,[RateOverrall]
                           ,[RateUserCount]
                           ,[Level]
                           ,[ExerciseValue]
                           ,[Video]
                           ,[VideoPoster]
                           ,[PicMaleStart]
                           ,[PicMaleEnd]
                           ,[PicFemaleStart]
                           ,[PicFemaleEnd]
                           ,[PicMuscle]
                           ,[Detail]
                           ,[Variantion]
                           ,[Caution]
                           ,[AlterNatives]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           ('{0}'
                           ,'{1}'
                           ,'{2}'
                           ,'{3}'
                           ,'{4}'
                           ,'{5}'
                           ,'{6}'
                           ,'{7}'
                           ,'{8}'
                           ,'{9}'
                           ,'{10}'
                           ,'{11}'
                           ,'{12}'
                           ,'{13}'
                           ,'{14}'
                           ,'{15}'
                           ,'{16}'
                           ,'{17}'
                           ,'{18}'
                           ,'{19}'
                           ,'{20}'
                           ,'{21}'
                           ,'{22}'
                           ,'{23}'
                           ,'{24}'
                           ,'{25}'
                           ,'admin'
                           ,GETDATE()
                           ,'admin'
                           ,GETDATE()
                           ,1)", id, this.OfficialName.Text.Trim(), this.OtherName.Text.Trim(), this.Overrall.Text.Trim(),
                     this.Type.Text.Trim(), this.MainMuscleID.SelectedValue, this.OtherMuscleIDs.Text.Trim(),
                     this.EquipmentID.SelectedValue, this.MechanicsType.SelectedValue, this.Force.SelectedValue,
                     this.RateDefault.Text.Trim(), this.RateOverrall.Text.Trim(), this.RateUserCount.Text.Trim(),
                     this.Level.Text.Trim(), this.ExerciseValue.Text.Trim(), this.Video.Text.Trim(), this.VideoPoster.Text.Trim(),
                     this.PicMaleStart.Text.Trim(), this.PicMaleEnd.Text.Trim(), this.PicFemaleStart.Text.Trim(), this.PicFemaleEnd.Text.Trim(),
                     this.PicMuscle.Text.Trim(), this.Detail1.Text.Trim() + "|" + this.Detail2.Text.Trim() + "|" + this.Detail3.Text.Trim(),
                     this.Variantion.Text.Trim(), this.Caution.Text.Trim(), this.AlterNatives.Text.Trim());
                dal.ExecSQL(sqlInsert);
            }
        }
    }
}