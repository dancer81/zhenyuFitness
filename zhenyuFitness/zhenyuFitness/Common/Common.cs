using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.UI;

namespace zhenyuFitness.Common
{
    public static class Common
    {
        #region 部署类的配置
        public static string DBConnectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public static string DbLog = System.Configuration.ConfigurationManager.AppSettings["DbLog"];
        public static string AppRootPath = System.Configuration.ConfigurationManager.AppSettings["appRootPath"].ToString();
        public static string ResourceRootPath = System.Configuration.ConfigurationManager.AppSettings["resourceRootPath"].ToString();
        public static string LogOutRedirectPage = System.Configuration.ConfigurationManager.AppSettings["logOutRedirectPage"].ToString();
        public static string NotPermittedRedirectPage = System.Configuration.ConfigurationManager.AppSettings["notPermittedRedirectPage"].ToString();
        public static string NotLoginRedirectPage = System.Configuration.ConfigurationManager.AppSettings["notLoginRedirectPage"].ToString();
        #endregion

        #region Test相关的页面访问开关
        //是否打开权限验证
        public static bool OpenPrivilege = false;
        //不管是否有正在进行的健身计划，均可访问此页面
        public static bool OpenGoalSettingPrivilege = false;
        #endregion

        // 最小计分投票人数，小于该值则采用默认得分
        public static int MinExerciseRateCount = 10;
        //指示页面是否已经登录过，跳过权限认证，提高效率
        public static string HasPermission = "1";

        #region 追踪相关
        public enum ActivityTracked
        {
            [Description("A和B成为了朋友")]
            BeFriendsWith,
            [Description("A关注了B")]
            Follow,
            [Description("A在fitboard上发布信息")]
            MessageOnBoard,
            [Description("A上传照片")]
            UploadPhotos,
            [Description("A新建了健身目标")]
            AddFitnessGoal,
            [Description("A删除了健身目标")]
            DeleteFitnessGoal,
            [Description("A浏览了B的健身目标")]
            ViewFitnessGoal,
            [Description("A制定了健身计划")]
            AddWorkoutPlan,
            [Description("A更新了健身计划")]
            UpdateWorkoutPlan,
            [Description("A删除了健身计划")]
            DeleteWorkoutPlan,
            [Description("A激励了B")]
            Motivate,
            [Description("A更新了身体数据")]
            UpdateBodyStatus,
            [Description("其他")]
            Other,
        };
        #endregion

        #region 目标相关
        public enum GoalDirection
        {
            [Description("增肌")]
            GainMuscle,
            [Description("减脂")]
            LoseFat,
            [Description("塑形")]
            Transform,
            [Description("耐力")]
            Enduarence,
            [Description("体育运动")]
            Sports,
            [Description("柔韧性")]
            Flexibility,
            [Description("其他")]
            Other,
        };

        public static string GainMuscleDesc = "增肌";
        public static string LoseFatDesc = "减脂";
        public static string TransformDesc = "塑形";
        public static string EnduarenceDesc = "耐力";
        public static string SportsDesc = "体育运动";
        public static string FlexibilityDesc = "柔韧性";
        public static string OtherDesc = "其他";

        public enum GoalPhysique
        {
            [Description("（女）时尚女模特")]
            Female_Model,
            [Description("（女）比基尼女郎")]
            Female_SwimSuit,
            [Description("（女）健康女士")]
            Female_FitWomen,
            [Description("（女）健身达人")]
            Female_FitnessModel,
            [Description("（女）健美运动员")]
            Femal_BodyBuilder,
            [Description("（男）Skinny Ripped")]
            Male_SkinnyRipped,
            [Description("（男）模特")]
            Male_Model,
            [Description("（男）运动员")]
            Male_Athlete,
            [Description("（男）健身达人")]
            Male_Bodybuilder,
            [Description("（男）大力士")]
            Male_Strongman,
            [Description("（男）健美运动员")]
            Male_ProBodybuilder,
        };

        public static string Male_SkinnyRippedDesc = "精干而犀利";
        public static string Male_ModelDesc = "男性模特";
        public static string Male_AthleteDesc = "对抗类运动员";
        public static string Male_BodybuilderDesc = "健身达人";
        public static string Male_StrongmanDesc = "大力士";
        public static string Male_ProBodybuilderDesc = "健美运动员";
        public static string Female_ModelDesc = "时尚女模特";
        public static string Female_SwimSuitDesc = "比基尼女郎";
        public static string Female_FitWomenDesc = "健康女士";
        public static string Female_FitnessModel = "健身达人";
        public static string Female_Bodybuilder = "健美运动员";

