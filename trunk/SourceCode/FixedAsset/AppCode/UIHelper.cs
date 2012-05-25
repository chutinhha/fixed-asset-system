using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Text;

using System.Text.RegularExpressions;
using System.Net;
namespace FixedAsset.Web
{
    public class UIHelper
    {
        public static string HtmlToText(string strContent)
        {
            strContent = strContent.Replace("&amp", "&");
            strContent = strContent.Replace("''", "'");
            strContent = strContent.Replace("&lt", "<");
            strContent = strContent.Replace("&gt", ">");
            strContent = strContent.Replace("&lt", "chr(60)");
            strContent = strContent.Replace("&gt", "chr(37)");
            strContent = strContent.Replace("&quot", "\"");
            strContent = strContent.Replace(";", "");
            strContent = strContent.Replace("<br />", "\n");
            strContent = strContent.Replace("&nbsp;", " ");
            return strContent;
        }

        /// <summary>
        /// 绑定SortedList到下拉框
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="sl"></param>
        public static void BindSortList(DropDownList ddl, SortedList sl)
        {
            ddl.Items.Clear();
            ddl.DataSource = sl;
            ddl.DataTextField = "value";
            ddl.DataValueField = "key";
            ddl.DataBind();
        }

        /// <summary>
        /// 添加下拉框中“请选择”项
        /// </summary>
        /// <param name="ddl"></param>
        public static void InsertFirstItem(DropDownList ddl)
        {
            ddl.Items.Insert(0, new ListItem("请选择...", ""));
        }

