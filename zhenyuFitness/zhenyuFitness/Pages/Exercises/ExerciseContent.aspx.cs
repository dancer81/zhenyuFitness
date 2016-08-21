using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zhenyuFitness.DAO;
using zhenyuFitness.MasterPages;
using zhenyuFitness.Common;

namespace zhenyuFitness.Pages.Exercises
{
    public partial class ExerciseContent : BasePage
    {

        public string exerciseID = "";
        public string officalName = "";
        public string otherName = "";
        public string overrall = "";
        public string mainMuscleID = "";
        public string otherMuscleIDs = "";
        public string equipmentID = "";
        public string mechanicType = "";
        public string force = "";
        public float rateDefault;
        public float rateOverrall = 0;
        public int rateUserCount = 0;
        public float level;
        public float exerciseValue;
        public string video = "";
        public string videoPoster = "";
        public string picExercise = "";
        public string picMaleStart = "";
        public string picMaleEnd = "";
        public string picFemaleStart = "";
        public string picFemaleEnd = "";
        public string picMuscle = "";
        public string detail = "";
        public string caution = "";
        public string variantion = "";
        public string alternatives = "";
        public string mainMuscleName = "";
        public string equipmentName = "";
        public List<string> otherMuscleNames = new List<string>();
        public List<string> otherMuscleIDsList = new List<string>();
        public string mechanicTypeName = "";
        public string forceName = "";
        public float rate;
        public List<string> Listdetail = new List<string>();
        public string Html_ListCaution = "";
        public string Html_alternativesShow = "";
        public string Data_yourRate = string.Empty;//登录用户的评分
        public string Data_IsLike = "0";//登录用户的赞
        public DataTable Data_yourOppion;//评论、转发记录
        public string Html_IsLike = string.Empty;
        public string Html_morethanoneOtherMuscle = "";
        public string Html_Comment = string.Empty;

        private MssqlDal dal;// = new MssqlDal(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString, System.Configuration.ConfigurationManager.AppSettings["DbLog"]);
        private HttpRequest request = HttpContext.Current.Request;

        protected new void Page_Load(object sender, EventArgs e)
        {
            dal = new MssqlDal(Common.Common.DBConnectionStr, Server.MapPath(Common.Common.DbLog));
            base.Page_Load(sender, e);

            this.InitPageContent();

            if (request.Form.Count > 0)//可能是form提交的post,也可能是ajax提交的post
            {
                if (request.Form["ajaxtype"] != null)
                {
                    //处理用户的ajax提交的post
                    this.DealAjax();
                }
                else
                {
                    //处理form提交的post,（登录表单除外，登录表单在BasePage中实现)

                }
            }
        }


        /// <summary>
        /// 根据3个字段计算动作得分
        /// </summary>
        /// <param name="rateDefault">默认得分</param>
        /// <param name="rateOverrall">会员投票总得分</param>
        /// <param name="rateCount">会员投票人数</param>
        /// <returns></returns>
        private float CalculateRateScore(object rateDefault, object rateOverrall, object rateCount)
        {
            if (rateCount == null || rateCount.ToString() == "0" || int.Parse(rateCount.ToString()) <= Common.Common.minExerciseRateCount)
            {
                return float.Parse(rateDefault.ToString());
            }
            else
            {
                float r1 = float.Parse(rateOverrall.ToString());
                int r2 = int.Parse(rateCount.ToString());
                return r1 / r2;
            }
        }