        #endregion

        #region 动作相关
        public enum ForceType
        {
            [Description("推")]
            Push,
            [Description("拉")]
            Pull,
            [Description("其他")]
            Other,
        };

        //public enum ExerciseType
        //{
        //    [Description("力量")]
        //    Strenth,
        //    [Description("有氧")]
        //    Cardio,
        //    [Description("拉伸")]
        //    Stretch,
        //    [Description("其他")]
        //    Other,
        //}

        public enum MechanicType
        {
            [Description("复合运动")]
            Compound,
            [Description("单关节运动")]
            Single,
            [Description("拉伸")]
            Strech,
            [Description("其他")]
            Other,
        };

        public enum ExerciseOppion
        {
            [Description("评分")]
            Rate,
            [Description("评论")]
            Comment,
            [Description("喜欢")]
            IsLike,
            [Description("转发")]
            Post,
            [Description("其他")]
            Other,
        };
        #endregion

        #region 权限相关
        /// <summary>
        /// 权限对象，如：用户、角色、页面等等
        /// </summary>
        public enum PrivilegeMaster
        {
            [Description("用户")]
            User,
            [Description("角色")]
            Role,
        };

        /// <summary>
        /// 权限被操作的对象，如：页面、按钮、菜单等等
        /// </summary>
        public enum PrivilegeAccess
        {
            [Description("页面")]
            Page,
        };

        /// <summary>
        /// 权限的具体操作
        /// </summary>
        public enum PrivilegeOperation
        {
            [Description("允许访问")]
            Enabled,
            [Description("不允许访问")]
            Disabled,
        };
        #endregion

        #region 字符串相关
        /// <summary>
        /// 构造sql语句in过滤条件。如：'AB05D2A1-53BE-41D1-9BC7-C27F1BD8D7D0','BF1F92BB-5BA0-4CD5-A639-935C344C06D8'
        /// </summary>
        /// <param name="ss"></param>
        /// <returns></returns>
        public static string WhereCondition_In(string[] ss)
        {
            string inCondition = "";
            for (int i = 0; i < ss.Length; i++)
            {
                if (i == 0) inCondition += "'" + ss[i] + "'";
                else
                {
                    inCondition += ",'" + ss[i] + "'";
                }
            }
            return inCondition;
        }

        /// <summary>
        /// 分割字符串
        /// </summary>
        /// <param name="s">源字符串</param>
        /// <param name="c">分隔符</param>
        /// <returns></returns>
        public static string[] SpilitString(string s, char c)
        {
            string[] listString = s.Split(c);
            return listString;
        }

        ///// <summary>
        ///// 字符型数据库字段过滤
        ///// </summary>
        ///// <param name="field"></param>
        ///// <returns></returns>
        //public static string FilterTableField(object field)
        //{
        //    if (field == null) return string.Empty;
        //    else
        //    {
        //        return field.ToString();
        //    }
        //}

        public static string WhereCondition_Equal(string[] names, string[] values)
        {
            string equalCondition = "";
            for (int i = 0; i < names.Length; i++)
            {
                if (values[i] == null || values[i] == "") continue;
                else equalCondition += " and " + names[i] + "= '" + values[i] + "'";
            }
            return equalCondition;
        }
        public static string GetJson(List<Pair> ss)
        {
            string json = "{";
            for (int i = 0; i < ss.Count; i++)
            {
                json += "\"" + ss[i].First.ToString() + "\":\"" + ss[i].Second.ToString() + "\",";
            }
            json = json.Substring(0, json.Length - 1);
            json += "}";
            return json;
        }

        public static string ObjectToString(object o)
        {
            if (o != null) return o.ToString();
            else return string.Empty;
        }

        public static string CombineFullResourcePath(string path)
        {
            if (path != string.Empty)
                return ResourceRootPath + "/" + path;
            return string.Empty;
        }

        public static bool NoneOrEmptyString(object o)
        {
            if(o == null || o.ToString() == string.Empty)
            {
                return true;
            }
            return false;
        }
        #endregion

        //#region 数学类
        //public static float 
        //#endregion
    }
}