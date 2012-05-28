using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace FixedAsset.Web
{
    public class PageUtility
    {
        #region QueryString
        public static string GetQueryStringValue(string paramName)
        {
            return HttpContext.Current.Request.QueryString[paramName] == null ? "" : HttpContext.Current.Request.QueryString[paramName];
        }
        public static int GetQueryIntValue(string paramName)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                HttpContext.Current.Response.Write(String.Format(@"没有传入""{0}""参数！", paramName));
                HttpContext.Current.Response.End();
                return 0;
            }

            int ret;

            if (int.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            HttpContext.Current.Response.Write(string.Format(@"参数""{0}""格式不正确！", paramName));
            HttpContext.Current.Response.End();
            return 0;
        }
        public static int GetQueryIntValue(string paramName, int defaultValue)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                return defaultValue;
            }

            int ret;

            if (int.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            return defaultValue;
        }
        public static long GetQueryInt64Value(string paramName)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                HttpContext.Current.Response.Write(string.Format(@"没有传入""{0}""参数！", paramName));
                HttpContext.Current.Response.End();
                return 0;
            }

            long ret;

            if (long.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            HttpContext.Current.Response.Write(string.Format(@"参数""{0}""格式不正确！", paramName));
            HttpContext.Current.Response.End();
            return 0;
        }
        public static long GetQueryInt64Value(string paramName, long defaultValue)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                return defaultValue;
            }

            long ret;

            if (long.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            return defaultValue;
        }
        public static DateTime GetQueryDateTimeValue(string paramName)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                HttpContext.Current.Response.Write(string.Format(@"没有传入""{0}""参数！", paramName));
                HttpContext.Current.Response.End();
                return DateTime.Now;
            }

            DateTime ret;

            if (DateTime.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            HttpContext.Current.Response.Write(string.Format(@"参数""{0}""格式不正确！", paramName));
            HttpContext.Current.Response.End();
            return DateTime.Now;
        }
        public static decimal GetQueryDecimalValue(string paramName)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                HttpContext.Current.Response.Write(string.Format(@"没有传入""{0}""参数！", paramName));
                HttpContext.Current.Response.End();
                return 0;
            }

            decimal ret;

            if (decimal.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            HttpContext.Current.Response.Write(string.Format(@"参数""{0}""格式不正确！", paramName));
            HttpContext.Current.Response.End();
            return 0;
        }
        /// <summary>
        /// 获取安全的请求参数值
        /// </summary>
        /// <param name="key">参数key</param>
        /// <returns></returns>
        public static string GetSafeRequest(string key)
        {
            if (HttpContext.Current.Request[key] != null)
            {
                return GetSafeText(HttpContext.Current.Request[key]);
            }
            else
            {
                return string.Empty;
            }
        }
        /// <summary>
        /// 将字串处理为安全的字串，防止脚本等攻击
        /// </summary>
        /// <param name="text">要转换的原字串</param>
        /// <returns>去掉可能有攻击危险的脚本标志的字串</returns>
        public static string GetSafeText(string text)
        {
            string str = text.Replace("\r\n", "");
            return HttpContext.Current.Server.HtmlEncode(str);
        }
        #endregion

        #region Retrieve IP address
        ///// <summary>
        ///// 获取客户端IP地址
        ///// </summary>
        ///// <returns></returns>
        //public static string GetIP()
        //{
        //    string result = string.Empty;
        //    result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        //    if (string.IsNullOrEmpty(result))
        //    {
        //        result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        //    }
        //    if (string.IsNullOrEmpty(result))
        //    {
        //        result = HttpContext.Current.Request.UserHostAddress;
        //    }
        //    if (string.IsNullOrEmpty(result) || !IsIP(result))
        //    {
        //        return "0.0.0.0";
        //    }
        //    return result;
        //}
        ///// <summary>
        ///// 是否为ip
        ///// </summary>
        ///// <param name="ip"></param>
        ///// <returns></returns>
        //public static bool IsIP(string ip)
        //{
        //    return Regex.IsMatch(ip, @"^((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)$");
        //}
        #endregion

        #region RemoveHtml
        /// <summary>
        /// 移除Html标记
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public static string RemoveHtml(string content)
        {
            if (string.IsNullOrEmpty(content))
            {
                return string.Empty;
            }
            content = content.Replace("&nbsp;", string.Empty);
            content = content.Replace("<br/>;", string.Empty);
            content = Regex.Replace(content, @"<[^>]*>", string.Empty, RegexOptions.IgnoreCase);
            content = Regex.Replace(content, "\\s+", string.Empty, RegexOptions.IgnoreCase);
            return content;
        }
        #endregion

        #region CmycurD
        /// <summary>  
        /// 转换人民币大小金额  
        /// </summary>  
        /// <param name="num">金额</param>  
        /// <returns>返回大写形式</returns>  
        public static string CmycurD(decimal num)
        {
            string str1 = "零壹贰叁肆伍陆柒捌玖";            //0-9所对应的汉字  
            string str2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; //数字位所对应的汉字  
            string str3 = string.Empty;    //从原num值中取出的值  
            string str4 = string.Empty;    //数字的字符串形式  
            string str5 = string.Empty;  //人民币大写金额形式  
            int i;    //循环变量  
            int j;    //num的值乘以100的字符串长度  
            string ch1 = string.Empty;    //数字的汉语读法  
            string ch2 = string.Empty;    //数字位的汉字读法  
            int nzero = 0;  //用来计算连续的零值是几个  
            int temp;            //从原num值中取出的值 

            num = Math.Round(Math.Abs(num), 2);    //将num取绝对值并四舍五入取2位小数  
            str4 = ((long)(num * 100)).ToString(); //将num乘100并转换成字符串形式  
            j = str4.Length;                       //找出最高位  
            if (j > 15) { return "溢出"; }
            str2 = str2.Substring(15 - j);         //取出对应位数的str2的值。如：200.55,j为5所以str2=佰拾元角分 

            //循环取出每一位需要转换的值  
            for (i = 0; i < j; i++)
            {
                str3 = str4.Substring(i, 1);          //取出需转换的某一位的值  
                temp = int.Parse(str3); //转换为数字
                if (i != (j - 3) && i != (j - 7) && i != (j - 11) && i != (j - 15))
                {
                    //当所取位数不为元、万、亿、万亿上的数字时  
                    if (str3 == "0")
                    {
                        ch1 = "";
                        ch2 = "";
                        nzero = nzero + 1;
                    }
                    else
                    {
                        if (str3 != "0" && nzero != 0)
                        {
                            ch1 = "零" + str1.Substring(temp * 1, 1);
                            ch2 = str2.Substring(i, 1);
                            nzero = 0;
                        }
                        else
                        {
                            ch1 = str1.Substring(temp * 1, 1);
                            ch2 = str2.Substring(i, 1);
                            nzero = 0;
                        }
                    }
                }
                else
                {
                    //该位是万亿，亿，万，元位等关键位  
                    if (str3 != "0" && nzero != 0)
                    {
                        ch1 = "零" + str1.Substring(temp * 1, 1);
                        ch2 = str2.Substring(i, 1);
                        nzero = 0;
                    }
                    else
                    {
                        if (str3 != "0" && nzero == 0)
                        {
                            ch1 = str1.Substring(temp * 1, 1);
                            ch2 = str2.Substring(i, 1);
                            nzero = 0;
                        }
                        else
                        {
                            if (str3 == "0" && nzero >= 3)
                            {
                                ch1 = "";
                                ch2 = "";
                                nzero = nzero + 1;
                            }
                            else
                            {
                                if (j >= 11)
                                {
                                    ch1 = "";
                                    nzero = nzero + 1;
                                }
                                else
                                {
                                    ch1 = "";
                                    ch2 = str2.Substring(i, 1);
                                    nzero = nzero + 1;
                                }
                            }
                        }
                    }
                }
                if (i == (j - 11) || i == (j - 3))
                {
                    //如果该位是亿位或元位，则必须写上  
                    ch2 = str2.Substring(i, 1);
                }
                str5 = str5 + ch1 + ch2;

                if (i == j - 1 && str3 == "0")
                {
                    //最后一位（分）为0时，加上“整”  
                    str5 = str5 + '整';
                }
            }
            if (num == 0)
            {
                str5 = "零元整";
            }
            return str5;
        }
        #endregion

        public static List<string> SplitToStrings(string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return new List<string>();
            }
            var values = value.Split(',');
            if (values.Length == 0)
            {
                return new List<string>();
            }
            else
            {
                return values.Where(p => !string.IsNullOrEmpty(p)).Select(p => p).ToList();
            }
        }
        public static string ListToString(List<string> values)
        {
            if (values.Count == 0)
            {
                return string.Empty;
            }
            else
            {
                var content = new StringBuilder();
                foreach (var value in values)
                {
                    content.Append(value).Append(",");
                }
                var temp = content.ToString();
                temp = temp.Substring(0, temp.LastIndexOf(','));
                return temp;
            }
        }
    }
}