        /// <summary>
        /// 当查询返回空数据时，显示Grid表头
        /// </summary>
        /// <param name="gv"></param>
        /// <param name="dt"></param>
        public static void BindEmptyGridView(GridView gv, DataTable dt)
        {
            gv.DataSource = null;
            gv.DataBind();
            if (gv.Rows.Count == 0)
            {
                dt.Rows.Add(dt.NewRow());
                dt.AcceptChanges();
                gv.DataSource = dt;
                gv.DataBind();
                gv.Rows[0].Cells[0].Text = "";
                gv.Rows[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }
        }

        #region MyRegion
        /// <summary>
        /// 从Html中提取出Text
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static string ExtractPlainTextWithLinefeedsOutOfHtml(string html)
        {
            string input = html;
            if ((input == null) && (input == string.Empty))
            {
                return input;
            }
            return Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(input, "[ \n]+", " ", RegexOptions.Multiline | RegexOptions.IgnoreCase), @"<script[^>]*>.*\?</script>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<br[^>]*>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p [^>]*>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</p [^>]*>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<hr>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), @"<!--.*\?-->", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</h2>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</h3>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</h4>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<table[^>]*>\r", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\r</table[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\r</tbody[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\r</tr[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\r</td[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\n ", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase).Replace("\r\n", "\r").Replace("\n", "\r").Replace("\r\r", "<p>").Replace("\r", "<br>");
        }

        /// <summary>
        /// 剔除Script标签
        /// </summary>
        /// <param name="dirtyText"></param>
        /// <returns></returns>
        public static string StripScriptTagsFromInput(string dirtyText)
        {
            return Regex.Replace(dirtyText, "<script((.|\n)*?)</script>", "&lt;!-- Inject Script Filtered --&gt;", RegexOptions.Multiline | RegexOptions.IgnoreCase);
        }

        /// <summary>
        /// 从Url中剔除机器名
        /// </summary>
        /// <param name="input"></param>
        /// <param name="servername"></param>
        /// <returns></returns>
        public static string RemoveServerNamesFromUrls(string input, string servername)
        {
            if (input == null)
            {
                throw new ArgumentNullException("input");
            }
            if (servername == null)
            {
                throw new ArgumentNullException("servername");
            }
            StringBuilder builder = new StringBuilder("(href|src)\\s*=\\s*([\"']?)http(s?)://");
            foreach (char ch in servername)
            {
                builder.Append(@"\u");
                builder.Append(((int)ch).ToString("x").PadLeft(4, '0'));
            }
            builder.Append("/");
            Regex regex = new Regex(builder.ToString(), RegexOptions.Singleline | RegexOptions.Compiled | RegexOptions.IgnoreCase);
            return regex.Replace(input, "$1=$2/");
        }

        /// <summary>
        /// 把Word转换为对应的HTML
        /// </summary>
        /// <param name="String_Word"></param>
        /// <returns></returns>
        public static string ConvertWordToHTML(string String_Word)
        {
            string input = String_Word;
            if ((input == null) && (input == string.Empty))
            {
                return input;
            }
            return Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(Regex.Replace(input, @"<\?xml[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), @"<span[^>]*><\/span[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), @"<span[^>]*><\/span[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<span><span>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), @"<\/span><\/span>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<script((.|\n)*?)</script>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<[^>]*>", "", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<br[^>]*>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p [^>]*>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</p [^>]*>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "</p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<hr>", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\n ", "\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "<p>", "\n\n", RegexOptions.Multiline | RegexOptions.IgnoreCase), "\n\n", "<p>"), "\n", "<br>");
        }

        /// <summary>
        /// 剔除绝对连接
        /// </summary>
        /// <param name="input"></param>
        /// <param name="abspath"></param>
        /// <returns></returns>
        public static string RemoveAbsolutelLinkPaths(string input, string abspath)
        {
            if (input == null)
            {
                throw new ArgumentNullException("input");
            }
            if (abspath == null)
            {
                throw new ArgumentNullException("abspath");
            }
            if (!abspath.StartsWith("/"))
            {
                throw new ArgumentException("abspath must starts with '/'", "abspath");
            }
            abspath = abspath.Substring(0, abspath.LastIndexOf('/') + 1);
            StringBuilder builder = new StringBuilder("(href|src)\\s*=\\s*([\"']?)");
            foreach (char ch in abspath)
            {
                builder.Append(@"\u");
                builder.Append(((int)ch).ToString("x").PadLeft(4, '0'));
            }
            Regex regex = new Regex(builder.ToString(), RegexOptions.Singleline | RegexOptions.Compiled | RegexOptions.IgnoreCase);
            return regex.Replace(input, "$1=$2");
        }

        /// <summary>
        /// 截字符串
        /// </summary>
        /// <param name="needCutString"></param>
        /// <param name="maxLength"></param>
        /// <returns></returns>
        public static string CutofString(string needCutString, int maxLength)
        {
            string result = ConvertWordToHTML(needCutString).Replace("&nbsp", "").Replace("\r", "").Replace("\n", "").Replace("<br>", "");
            if (result.Length > maxLength)
            {
                result = result.Substring(0, maxLength - 3) + "...";

            }
            return result;
        }

        public static string RemoveLine(string line)
        {
            string result = string.Empty;
            if (!string.IsNullOrEmpty(line))
            {
                result = line.Substring(1);
            }
            return result;
        }
        #endregion

        #region 设置TextBox与DropdownList读写状态
        /// <summary>
        /// 设置TextBox与DropdownList读写状态
        /// </summary>
        /// <param name="container"></param>
        /// <param name="readOnly"></param>
        public static void SetControlStatus(Control container, bool readOnly)
        {
            foreach (Control ctl in container.Controls)
            {
                WebControl wctl = ctl as WebControl;
                if (wctl is TextBox)
                {
                    TextBox tb = wctl as TextBox;
                    tb.ReadOnly = readOnly;
                    tb.CssClass = "";
                    if (readOnly)
                    {
                        tb.CssClass = "";
                    }
                    //wctl.Enabled = 
                }
                else if (wctl is DropDownList)
                {
                    DropDownList ddl = wctl as DropDownList;
                    ddl.Enabled = !readOnly;
                }
                else
                {
                    if (ctl.Controls.Count > 0)
                        SetControlStatus(ctl, readOnly);
                }
            }
        }
        #endregion

        #region JavaScript 相关

        public static void Alert(object control, string strMsg)
        {
            AlertMessage(control, strMsg);
        }

        public static void AlertMessageGoToURL(object control, string message, string url)
        {
            ShowAlertGoToURL(control, message, url);
        }
        private static void ShowAlertGoToURL(object control, string message, string url)
        {
            //string str = "ShowAlertAndGotoUrl(\"提示 \",\"" + message + "\",\"" + url + "\");\n";
            string str = "ShowTopAlertAndGotoUrl(\"提示 \",\"" + message + "\",\"" + url + "\");\n";


            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowAlertAndGotoUrl", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowAlertAndGotoUrl", str, true);
            }
        }

        public static void AlertMessage(object control, string message)
        {
            ShowAlert(control, message, "提示");
        }
        public static void AlertConfirmNew(object control, string message, string clientButtonId)
        {
            string str = "ShowConfirm('提示信息',\"" + message + "\",'confirmCallback(\\'" + clientButtonId + "\\')');";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowConfirm", str, true);
            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowConfirm", str, true);
            }
        }
        public static void AlertConfirm(object control, string btnURL)
        {
            //"ShowConfirm('提示信息','您正在删除科室：" + e.Row.Cells[0].Text + "，您确认继续吗？','confirmCallback(\\'" + btnDel.ClientID + "\\')');return false;";

            //string str = "ShowAlert(\"" + title + "\",\"" + message + "\");\n";
            string str = "ShowConfirm('提示信息','金币不足，是否需要充值？','confirmCallback(\\'" + btnURL + "\\')');";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowConfirm", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowConfirm", str, true);

            }
        }

        private static void ShowAlert(object control, string message, string title)
        {

            //string str = "ShowAlert(\"" + title + "\",\"" + message + "\");\n";
            string str = "ShowTopAlert(\"" + title + "\",\"" + message + "\");\n";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowAlert", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowAlert", str, true);

            }
        }
        public static void ShowDialogFrame(object control, string title, string url)
        {
            ShowDialogFrame(control, title, url, string.Empty, 600, 400);
        }
        public static void ShowDialogFrame(object control, string title, string url, int width, int height)
        {
            ShowDialogFrame(control, title, url, string.Empty, width, height);
        }
        public static void ShowDialogFrame(object control, string title, string url, string callback)
        {
            ShowDialogFrame(control, title, url, callback, 600, 400);
        }
        public static void ShowDialogFrame(object control, string title, string url, string callback, int width, int height)
        {
            RegsiterShowDialogFrame(control, title, BaseUrl + url, callback, width, height);
        }
        private static void RegsiterShowDialogFrame(object control, string title, string url, string callback, int width, int height)
        {
            string str = "ShowDialogFrame(\"" + title + "\",\"" + url + "\",\"" + callback + "\",\"" + width + "\",\"" + height + "\");\n";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowDialogFrame", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowDialogFrame", str, true);

            }
        }
        public static void ParentFrameRedirect(object control, string url)
        {
            string str = "parent.window.location.href='" + url + "';\n";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ClientRedirect", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ClientRedirect", str, true);

            }
        }


        public static void CloseShowDialogFrame(object control)
        {
            string str = "CloseShowDialogFrame();\n";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "CloseShowDialogFrame", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "CloseShowDialogFrame", str, true);

            }
        }
        public static void AlertAndCloseShowDialogFrame(object control, string message)
        {
            AlertAndCloseShowDialogFrame(control, "提示", message);
        }
        public static void AlertAndCloseShowDialogFrame(object control, string title, string message)
        {

            string str = "AlertAndCloseShowDialogFrame(\"" + title + "\",\"" + message + "\");\n";
            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "AlertAndCloseShowDialogFrame", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "AlertAndCloseShowDialogFrame", str, true);

            }

        }
        public static void ShowElementUseDailog(object control, string elementID, string callback, int width, int height)
        {
            ShowElementUseDailog(control, "提示", elementID, callback, width, height);
        }
        public static void ShowElementUseDailog(object control, string title, string elementID, string callback, int width, int height)
        {
            string str = "ShowElementUseDailog(\"" + title + "\",\"" + elementID + "\",\"" + callback + "\",\"" + width + "\",\"" + height + "\");\n";

            if (control is Page)
            {
                ScriptManager.RegisterStartupScript((Page)control, control.GetType(), "ShowElementUseDailog", str, true);

            }
            if (control is UpdatePanel)
            {
                ScriptManager.RegisterStartupScript((UpdatePanel)control, control.GetType(), "ShowElementUseDailog", str, true);

            }

        }
        #endregion

        #region 添加UpdatePanel触发器
        /// <summary>
        /// Button
        /// </summary>
        public static void AppendButtonTrigger(UpdatePanel up, Button btn)
        {
            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            trigger.ControlID = btn.UniqueID;
            trigger.EventName = "Click";
            up.Triggers.Add(trigger);
        }

        /// <summary>
        /// TextBox
        /// </summary>
        public static void AppendTextChangeTrigger(UpdatePanel up, TextBox tb)
        {
            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            trigger.ControlID = tb.UniqueID;
            trigger.EventName = "TextChanged";
            up.Triggers.Add(trigger);
        }

        /// <summary>
        /// DropDownList
        /// </summary>
        public static void AppendTextChangeTrigger(UpdatePanel up, DropDownList ddl)
        {
            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            trigger.ControlID = ddl.UniqueID;
            trigger.EventName = "TextChanged";
            up.Triggers.Add(trigger);
        }

        /// <summary>
        /// ListBox
        /// </summary>
        public static void AppendListBoxTrigger(UpdatePanel up, ListBox list)
        {
            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            trigger.ControlID = list.UniqueID;
            trigger.EventName = "SelectedIndexChanged";
            up.Triggers.Add(trigger);
        }
        #endregion

        #region 给TextBox设置最大长度
        /// <summary>
        /// 给TextBox设置最大长度
        /// </summary>
        /// <param name="tb"></param>
        /// <param name="maxLength"></param>
        public static void SetTextBoxLength(TextBox tb, int maxLength)
        {
            tb.Attributes.Add("onKeyUp", "CheckLength('" + tb.ClientID + "'," + maxLength.ToString() + ")");
        }
        #endregion

        #region Static AddShowDialog
        /// <summary>
        /// ImageButton
        /// </summary>
        public static void AddShowDialog(System.Web.UI.WebControls.ImageButton button, string strUrl, int intWidth, int intHeight)
        {
            string strScript = "";
            strScript += "var strFeatures = 'dialogWidth=" + intWidth.ToString() + "px;dialogHeight=" + intHeight.ToString() + "px;center=yes;help=no;status=no';";
            strScript += "var strName ='';";
            if (strUrl.Substring(0, 1) == "/")
            {
                strUrl = strUrl.Substring(1, strUrl.Length - 1);
            }
            strUrl = BaseUrl + "DialogFrame.aspx?URL=" + strUrl;
            strScript += "window.showModalDialog(\'" + strUrl + "\',window,strFeatures);return false;";
            button.Attributes.Add("onClick", strScript);
        }

        /// <summary>
        /// Button
        /// </summary>
        public static void AddShowDialog(System.Web.UI.WebControls.Button button, string strUrl, int intWidth, int intHeight)
        {
            string strScript = "";
            strScript += "var strFeatures = 'dialogWidth=" + intWidth.ToString() + "px;dialogHeight=" + intHeight.ToString() + "px;center=yes;help=no;status=no';";
            strScript += "var strName ='';";
            if (strUrl.Substring(0, 1) == "/")
            {
                strUrl = strUrl.Substring(1, strUrl.Length - 1);
            }
            strUrl = BaseUrl + "DialogFrame.aspx?URL=" + strUrl;
            strScript += "window.showModalDialog(\'" + strUrl + "\',window,strFeatures);return false;";
            button.Attributes.Add("onClick", strScript);
        }

        /// <summary>
        /// LinkButton
        /// </summary>
        public static void AddShowDialog(System.Web.UI.WebControls.LinkButton button, string strUrl, int intWidth, int intHeight)
        {
            string strScript = "";
            strScript += "var strFeatures = 'dialogWidth=" + intWidth.ToString() + "px;dialogHeight=" + intHeight.ToString() + "px;center=yes;help=no;status=no';";
            strScript += "var strName ='';";
            if (strUrl.Substring(0, 1) == "/")
            {
                strUrl = strUrl.Substring(1, strUrl.Length - 1);
            }
            strUrl = BaseUrl + "DialogFrame.aspx?URL=" + strUrl;
            strScript += "window.showModalDialog(\'" + strUrl + "\',window,strFeatures);return false;";
            button.Attributes.Add("onClick", strScript);
        }
        #endregion



        #region The base url of application
        /// <summary>
        /// The base url of application
        /// </summary>
        public static string BaseUrl
        {
            get
            {
                string strBaseUrl = "";
                strBaseUrl += "http://" + HttpContext.Current.Request.Url.Host;
                if (HttpContext.Current.Request.Url.Port.ToString() != "80")
                {
                    strBaseUrl += ":" + HttpContext.Current.Request.Url.Port;
                }
                strBaseUrl += HttpContext.Current.Request.ApplicationPath;
                if (HttpContext.Current.Request.ApplicationPath[HttpContext.Current.Request.ApplicationPath.Length - 1] != '/')
                {
                    strBaseUrl += "/";
                }
                return strBaseUrl;
            }
        }
        #endregion


        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        /// <returns></returns>
        public static string GetIP()
        {
            string result = String.Empty;
            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
            if (string.IsNullOrEmpty(result) || !IsIP(result))
            {
                return "0.0.0.0";
            }
            //result = Dns.Resolve(Dns.GetHostName()).AddressList[0].ToString();
            return result;
        }

        /// <summary>
        /// 是否为ip
        /// </summary>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static bool IsIP(string ip)
        {
            return Regex.IsMatch(ip, @"^((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)$");
        }


        public static String GetQueryStringValue(String paramName)
        {
            return HttpContext.Current.Request.QueryString[paramName] == null ? "" : HttpContext.Current.Request.QueryString[paramName];
        }

        public static int GetQueryIntValue(String paramName)
        {
            if (String.IsNullOrEmpty(HttpContext.Current.Request.QueryString[paramName]))
            {
                HttpContext.Current.Response.Write(String.Format(@"没有传入""{0}""参数！", paramName));
                HttpContext.Current.Response.End();
                return 0;
            }

            Int32 ret;

            if (Int32.TryParse(HttpContext.Current.Request.QueryString[paramName].ToString(), out ret))
            {
                return ret;
            }

            HttpContext.Current.Response.Write(String.Format(@"参数""{0}""格式不正确！", paramName));
            HttpContext.Current.Response.End();
            return 0;
        }


        /// <summary>
        ///  把试剂读数格式化UI上需要的格式
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static string FormatReagent(decimal data)
        {
            string result = data.ToString();
            int index = result.IndexOf('.');
            if (index > 0)
            {
                result = result.Substring(0, index);
            }
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strNumber"></param>
        /// <returns></returns>
        public static bool IsNumber(String strNumber)
        {

            return IsNumber(strNumber, 32, 0);

        }

        /// <summary>
        /// 判断一个字符串是否为合法数字(指定整数位数和小数位数)
        /// </summary>
        /// <param name="s">字符串</param>
        /// <param name="precision">整数位数</param>
        /// <param name="scale">小数位数</param>
        /// <returns></returns>
        public static bool IsNumber(string s, int precision, int scale)
        {
            if ((precision == 0) && (scale == 0))
            {
                return false;
            }
            string pattern = @"(^\d{1," + precision + "}";
            if (scale > 0)
            {
                pattern += @"\.\d{0," + scale + "}$)|" + pattern;
            }
            pattern += "$)";
            return Regex.IsMatch(s, pattern);
        }


        /**/
        /// <summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>    
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param>    
        public static void MakeThumbnail(string originalImagePath, int width, int height, string mode)
        {
            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

            int towidth = width;
            int toheight = height;

            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;

            switch (mode)
            {
                case "HW"://指定高宽缩放（可能变形）                
                    break;
                case "W"://指定宽，高按比例                    
                    toheight = originalImage.Height * width / originalImage.Width;
                    break;
                case "H"://指定高，宽按比例
                    towidth = originalImage.Width * height / originalImage.Height;
                    break;
                case "Cut"://指定高宽裁减（不变形）                
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * towidth / toheight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * height / towidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }

            //新建一个bmp图片
            System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

            //新建一个画板
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充
            g.Clear(System.Drawing.Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
                new System.Drawing.Rectangle(x, y, ow, oh),
                System.Drawing.GraphicsUnit.Pixel);

            try
            {
                //获得包含有关内置图像编码解码器的信息的ImageCodecInfo 对象。
                if (originalImagePath.ToLower().EndsWith("gif"))
                    bitmap.Save(HttpContext.Current.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);
                else if (originalImagePath.ToLower().EndsWith("png"))
                    bitmap.Save(HttpContext.Current.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);
                else
                    bitmap.Save(HttpContext.Current.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                HttpContext.Current.Response.End();
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }
        }

        public static string UploadFile(FileUpload fudImage, out string msg)
        {
            var filePath = string.Empty;
            msg = "";
            if (fudImage.HasFile)
            {
                //附件的Guid
                string strID = System.Guid.NewGuid().ToString().Substring(0, 10);
                //从web.config中读取上传路径
                string strFileUploadPath = ConfigurationManager.AppSettings["FileUplodeImgPath"].ToString();
                string fileName = HttpContext.Current.Server.HtmlEncode(fudImage.FileName);
                string extension = System.IO.Path.GetExtension(fileName).ToLower();
                if ((extension != ".gif") && (extension != ".jpg") && (extension != ".jpeg") && (extension != ".png") && (extension != ".bmp"))
                {
                    msg = "文件类型不对！";
                    return "";
                }
                int fileSize = fudImage.PostedFile.ContentLength;

                // Allow only files less than 2,100,000 bytes (approximately 2 MB) to be uploaded.
                if (fileSize > 1024 * 1024 * 2)
                {
                    msg = "图片文件超过最大尺寸！";
                    return "";
                }
                //组合成物理路径
                string strFilePhysicalPath = HttpContext.Current.Server.MapPath(strFileUploadPath + "/") + strID + extension;
                //判断文件是否存在
                if (!File.Exists(strFilePhysicalPath))
                {
                    //enObj.Attachment = strFileName;
                    filePath = HttpContext.Current.Server.HtmlEncode(strFileUploadPath + "/" + strID + extension);
                    //保存文件
                    if (!Directory.Exists(HttpContext.Current.Server.MapPath(strFileUploadPath)))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath(strFileUploadPath));
                    }
                    fudImage.SaveAs(strFilePhysicalPath);
                }
            }

            return filePath;
        }

        public static string UploadTxtFile(FileUpload fudImage, out string msg)
        {
            var filePath = string.Empty;
            msg = "";
            if (fudImage.HasFile)
            {
                //附件的Guid
                string strID = System.Guid.NewGuid().ToString().Substring(0, 10);
                //从web.config中读取上传路径
                string strFileUploadPath = ConfigurationManager.AppSettings["FileUplodeImgPath"].ToString();
                string fileName = HttpContext.Current.Server.HtmlEncode(fudImage.FileName);
                string extension = System.IO.Path.GetExtension(fileName);
                if ((extension != ".pdf") && (extension != ".doc") && (extension != ".docx"))
                {
                    msg = "文件类型不对！";
                    return "";
                }
                int fileSize = fudImage.PostedFile.ContentLength;

                // Allow only files less than 2,100,000 bytes (approximately 2 MB) to be uploaded.
                if (fileSize > 1024 * 1024 * 5)
                {
                    msg = "图片文件超过最大尺寸！";
                    return "";
                }
                //组合成物理路径
                string strFilePhysicalPath = HttpContext.Current.Server.MapPath(strFileUploadPath + "/") + strID + extension;
                //判断文件是否存在
                if (!File.Exists(strFilePhysicalPath))
                {
                    //enObj.Attachment = strFileName;
                    filePath = HttpContext.Current.Server.HtmlEncode(strFileUploadPath + "/" + strID + extension);
                    //保存文件
                    if (!Directory.Exists(HttpContext.Current.Server.MapPath(strFileUploadPath)))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath(strFileUploadPath));
                    }
                    fudImage.SaveAs(strFilePhysicalPath);
                }
            }

            return filePath;
        }

        /// <summary>
        /// 格式化月，用于Sql语句
        /// </summary>
        /// <param name="month"></param>
        /// <returns></returns>
        public static string GetMonthByStr(int month)
        {
            return month.ToString().PadLeft(2, '0');

        }

        /// <summary>
        /// 处理:ORA-01461: 仅能绑定要插入 LONG 列的 LONG 值
        /// </summary>
        /// <param name="tempContent">传入文本</param>
        /// <returns>传出文本</returns>
        /// King 二〇一二年三月二十一日 
        public static string CheckClobLength(string tempContent)
        {
            int tempLength = Convert.ToInt32(tempContent.Length);
            // 处理ora-1461问题   
            if (tempLength >= 2000 && tempLength <= 4000)
            {
                tempContent = tempContent.PadRight(4008, ' '); //StringUtils.rightPad(xml, 2008);
            }
            return tempContent;
        }

    }
}