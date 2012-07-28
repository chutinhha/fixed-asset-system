using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using FixedAsset.Web.AppCode;
using log4net;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;
using SeallNet.Utility;

namespace FixedAsset.Web
{
    public class BasePage :System.Web.UI.Page
    {
        #region Properties
        protected ILog Log = LogManager.GetLogger(@"FixedAssetLog");
        protected bool IsPoupPage
        {
            get
            {
                if (ViewState["IsPoupPage"] == null)
                {
                    ViewState["IsPoupPage"] = false;
                }
                return bool.Parse(ViewState["IsPoupPage"].ToString());
            }
            set { ViewState["IsPoupPage"] = value; }
        }
        protected int PoupPageLevel
        {
            get
            {
                if (ViewState["PoupPageLevel"] == null)
                {
                    ViewState["PoupPageLevel"] = 1;
                }
                return int.Parse(ViewState["PoupPageLevel"].ToString());
            }
            set { ViewState["PoupPageLevel"] = value; }
        }
        protected virtual string PrePageUrl
        {
            get
            {
                if (ViewState["PrePageUrl"] == null)
                {
                    ViewState["PrePageUrl"] = Server.UrlDecode(PageUtility.GetQueryStringValue("PrePageUrl"));
                }
                return ViewState["PrePageUrl"].ToString();
            }
            set { ViewState["PrePageUrl"] = value; }
        }
        
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            //当前页面不是系统登录页面和错误页,判断Session是否过期););
            if (Request.CurrentExecutionFilePath.ToString().ToLower().LastIndexOf("Login.aspx".ToLower()) < 0
                && Request.CurrentExecutionFilePath.ToString().ToLower().LastIndexOf("Error.aspx".ToLower()) < 0)
            {
                //判断用户Session是否过期
                if (WebContext.Current.CurrentUser == null)
                {
                    //Response.Redirect(ResolveUrl(@"~/admin/Login.aspx"));
                    var script = new StringBuilder();
                    script.Append(@"<script type=""text/javascript"">");
                    script.AppendFormat("window.top.location.href='{0}'", ResolveUrl(@"~/admin/Login.aspx"));
                    script.Append("</script>");
                    Response.Write(script.ToString());
                }
            }
            base.OnLoad(e);
        }
        protected override void OnError(EventArgs e)
        {
            base.OnError(e);
            Exception exception = Server.GetLastError();
            Log.Error(exception.Message, exception);
            if (exception is System.Data.OracleClient.OracleException)
            {
                exception = new Exception("系统出错了，请联系系统管理员！");
            }
            Response.Redirect(ResolveUrl("~/Error.aspx"));
        }
        #endregion

        #region Methods
        protected void InitAssetState(DropDownList dropDownList,bool isLoadAll)
        {
            if(isLoadAll)
            {
                dropDownList.Items.Add(new ListItem("全部",""));
            }
            var dic = EnumUtil.RetrieveEnumDictionary(typeof(AssetState));
            foreach (KeyValuePair<Enum, string> valuePair in dic)
            {
                dropDownList.Items.Add(new ListItem(valuePair.Value, valuePair.Key.ToString()));
            }
        }
        protected void InitManageMode(DropDownList dropDownList,bool  isLoadAll)
        {
            if (isLoadAll)
            {
                dropDownList.Items.Add(new ListItem("全部", ""));
            }
            var dic = EnumUtil.RetrieveEnumDictionary(typeof(ManageMode));
            foreach (KeyValuePair<Enum, string> valuePair in dic)
            {
                dropDownList.Items.Add(new ListItem(valuePair.Value, valuePair.Key.ToString()));
            }
        }
        protected void InitFinanceCategory(DropDownList dropDownList, bool isLoadAll)
        {
            if (isLoadAll)
            {
                dropDownList.Items.Add(new ListItem("全部", ""));
            }
            var dic = EnumUtil.RetrieveEnumDictionary(typeof(FinanceCategory));
            foreach (KeyValuePair<Enum, string> valuePair in dic)
            {
                dropDownList.Items.Add(new ListItem(valuePair.Value, valuePair.Key.ToString()));
            }
        }
        protected void InitSetupStates(DropDownList dropDownList,bool isLoadAll)
        {
            if (isLoadAll)
            {
                dropDownList.Items.Add(new ListItem("全部", ""));
            }
            var dic = EnumUtil.RetrieveEnumDictionary(typeof(SetupState));
            foreach (KeyValuePair<Enum, string> valuePair in dic)
            {
                dropDownList.Items.Add(new ListItem(valuePair.Value, valuePair.Key.ToString()));
            }
        }
        #endregion
    }
}