        /// <summary>
        /// 根据ID,从数据库中找到对应记录，然后计算rate
        /// </summary>
        /// <returns></returns>
        public string CalculateRateScoreFromDB()
        {
            if (this.exerciseID != null)
            {
                string sql =
                    string.Format(@"SELECT 
                       [RateDefault]
                      ,[RateOverrall]
                      ,[RateUserCount]
                  FROM [zhenyuFitness].[dbo].[Exercise] where Valid = 1 and ID='{0}'", this.exerciseID.ToString());
                DataTable dt = dal.DoSelectToTable(sql, "table");
                if (dt != null && dt.Rows.Count > 0)
                {
                    return this.CalculateRateScore(dt.Rows[0]["RateDefault"], dt.Rows[0]["RateOverrall"], dt.Rows[0]["RateUserCount"]).ToString();
                }
                else return string.Empty;
            }
            else return string.Empty;
        }
        /// <summary>
        /// 初始化登录用户的信息：rate,isLike,Comment,post;
        /// </summary>
        /// <returns></returns>
        private void InitData_UserOppion()
        {

            this.Data_IsLike = "0";
            this.Data_yourRate = "";
            this.Data_yourOppion = null;

            if (Session["UserID"] != null)//登录用户的赞和评分
            {
                string sql =
                string.Format(@"SELECT 
                            [Type]
                            ,[Rate]
                            ,[Comment]
                            ,[SubmitDateTime]
                            FROM [zhenyuFitness].[dbo].[UserExerciseOppion] 
                            where Valid=1 and UserID='{0}' and ExerciseID = '{1}' and [Type] in (0,2) order by [SubmitDateTime] DESC"
                                          , Session["UserID"].ToString(), this.exerciseID.ToString());
                this.Data_yourOppion = dal.DoSelectToTable(sql, "rateAndLike");//非登录用户也可看见所有评论

                if (Data_yourOppion != null && Data_yourOppion.Rows.Count > 0)
                {
                    for (int i = 0; i < Data_yourOppion.Rows.Count; i++)
                    {
                        if (Data_yourOppion.Rows[i]["Type"] != null)
                        {
                            if (Data_yourOppion.Rows[i]["Type"].ToString() == ((int)Common.Common.ExerciseOppion.Rate).ToString())
                            {
                                this.Data_yourRate = Data_yourOppion.Rows[i]["Rate"].ToString();
                            }
                            if (Data_yourOppion.Rows[i]["Type"].ToString() == ((int)Common.Common.ExerciseOppion.IsLike).ToString())
                            {
                                this.Data_IsLike = Data_yourOppion.Rows[i]["Type"].ToString();
                            }
                        }
                    }
                }
            }
            string sqlOppion = 
                string.Format(@"select a.*,b.UserName,b.MainProfilePhoto from (SELECT 
	                    [UserID]
	                    ,[Rate]
	                    ,[Comment]
	                    ,[SubmitDateTime]
	                    FROM [zhenyuFitness].[dbo].[UserExerciseOppion] 
	                    where Valid=1 and ExerciseID = '{0}' and [Type]={1} ) a,[zhenyuFitness].[dbo].[User] b
	                    where a.UserID = b.ID and b.Valid=1 and b.Activate = 1 order by a.SubmitDateTime DESC"
                                          ,  this.exerciseID.ToString(),((int)Common.Common.ExerciseOppion.Comment).ToString());
            this.Data_yourOppion = dal.DoSelectToTable(sqlOppion, "oppion");
        }
        public void InitHtml_UserIsLike()
        {
            string islikePic = "";
            string islikeText = "";
            if (this.Data_IsLike == "0")//没有赞
            {
                islikePic = "fa-hand-o-up";
                islikeText = "点赞";
            }
            else
            {
                islikePic = "fa-thumbs-o-up";
                islikeText = "取消";
            }
            this.Html_IsLike = string.Format("<i class=\"fa {0} fa-2x\" id=\"likePic\"></i><div id = \"like\" >{1}</div>", islikePic, islikeText);
        }

