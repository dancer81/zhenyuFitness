using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.UI;

namespace zhenyuFitness.Common
{
    public static class Common
    {
        //连接字符串
        public static string DBConnectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        //数据库出错日志
        public static string DbLog = System.Configuration.ConfigurationManager.AppSettings["DbLog"];
        //application root path
        public static string appRootPath = System.Configuration.ConfigurationManager.AppSettings["appRootPath"].ToString();
        //resource root path
        public static string resourceRootPath = System.Configuration.ConfigurationManager.AppSettings["resourceRootPath"].ToString();
        //点击安全退出按钮时默认返回的页面
        public static string LogOutRedirectPage = "/zhenyuFitness/RedirectPages/Login.aspx";
        //用户通过地址栏直接输入网址（前台脚本没有执行：不是通过菜单连接点击,或者用户禁用了浏览器脚本），如果页面判定用户没有权限访问时，跳转的地址
        public static string NotPermittedRedirectPage = "/zhenyuFitness/RedirectPages/Login.aspx";
        //用户（Guest）点击跳转页面，系统判定该页面需要用户登录,而进行Redirect的页面
        public static string NotLoginRedirectPage = "/zhenyuFitness/RedirectPages/Login.aspx";
        //用户有权访问该页面的标识，避免多次调用判定方法，提高性能。
        public static string HasPermission = "1";

        /// <summary>
        /// 最小计分投票人数，小于该值则采用默认得分
        /// </summary>
        public static int minExerciseRateCount = 10;


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
                return resourceRootPath + "/" + path;
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
    }
}