        /// <summary>
        /// 初始化页面（非用户交互部分）
        /// </summary>
        private void InitPageContent()
        {
            this.exerciseID = this.GetID("exerciseID");

            string sql = string.Format(@" select c.*,d.EquipmentName from 
	                                            (select a.*, b.MuscleName from 
	                                              (SELECT [ID]
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
                                                  ,[PicExercise]
                                                  ,[PicMaleStart]
                                                  ,[PicMaleEnd]
                                                  ,[PicFemaleStart]
                                                  ,[PicFemaleEnd]
                                                  ,[PicMuscle]
                                                  ,[Detail]
                                                  ,[Variantion]
                                                  ,[Caution]
                                                  ,[AlterNatives]
                                                  ,[Valid]
                                              FROM [zhenyuFitness].[dbo].[Exercise] where [ID] ='{0}' and [Valid] = 1) a, [zhenyuFitness].[dbo].[Muscle] b where a.[MainMuscleID]= b.[ID]) c, [zhenyuFitness].[dbo].[Equipment] d where c.[EquipmentID] = d.[ID]", this.exerciseID);
            DataTable dt = dal.DoSelectToTable(sql, "exerciseTable");

            if (dt.Rows.Count > 0)
            {
                //动作名称
                if (dt.Rows[0]["OfficialName"] != null)
                {
                    this.officalName = dt.Rows[0]["OfficialName"].ToString();
                    ((generalMaster)this.Master).pagePath = "<li><a href='ExercisesList.aspx'>动作列表页</a></li><li>" + this.officalName + "</li>";
                }
                //动作别名
                if (dt.Rows[0]["OtherName"] != null)
                    this.otherName = dt.Rows[0]["OtherName"].ToString();
                //动作概述
                if (dt.Rows[0]["Overrall"] != null)
                    this.overrall = dt.Rows[0]["Overrall"].ToString();
                //主肌群ID
                if (dt.Rows[0]["MainMuscleID"] != null)
                    this.mainMuscleID = dt.Rows[0]["MainMuscleID"].ToString();
                //主肌群名称
                if (dt.Rows[0]["MuscleName"] != null)
                    this.mainMuscleName = dt.Rows[0]["MuscleName"].ToString();
                //次要肌群ID组，用,分割开
                if (dt.Rows[0]["OtherMuscleIDs"] != null)
                {
                    this.otherMuscleIDs = dt.Rows[0]["OtherMuscleIDs"].ToString();
                    string[] listMuscleIDs = Common.Common.SpilitString(this.otherMuscleIDs, ',');

                    string inCondition =
                    Common.Common.WhereCondition_In(listMuscleIDs);

                    string sqlselectMuscles = string.Format(@"SELECT [ID]
                                                  ,[MuscleName]
                                              FROM [zhenyuFitness].[dbo].[Muscle] 
                                              where [Valid] = 1 and [ID] in ({0})", inCondition);

                    DataTable dtMuscles = dal.DoSelectToTable(sqlselectMuscles, "otherMuscles");
                    for (int i = 0; i < dtMuscles.Rows.Count; i++)
                    {
                        if (dtMuscles.Rows[i]["ID"] != null)
                        {
                            this.otherMuscleIDsList.Add(dtMuscles.Rows[i]["ID"].ToString());
                        }
                        if (dtMuscles.Rows[i]["MuscleName"] != null)
                        {
                            this.otherMuscleNames.Add(dtMuscles.Rows[i]["MuscleName"].ToString());
                        }
                    }

                    //无次要肌肉,参数为空
                    if (dtMuscles.Rows.Count == 0 || this.otherMuscleIDsList.Count == 0)
                    {
                        this.otherMuscleNames.Add(string.Empty);
                        this.otherMuscleIDsList.Add(string.Empty);
                    }
                    //有次要肌肉
                    else if (this.otherMuscleIDsList.Count > 0)
                    {
                        //次要肌肉数>=2
                        if (this.otherMuscleIDsList.Count >= 2)
                        {
                            for (int i = 1; i < otherMuscleIDsList.Count; i++)
                            {
                                this.Html_morethanoneOtherMuscle += string.Format(" <br /><a href = \"ExercisesList.aspx?muscleID={1}\" style = \"margin-left: 102px\" ><span style = \"font-size: 10px; font-family: 黑体\" > {0} </span></a>", otherMuscleNames[i], otherMuscleIDsList[i]);
                            }
                        }
                    }
                }
                //装备ID
                if (dt.Rows[0]["EquipmentID"] != null)
                    this.equipmentID = dt.Rows[0]["EquipmentID"].ToString();
                //装备名称
                if (dt.Rows[0]["EquipmentName"] != null)
                    this.equipmentName = dt.Rows[0]["EquipmentName"].ToString();
                //机械力学：复合、单关节、拉升、其他
                if (dt.Rows[0]["MechanicsType"] != null)
                {
                    this.mechanicType = dt.Rows[0]["MechanicsType"].ToString();
                    string t = Enum.Parse(typeof(Common.Common.MechanicType), this.mechanicType).ToString();
                    if (t == Common.Common.MechanicType.Compound.ToString())
                    {
                        this.mechanicTypeName = "复合动作";
                    }
                    else if (t == Common.Common.MechanicType.Single.ToString())
                    {
                        this.mechanicTypeName = "单关节动作";
                    }
                    else if (t == Common.Common.MechanicType.Strech.ToString())
                    {
                        this.mechanicTypeName = "拉伸";
                    }
                    else
                    {
                        this.mechanicTypeName = "其他";
                    }
                }
                //发力形式：推、拉其他
                if (dt.Rows[0]["Force"] != null)
                {
                    this.force = dt.Rows[0]["Force"].ToString();

                    string t = Enum.Parse(typeof(Common.Common.ForceType), this.force).ToString();

                    if (t == Common.Common.ForceType.Push.ToString())
                    {
                        this.forceName = "推";
                    }
                    else if (t == Common.Common.ForceType.Pull.ToString())
                    {
                        this.forceName = "拉";
                    }
                    else
                    {
                        this.forceName = "其他";
                    }
                }

                //计算动作得分
                this.rate = this.CalculateRateScore(dt.Rows[0]["RateDefault"], dt.Rows[0]["RateOverrall"], dt.Rows[0]["RateUserCount"]);
                this.rateUserCount = dt.Rows[0]["RateUserCount"] != null ? int.Parse(dt.Rows[0]["RateUserCount"].ToString()) : 0;
                this.rateDefault = dt.Rows[0]["RateDefault"] != null ? float.Parse(dt.Rows[0]["RateDefault"].ToString()) : 0;
                this.rateOverrall = dt.Rows[0]["RateOverrall"] != null ? float.Parse(dt.Rows[0]["RateOverrall"].ToString()) : 0;
                //动作难度
                if (dt.Rows[0]["Level"] != null)
                    this.level = float.Parse(dt.Rows[0]["Level"].ToString());
                //动作价值得分
                if (dt.Rows[0]["ExerciseValue"] != null)
                    this.exerciseValue = float.Parse(dt.Rows[0]["ExerciseValue"].ToString());
                //动作视频路径
                if (dt.Rows[0]["Video"] != null)
                {
                    this.video = this.combineSrcPath(dt.Rows[0]["Video"]);
                }
                //动作视频初始图片
                if (dt.Rows[0]["VideoPoster"] != null)
                    this.videoPoster = this.combineSrcPath(dt.Rows[0]["VideoPoster"]);
                //动作图片（页面左上角轮播默认图片）
                this.picExercise = this.combineSrcPath(dt.Rows[0]["PicExercise"]);
                //动作男性开始图片路径
                if (dt.Rows[0]["PicMaleStart"] != null)
                    this.picMaleStart = this.combineSrcPath(dt.Rows[0]["PicMaleStart"]);
                //动作男性结束图片路径
                if (dt.Rows[0]["PicMaleEnd"] != null)
                    this.picMaleEnd = this.combineSrcPath(dt.Rows[0]["PicMaleEnd"]);
                //动作女性开始图片路径
                if (dt.Rows[0]["PicFemaleStart"] != null)
                    this.picFemaleStart = this.combineSrcPath(dt.Rows[0]["PicFemaleStart"]);
                //动作女性结束图片路径
                if (dt.Rows[0]["PicFemaleEnd"] != null)
                    this.picFemaleEnd = this.combineSrcPath(dt.Rows[0]["PicFemaleEnd"]);
                //动作主肌群图片路径
                if (dt.Rows[0]["PicMuscle"] != null)
                    this.picMuscle = this.combineSrcPath(dt.Rows[0]["PicMuscle"]);
                //动作分解：开始、过程、结束
                if (dt.Rows[0]["Detail"] != null)
                {
                    this.detail = dt.Rows[0]["Detail"].ToString();
                    string[] details = Common.Common.SpilitString(detail, '|');
                    for (int i = 0; i < details.Length; i++)
                    {
                        this.Listdetail.Add(details[i]);
                    }
                    //即动作没有标准的开始->过程->结束3个步骤
                    if (this.Listdetail.Count < 3)
                    {
                        while (Listdetail.Count < 3)
                        {
                            Listdetail.Add(string.Empty);
                        }
                    }
                }
                //动作变化
                if (dt.Rows[0]["Variantion"] != null)
                    this.variantion = dt.Rows[0]["Variantion"].ToString();
                //动作注意点
                if (dt.Rows[0]["Caution"] != null)
                {
                    this.caution = dt.Rows[0]["Caution"].ToString();
                    string[] cautions = Common.Common.SpilitString(this.caution, '|');
                    for (int i = 0; i < cautions.Length; i++)
                    {
                        if (i % 2 == 0)
                        {
                            this.Html_ListCaution += string.Format("<div class=\"alert alert-block alert-danger fade in\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\" aria-hidden=\"true\">&times;</a><p>{0}</p></div>", cautions[i]);
                        }
                        else
                        {
                            this.Html_ListCaution += string.Format("<div class=\"alert alert-block alert-warning fade in\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\" aria-hidden=\"true\">&times;</a><p>{0}</p></div>", cautions[i]);
                        }
                    }
                }

                //动作替代
                if (dt.Rows[0]["AlterNatives"] != null)
                {
                    this.alternatives = dt.Rows[0]["AlterNatives"].ToString();
                    string inCondition = Common.Common.WhereCondition_In(Common.Common.SpilitString(this.alternatives, ','));
                    string sqlSelectAltinatives =
                        string.Format(@"select a.*,b.EquipmentName from (SELECT [OfficialName]
                                                          ,[ID]
                                                          ,[EquipmentID]
                                                          ,[MechanicsType]
                                                          ,[Force]
                                                          ,[RateDefault]
                                                          ,[RateOverrall]
                                                          ,[RateUserCount]
                                                          ,[Level]
                                                          ,[ExerciseValue]
                                                          ,[VideoPoster]
                                                          ,[PicFemaleStart]
                                                          ,[Valid]
                                                      FROM [zhenyuFitness].[dbo].[Exercise] where [ID] in ({0})) a, [zhenyuFitness].[dbo].[Equipment] b where a.[EquipmentID] = b.[ID]", inCondition);
                    DataTable dtAltinatives = dal.DoSelectToTable(sqlSelectAltinatives, "altinatives");
                    string exerciseid = "";
                    string equipName = "";
                    string mechanices = "";
                    string forceType = "";
                    string rateScore = "";
                    string levelScore = "";
                    string valueScore = "";

                    string temp1 = "";
                    for (int i = 0; i < dtAltinatives.Rows.Count; i++)
                    {
                        string tt = "";

                        exerciseid = dtAltinatives.Rows[i]["ID"] != null ? dtAltinatives.Rows[i]["ID"].ToString() : "";
                        equipName = dtAltinatives.Rows[i]["EquipmentName"] != null ? dtAltinatives.Rows[i]["EquipmentName"].ToString() : "";

                        //动作类型
                        tt = dtAltinatives.Rows[i]["MechanicsType"] != null ? dtAltinatives.Rows[i]["MechanicsType"].ToString() : "";
                        temp1 = Enum.Parse(typeof(Common.Common.MechanicType), tt).ToString();
                        if (temp1 == Common.Common.MechanicType.Compound.ToString()) mechanices = "复合动作";
                        else if (temp1 == Common.Common.MechanicType.Single.ToString()) mechanices = "单关节动作";
                        else if (temp1 == Common.Common.MechanicType.Strech.ToString()) mechanices = "拉伸";
                        else mechanices = "其他";

                        //发力形式
                        tt = dtAltinatives.Rows[i]["Force"] != null ? dtAltinatives.Rows[i]["Force"].ToString() : "";
                        temp1 = Enum.Parse(typeof(Common.Common.ForceType), tt).ToString();
                        if (temp1 == Common.Common.ForceType.Push.ToString()) forceType = "推";
                        else if (temp1 == Common.Common.ForceType.Pull.ToString()) forceType = "拉";
                        else forceType = "其他";

                        //计算得分
                        rateScore = this.CalculateRateScore(dtAltinatives.Rows[i]["RateDefault"], dtAltinatives.Rows[i]["RateOverrall"], dtAltinatives.Rows[i]["RateUserCount"]).ToString();
                        //技术难度
                        levelScore = dtAltinatives.Rows[i]["Level"] != null ? dtAltinatives.Rows[i]["Level"].ToString() : "";
                        //动作价值
                        valueScore = dtAltinatives.Rows[i]["ExerciseValue"] != null ? dtAltinatives.Rows[i]["ExerciseValue"].ToString() : "";

                        this.Html_alternativesShow +=
                            string.Format("<li class=\"price_block col-md-4 col-xs-12\"><h3>{1}</h3><div class=\"price green\"><div class=\"price_figure\"><span class=\"price_number\">{0}</span><span class=\"price_tenure\">会员评分</span></div></div><ul class=\"features\">",Convert.ToDouble(rateScore).ToString("0.00"), dtAltinatives.Rows[i]["OfficialName"].ToString())
                            + string.Format(@"<li style='color:#2465ed'>技术难度:{0}</li>
                                              <li style='color:#ef5858'>动作价值:{1}</li >
                                              <li style='color:#2465ed'>装备器械:{2}</li >
                                              <li style='color:#ef5858'>动作类别:{3}</li >
                                              <li style='color:#2465ed'>发力形式:{4}</li >
                                              </ul> ", this.ChangeNumToLevel(levelScore), this.ChangeNumToLevel(valueScore), equipName, mechanices, forceType)
                            + string.Format("<div class=\"footer\"><div class=\"footer\"><a href = \"ExerciseContent.aspx?exerciseID={0}\" class=\"btn btn-info\">查看</a></div></li>", exerciseid);
                    }

                }
            }

            this.InitData_UserOppion();
            this.InitHtml_UserIsLike();

            //TO DO初始化用户的评论（不登录也可看见）
            this.InitHtml_UserComment();
    }

        /// <summary>
        /// 处理动作内容页用户的ajax请求
        /// </summary>
        public void DealAjax()
        {
            if (this.exerciseID == null)
            {
                this.MessageBox(Page, "出错了,动作ID为空", "key1");
                return;
            }
            if (Session["UserID"] == null)
            {
                //webCommon.MessageBox(Page, "请您登录后再评分", "key2");
                Response.Write("userNotLogin");
                Response.End();
                return;
            }

            string ajaxType = request.Form["ajaxtype"].ToString();
            if (ajaxType == "exerciseUserIsLike")
            {
                this.DealAjax_UserLike();
            }
            else if (ajaxType == "exerciseUserRate")
            {
                this.DealAjax_UserRate();
            }
            else if (ajaxType == "exerciseUserComment")//其他类型的ajax请求
            {
                this.DealAjax_UserComment();
            }
            else
            { }
        }

        /// <summary>
        /// 处理用户评分请求
        /// </summary>
        private void DealAjax_UserRate()
        {
            int newUser = 0;
            if (request.Form["score"] != null)
            {
                string sqlUpdateExerciseTable = "";
                string sqlSelectExerciseOppionRecord =
                    string.Format(@"SELECT [ID],[Rate]
                                          FROM [zhenyuFitness].[dbo].[UserExerciseOppion]
                                          where Valid=1 and Type={0} and UserID='{1}' and ExerciseID ='{2}'"
                                  , (int)Common.Common.ExerciseOppion.Rate, Session["UserID"].ToString(), this.exerciseID.ToString());

                DataTable dtOppion = dal.DoSelectToTable(sqlSelectExerciseOppionRecord, "dtOppion");
                //object exerciseOppionID = dal.GetSingle(sqlSelectExerciseOppionRecord);
                if (dtOppion != null && dtOppion.Rows.Count > 0)//该用户已经对此动作评过分了
                {
                    sqlUpdateExerciseTable =
                    string.Format(@"UPDATE [zhenyuFitness].[dbo].[Exercise]
                                               SET
                                                   [RateOverrall] = [RateOverrall] + {0} -{2}
                                             WHERE Valid = 1 and ID = '{1}'", request.Form["score"].ToString(), this.exerciseID.ToString(), dtOppion.Rows[0]["Rate"].ToString());
                }
                else//该用户尚未对此动作评分
                {
                    newUser = 1;
                    sqlUpdateExerciseTable =
                    string.Format(@"UPDATE [zhenyuFitness].[dbo].[Exercise]
                                               SET
                                                   [RateOverrall] = [RateOverrall] + {0}
                                                  ,[RateUserCount] = [RateUserCount] + 1
                                             WHERE Valid = 1 and ID = '{1}'", request.Form["score"].ToString(), this.exerciseID.ToString());
                }


                string sqlDeleteExerciseOppionRecord = string.Format(@"DELETE FROM [zhenyuFitness].[dbo].[UserExerciseOppion]
                                    WHERE Valid=1 and Type={0} and UserID='{1}' and ExerciseID ='{2}'"
                            , (int)Common.Common.ExerciseOppion.Rate, Session["UserID"].ToString(), this.exerciseID.ToString());
                string sqlInsertExerciseOppionRecord =
                    string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[UserExerciseOppion]
                                ([ID]
                                ,[UserID]
                                ,[ExerciseID]
                                ,[Type]
                                ,[Rate]
                                ,[SubmitDateTime]
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
                                ,{3}
                                ,GETDATE()
                                ,'{0}'
                                ,GETDATE()
                                ,'{0}'
                                ,GETDATE()
                                ,1)", Session["UserID"].ToString(), this.exerciseID.ToString(), (int)Common.Common.ExerciseOppion.Rate, request.Form["score"].ToString());

                dal.ExecuteSqlTran(new List<string>() { sqlUpdateExerciseTable, sqlDeleteExerciseOppionRecord, sqlInsertExerciseOppionRecord });

            }


            Pair newuser = new Pair("newUser", newUser.ToString());
            Pair newScore = new Pair("newScore", this.CalculateRateScoreFromDB());
            List<Pair> listPair = new List<Pair>();
            listPair.Add(newuser);
            listPair.Add(newScore);
            string retJson = Common.Common.GetJson(listPair);

            Response.Clear();
            Response.ContentType = "application/json";
            Response.Write(retJson);
            Response.End();

        }

        /// <summary>
        /// 处理用户赞或者取消赞
        /// </summary>
        private void DealAjax_UserLike()
        {
            if (request.Form["IsLike"] != null)
            {
                if (request.Form["IsLike"].ToString() == "1")//用户赞
                {
                    string sqlDel = string.Format("DELETE FROM [zhenyuFitness].[dbo].[UserExerciseOppion] where Valid = 1 and Type = '{2}' and UserID='{0}' and ExerciseID='{1}'",
                        Session["UserID"].ToString(), this.exerciseID, (int)Common.Common.ExerciseOppion.IsLike);
                    string sqlInsert = string.Format(@"INSERT INTO [zhenyuFitness].[dbo].[UserExerciseOppion]
                                                               ([ID]
                                                               ,[UserID]
                                                               ,[ExerciseID]
                                                               ,[Type]
                                                               ,[Rate]
                                                               ,[Comment]
                                                               ,[SubmitDateTime]
                                                               ,[CreateUser]
                                                               ,[CreateDate]
                                                               ,[LastModifiedUser]
                                                               ,[LastModifiedDate]
                                                               ,[Valid])
                                                         VALUES
                                                               (NEWID()
                                                               ,'{0}'
                                                               ,'{1}'
                                                               ,'{2}'
                                                               ,''
                                                               ,''
                                                               ,GETDATE()
                                                               ,'{0}'
                                                               ,GETDATE()
                                                               ,'{0}'
                                                               ,GETDATE()
                                                               ,1)", Session["UserID"].ToString(), this.exerciseID, (int)Common.Common.ExerciseOppion.IsLike);
                    dal.ExecuteSqlTran(new List<string>() { sqlDel, sqlInsert });
                }
                else//用户取消赞
                {
                    string sqlDel = string.Format("DELETE FROM [zhenyuFitness].[dbo].[UserExerciseOppion] where Valid = 1 and Type = '{2}' and UserID='{0}' and ExerciseID='{1}'",
                        Session["UserID"].ToString(), this.exerciseID, (int)Common.Common.ExerciseOppion.IsLike);
                    dal.ExecSQL(sqlDel);
                }
            }
        }

        private void DealAjax_UserComment()
        {
            string htmlComment = string.Empty;
            DataTable dtUser;
            if(request.Form["comment"]!=null)
            {
                //入库:用户输入的TEXT，防止SQL注入
                string userid = Session["UserID"].ToString();
                string sqlInsert =
                    @"INSERT INTO [zhenyuFitness].[dbo].[UserExerciseOppion]
                           ([ID]
                           ,[UserID]
                           ,[ExerciseID]
                           ,[Type]
                           ,[Rate]
                           ,[Comment]
                           ,[SubmitDateTime]
                           ,[CreateUser]
                           ,[CreateDate]
                           ,[LastModifiedUser]
                           ,[LastModifiedDate]
                           ,[Valid])
                     VALUES
                           (NEWID()
                           ,@userID
                           ,@exerciseID
                           ,1
                           ,''
                           ,@comment
                           ,GETDATE()
                           ,@userID1
                           ,GETDATE()
                           ,@userID2
                           ,GETDATE()
                           ,1)";
                Object[] paramers = new object[] { userid, this.exerciseID, request.Form["comment"].ToString(), userid , userid };
                dal.ExecSQL(sqlInsert, paramers);

                //回传
                string sqlSelect = string.Format("SELECT [UserName],[RealName],[MainProfilePhoto] FROM [zhenyuFitness].[dbo].[User] where Valid = 1 and Activate = 1 and ID = '{0}'", Session["UserID"].ToString());
                dtUser = dal.DoSelectToTable(sqlSelect, "user");
                if(dtUser != null && dtUser.Rows.Count>0)
                {
                    htmlComment = this.HtmlCommentYou("#", Common.Common.ObjectToString(dtUser.Rows[0]["MainProfilePhoto"]), Common.Common.ObjectToString(dtUser.Rows[0]["UserName"]), DateTime.Now.ToString(), request.Form["comment"].ToString());
                }
                else
                {
                    return;
                }
            }
            
            Response.Clear();
            Response.Write(htmlComment);
            Response.End();
        }

        private string HtmlCommentYou(string userLink, string userProfilePic,string userName,string submitDatetime, string comment)
        {
            string html =
           string.Format("<li class=\"media\">" +
                "<a class=\"pull-right\" href=\"{0}\">" +
                    "<img class=\"media-object\" alt=\"Generic placeholder image\" src=\"{1}\">" +
                "</a>" +
                "<div class=\"pull-right media-body chat-pop mod\">" +
                    "<h4 class=\"media-heading\"><span style='font-size:13px;font-family:微软雅黑;color:royalblue'>{2}</span><span class=\"pull-left\">" +
                        "<abbr class=\"timeago\" style='color:royalblue'>{3}</abbr>" +
                        "</span></h4>" +
                    "<p style=\"font-size:15px;text-align:left\">{4}</p>" +
                "</div>" +
            "</li>",userLink, userProfilePic,userName,submitDatetime,comment);
            return html;
        }

        private string HtmlComment(string userLink, string userProfilePic, string userName, string submitDatetime, string comment)
        {
            string html =
                string.Format("<li class=\"media\">" +
                    "<a class=\"pull-left\" href=\"{0}\">" +
                        "<img class=\"media-object\" alt=\"Generic placeholder image\" src=\"{1}\">" +
                    "</a>" +
                    "<div class=\"media-body chat-pop\">" +
                        "<h4 class=\"media-heading\"><span style='font-size:13px;font-family:微软雅黑;color:royalblue'>{2}</span><span class=\"pull-right\">" +
                            "<abbr class=\"timeago\" style='color:royalblue'>{3}</abbr>" +
                        "</span></h4>" +
                        "<p style=\"font-size:15px;\">{4}</p>" +
                    "</div>" +
                "</li>", userLink, userProfilePic, userName, submitDatetime, comment);
            return html;
        }

        public void InitHtml_UserComment()
        {
            this.Html_Comment = string.Empty;
            bool isUserLogin = (Session["UserID"] != null);
            if(this.Data_yourOppion != null && this.Data_yourOppion.Rows.Count>0)
            {
                if (isUserLogin)
                {
                    string userID = Session["UserID"].ToString();
                    for (int i = 0; i < this.Data_yourOppion.Rows.Count; i++)
                    {
                        if(this.Data_yourOppion.Rows[i]["UserID"].ToString() == userID)
                        {
                            this.Html_Comment += this.HtmlCommentYou(
                                "#",
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["MainProfilePhoto"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["UserName"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["SubmitDateTime"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["Comment"]));
                        }
                        else
                        {
                            this.Html_Comment += this.HtmlComment(
                            "#",
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["MainProfilePhoto"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["UserName"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["SubmitDateTime"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["Comment"]));
                        }
                    }
                }
                else
                {
                    for(int i=0;i<this.Data_yourOppion.Rows.Count;i++)
                    {
                        this.Html_Comment += this.HtmlComment(
                            "#",
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["MainProfilePhoto"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["UserName"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["SubmitDateTime"]),
                            Common.Common.ObjectToString(this.Data_yourOppion.Rows[i]["Comment"]));
                    }
                }
            }
        }

        private string ChangeNumToLevel(string num)
        {
            if (num != null && num != string.Empty)
            {
                float v = float.Parse(num);
                if (v > 80 && v <= 100) return "高";
                else if (v > 60 && v <= 80) return "较高";
                else if (v > 40 && v <= 60) return "适中";
                else if (v > 20 && v <= 40) return "较低";
                else return "低";
            }
            else
            {
                return string.Empty;
            }
        }

        private string combineSrcPath(object o)
        {
            return Common.Common.CombineFullResourcePath(Common.Common.ObjectToString(o));
        }
    }
}