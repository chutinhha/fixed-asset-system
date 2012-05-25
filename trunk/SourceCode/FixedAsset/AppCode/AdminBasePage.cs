///******************************************************************
// * Copyright(c)  
// * Description	 : 
// * CreateDate	 : 2012-1-9
// * Creater		 : peter.lu
// * LastChangeDate: 
// * LastChanger	 : 
// * Version Info	 : 
// * ******************************************************************/
//using System;
//using System.Configuration;
//using System.Data;
//using System.Web.UI;
//using iKC.Web.UI.WebControls;
///// <summary>
/////AdminBasePage 的摘要说明
///// </summary>
//public class AdminBasePage : Page
//{
//    protected override void OnPreInit(EventArgs e)
//    {
//        base.OnPreInit(e);

//    }
//    private bool isCheck
//    {
//        get
//        {
//            if (ViewState["isCheck"] == null)
//            {
//                return false;
//            }
//            else
//            {
//                return (bool)ViewState["isCheck"];
//            }
//        }
//        set
//        {
//            ViewState["isCheck"] = value;
//        }
//    }
//    protected bool CheckLogin()
//    {

//        //UsersAndRoleAndApproveAndWAIT enuser = new UsersAndRoleAndApproveAndWAIT();
//        //enuser.Id = "FD24C209-EA13-4267-B6B0-3DE89F2CC91B";
//        //enuser.Username = "test";

//        //WebCaching.ALLSYSTEMUSERCaching = enuser;
//        if (Session["Login_user"] == null)
//        {
//            return false;
//        }
//        else
//        {
//            return true;
//        }
//    }
//    protected override void OnLoad(EventArgs e)
//    {
//        //判断是否登录
//        if (!CheckLogin())
//        {
//            //Session["PreviousPageUrl"] = this.Page.Request.Url;
//           // ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location.href='login.aspx';</script>");
//            //Response.Redirect("~/admin/login.aspx");
//            //ClientScript.RegisterStartupScript(Page.GetType(), "", "myrefresh()", true);
//            //ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", " <script> returnlogin(true); </script> ");
//            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", " <script> window.parent.location.href='login.aspx'; </script> "); 
//            return;
//        }

//        if (!isCheck)
//        {
//            CheckRight(false);
//        }
//        base.OnLoad(e);
//    }
//    public string GetUrl(string strUrl)
//    {
//        if (strUrl.IndexOf("/") > -1)
//        {
//            strUrl = strUrl.Substring(strUrl.IndexOf("/") + 1);
//            return GetUrl(strUrl);
//        }
//        else
//            return strUrl;
//    }
//    /// <summary>
//    /// 检查登录和权限
//    /// </summary>
//    /// <param name="isCheckDataRight">是否检查数据权限</param>
//    public void CheckRight(bool isCheckDataRight)
//    {
//        UsersAndRoleAndApproveAndWAIT enUser = new UsersAndRoleAndApproveAndWAIT();

//        enUser = (UsersAndRoleAndApproveAndWAIT)Session["Login_user"];


       

//        string sUrl = GetUrl(this.Page.Request.Url.LocalPath.ToLower());
//        if (sUrl.IndexOf("main")==-1)
//        {
//            if (sUrl.IndexOf("modify_pwd") == -1)
//            {
//                if (EncodeHelper.MD5Encode(enUser.Username) == enUser.Password)
//                {
//                    Response.Redirect("modify_pwd.aspx");
//                }
//            }
//        }
//        DataRow[] approvesteplist = enUser.UserRoleRights.Select("functionurl='" + sUrl + "'");

//        if (approvesteplist.Length > 0)
//        {
//            #region 新增权限
//            if (!approvesteplist[0]["rightscode"].ToString().Contains("C"))
//            {
//                if (this.Master.FindControl("EmptyMasteCPH") != null)
//                {
//                    if (this.Master.FindControl("EmptyMasteCPH").FindControl("btnAdd") != null)
//                    {
//                        (this.Master.FindControl("EmptyMasteCPH").FindControl("btnAdd")).Visible = false;
//                    }
//                }
//            }
//            #endregion
//            #region 修改权限
//            if (!approvesteplist[0]["rightscode"].ToString().Contains("U"))
//            {
//                if (this.Master.FindControl("EmptyMasteCPH") != null)
//                {
//                    if (this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult") != null)
//                    {
//                        //((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult")).Columns[nTemp].Visible = false;    
//                        SGridView gv = ((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult"));
//                        for (int i = 0; i < gv.Rows.Count; i++)
//                        {
//                            if (gv.Rows[i].FindControl("btnUpdate") != null)
//                                gv.Rows[i].FindControl("btnUpdate").Visible = false;
//                        }
//                    }
//                    if (this.Master.FindControl("EmptyMasteCPH").FindControl("btnUpdate") != null)
//                    {
//                        this.Master.FindControl("EmptyMasteCPH").FindControl("btnUpdate").Visible = false;
//                    }
//                }
//            }
//            #endregion
//            #region 删除权限
//            if (!approvesteplist[0]["rightscode"].ToString().Contains("D"))
//            {
//                if (this.Master.FindControl("EmptyMasteCPH") != null)
//                {
//                    if (this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult") != null)
//                    {
//                        //((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult")).Columns[nTemp].Visible = false;    
//                        SGridView gv = ((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult"));
//                        for (int i = 0; i < gv.Rows.Count; i++)
//                        {
//                            if (gv.Rows[i].FindControl("btnDel") != null)
//                                gv.Rows[i].FindControl("btnDel").Visible = false;
//                        }
//                    }
//                    if (this.Master.FindControl("EmptyMasteCPH").FindControl("btnDel") != null)
//                    {
//                        this.Master.FindControl("EmptyMasteCPH").FindControl("btnDel").Visible = false;
//                    }
//                }
//            }
//            #endregion
//            #region 审核权限
//            //if (!approvesteplist[0]["rightscode"].ToString().Contains("A"))
//            //{
//            //    if (this.Master.FindControl("EmptyMasteCPH") != null)
//            //    {
//            //        if (this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult") != null)
//            //        {
//            //            //((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult")).Columns[nTemp].Visible = false;    
//            //            SGridView gv = ((SGridView)this.Master.FindControl("EmptyMasteCPH").FindControl("grdResult"));
//            //            for (int i = 0; i < gv.Rows.Count; i++)
//            //            {
//            //                if (gv.Rows[i].FindControl("btnAudit") != null)
//            //                    gv.Rows[i].FindControl("btnAudit").Visible = false;
//            //            }
//            //        }
//            //        if (this.Master.FindControl("EmptyMasteCPH").FindControl("btnAudit") != null)
//            //        {
//            //            this.Master.FindControl("EmptyMasteCPH").FindControl("btnAudit").Visible = false;
//            //        }
//            //    }
//            //}
//            #endregion
//        }



//    }

//    /// <summary>
//    /// 当前登录用户
//    /// </summary>
//    public UsersAndRoleAndApproveAndWAIT CurrentUser
//    {
//        get
//        {

//            UsersAndRoleAndApproveAndWAIT enUser = new UsersAndRoleAndApproveAndWAIT();
//            if (Session["Login_user"] != null)
//            {
//                enUser = (UsersAndRoleAndApproveAndWAIT)Session["Login_user"];
//            }
//            else
//            {
//                ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", " <script> returnlogin(true); </script> ");  

//            }
//            return enUser;
//        }
//    }

//    public void AddLoginUser(UsersAndRoleAndApproveAndWAIT oSysUser)
//    {
//        Session["Login_user"] = oSysUser;
//        //记录登录日志
//        LogLoginAction();
//    }
//    protected void LogLoginAction()
//    {
//        if (Session["Login_user"] != null)
//        {
//            UsersAndRoleAndApproveAndWAIT useren = (UsersAndRoleAndApproveAndWAIT)Session["Login_user"];
//            SLoginlogEntity en = new SLoginlogEntity();
//            en.Id = Guid.NewGuid().ToString();

//            en.UserId = useren.Id;
//            en.UserName = useren.Username;
//            en.LoginDate = DateTime.Now;
//            en.LoginoutDate = DateTime.Now;
//            en.Ip = UIHelper.GetIP();
//            SLoginlog.InsertSLoginlog(en);
//            WebCaching.LogUserCaching = en.Id;
//        }
//    }
//    /// <summary>
//    /// 记录操作日志
//    /// </summary>
//    /// <param name="ActionType">动作类型</param>
//    /// <param name="Key">操作数据关键字</param>
//    /// <param name="IsSuccess">是否成功</param>
//    /// <param name="Exception">异常信息</param>
//    /// <param name="Entities">数据</param>
//    protected void LogAction(BaseEnum.ActionType ActionType, string Key, bool IsSuccess, Exception Exception, string ModuleName, params EntityBase[] Entities)
//    {
//        if (ConfigurationManager.AppSettings["OperationLog_Enable"] == "1")
//        {



//            SOperationlogEntity operationLogEntity = new SOperationlogEntity();

//            operationLogEntity.Thekey = Key;

//            operationLogEntity.Actiontype = ((int)ActionType).ToString();

//            if (Exception != null)
//            {
//                operationLogEntity.ActionData = "Message:\r\n" + Exception.Message + "\r\nStackTrace:\r\n+" + Exception.StackTrace + "\r\nSource:\r\n" + Exception.Source;
//            }
//            operationLogEntity.OperatorDate = DateTime.Now;
//            operationLogEntity.Ip = UIHelper.GetIP();
//            operationLogEntity.ActionResult = IsSuccess ? "1" : "0";
//            operationLogEntity.OperatorId = CurrentUser.Id;
//            operationLogEntity.OperatorName = CurrentUser.Username;




//            operationLogEntity.Dataxml = "";

//            foreach (EntityBase entity in Entities)
//            {

//                //operationLogEntity.Dataxml += SerializeHelper.SerializeObjectToString(entity);

//                operationLogEntity.Dataxml += "\r\n\r\n";

//            }
//            string strURL = Request.Url.ToString().Substring(Request.Url.ToString().LastIndexOf("/") + 1);
//            SModuleEntity enModule = SModule.GetLeftModuleInfoByUrl(strURL);
//            if (!string.IsNullOrEmpty(enModule.Id))
//            {
//                operationLogEntity.ModuleId = enModule.Id;
//                operationLogEntity.ModuleName = enModule.Modulename;
//            }
//            operationLogEntity.ModuleName = ModuleName;
//            operationLogEntity.Id = Guid.NewGuid().ToString();
//            SOperationlog.InsertSOperationlog(operationLogEntity);


//        }



//    }

//    /// <summary>
//    /// 判断当前用户对当前事务的审核权限
//    /// </summary>
//    /// <param name="user_id">当前用户ID</param>
//    /// <param name="approvetype">事务类型,取枚举里面定义的值</param>
//    /// <param name="APPROVE_ID">事务ID</param>
//    /// <returns></returns>
//    public bool IsApproveRight(string user_id, string ApproveTypeEnum, string APPROVE_ID)
//    {
//        string sqlstr = "select * from T_APPROVE_WAIT where state=0 and Wait_APPROVE_ID='" + user_id + "' and T_APPROVE_TYPE='" + (ApproveTypeEnum).ToString() + "' and approve_id='" + APPROVE_ID + "' ";
//        DataSet ds = KFSQ.DataAccess.DataAccessCommon.SelectDataSet(sqlstr);
//        if (ds != null && ds.Tables[0].Rows.Count > 0)
//        {
//            if (ds.Tables[0].Rows[0]["APPROVE_USER_ID"].ToString() != "")
//                return false;
//            else
//                return true;
//        }
//        else
//            return false;
//    }


//    /// <summary>
//    /// 事务审核统一使用方法，只处理待办事项。并且返回单据状态，审核通过
//    /// </summary>
//    /// <param name="user_id">当前用户ID</param>
//    /// <param name="ApproveTypeEnum">单据类型</param>
//    /// <param name="APPROVE_ID">单据ID</param>
//    /// <param name="Remarks">审核说明</param>
//    /// <param name="islast">out  返回是否最后一次审核，1否，0是</param>
//    /// <returns></returns>
//    public bool InsertApproveWait(string user_id, string ApproveTypeEnum,
//        string APPROVE_ID, string Remarks, out int islast)
//    {
//        //根据当前用户、事务类型、事务ID 查询待办信息，
//        try
//        {

//            TApproveWaitEntity WaitEn = new TApproveWaitEntity();
//            TApproveWaitEntity WaitEnTow = new TApproveWaitEntity();
//            WaitEn = TApproveWait.GetTApproveWaitByUserIDAndTypeAndApprove(user_id, (ApproveTypeEnum).ToString(), APPROVE_ID);
//            //修改当前待办。
//            if (WaitEn == null)
//                throw new Exception("当前单据不存在待办信息！");
//            WaitEn.ApproveDate = DateTime.Now;
//            WaitEn.ApproveUserId = user_id;
//            WaitEn.ApproveRemark = Remarks;

//            //判断是否最后一个事务审核
//            DataSet waitds = new DataSet();
//            string sqlstr = @"select * from T_APPROVE_STEP where up_level in(
//select T_APPROVE_STEP.ID from T_APPROVE_STEP 
//left join T_APPROVE_USER on T_APPROVE_USER.LEVEL_ID = T_APPROVE_STEP.id
//where T_APPROVE_STEP.t_approve_type='" + (ApproveTypeEnum).ToString() + "' and T_APPROVE_USER.User_Id='" + user_id + "') and Level_Number=" + (WaitEn.ApproveNumber + 1) + "";
//            waitds = KFSQ.DataAccess.DataAccessCommon.SelectDataSet(sqlstr);
//            if (waitds != null && waitds.Tables[0].Rows.Count > 0)
//            {
//                islast = 1;//存在下级审核
//                //新增下游待办。
//                WaitEnTow.Id = Guid.NewGuid().ToString();
//                WaitEnTow.TApproveType = (ApproveTypeEnum).ToString();
//                WaitEnTow.ApproveId = APPROVE_ID;
//                WaitEnTow.ApproveDate = DateTime.Now;
//                WaitEnTow.ApproveUserId = "n";
//                WaitEnTow.ApproveRemark = "";
//                WaitEnTow.ApproveNumber = WaitEn.ApproveNumber + 1;
//                WaitEnTow.WaitApproveId = TApproveWait.GetUserIdASApprove(waitds.Tables[0].Rows[0]["ID"].ToString());//下一个审核人
//                WaitEnTow.ApproveUrl = WaitEn.ApproveUrl;
//                WaitEnTow.State = 0;
//                WaitEnTow.ApproveTitle = WaitEn.ApproveTitle;
//            }
//            else
//                islast = 0;//不存在下级审核，已经是最后一级。
//            TApproveWait.InserTApproveWait(WaitEn, WaitEnTow);
//            return true;
//        }
//        catch (Exception ex)
//        {
//            throw ex;

//        }
//    }
//    /// <summary>
//    /// 事务审核统一使用方法，只处理待办事项。审核不通过
//    /// </summary>
//    /// <param name="user_id">当前用户ID</param>
//    /// <param name="ApproveTypeEnum">单据类型</param>
//    /// <param name="Approve_id">单据ID</param>
//    /// <param name="Remarks">审核说明</param>
//    /// <param name="islast">out  返回是否最后一次审核不通过，1否，0是</param>
//    /// <returns></returns>
//    public bool CloseApproveWait(string user_id, string ApproveTypeEnum,
//        string Approve_id, string Remarks, out int islast)
//    {
//        try
//        {

//            TApproveWaitEntity WaitEn = new TApproveWaitEntity();
//            TApproveWaitEntity WaitEnTow = new TApproveWaitEntity();

//            WaitEn = TApproveWait.GetTApproveWaitByUserIDAndTypeAndApprove(user_id, (ApproveTypeEnum).ToString(), Approve_id);
//            //修改当前待办。
//            if (WaitEn == null)
//                throw new Exception("当前单据不存在待办信息！");
//            WaitEn.ApproveDate = DateTime.Now;
//            WaitEn.ApproveUserId = user_id;
//            WaitEn.ApproveRemark = Remarks;
//            if (WaitEn.ApproveNumber == 1)
//            {
//                islast = 0;

//            }
//            else
//            {
//                islast = 1;
//                //新增上游待办。
//                WaitEnTow.Id = Guid.NewGuid().ToString();
//                WaitEnTow.TApproveType = (ApproveTypeEnum).ToString();
//                WaitEnTow.ApproveId = Approve_id;
//                WaitEnTow.ApproveDate = DateTime.Now;
//                WaitEnTow.ApproveUserId = "n";
//                WaitEnTow.ApproveRemark = "";
//                WaitEnTow.ApproveNumber = WaitEn.ApproveNumber - 1;
//                WaitEnTow.WaitApproveId = TApproveWait.GetUserIdASApproveUP(ApproveTypeEnum, WaitEnTow.ApproveNumber);//下一个审核人
//                WaitEnTow.ApproveUrl = WaitEn.ApproveUrl;
//                WaitEnTow.State = 0;
//                WaitEnTow.ApproveTitle = WaitEn.ApproveTitle;
//            }

//            TApproveWait.InserTApproveWait(WaitEn, WaitEnTow);
//            return true;
//        }
//        catch (Exception ex)
//        {
//            throw ex;

//        }
//    }

//    public bool CloseApproveWait(string user_id, string ApproveTypeEnum,
//            string Approve_id, string Remarks)
//    {
//        try
//        {

//            TApproveWaitEntity WaitEn = new TApproveWaitEntity();

//            WaitEn = TApproveWait.GetTApproveWaitByUserIDAndTypeAndApprove(user_id, (ApproveTypeEnum).ToString(),

//Approve_id);
//            //修改当前待办。
//            WaitEn.ApproveDate = DateTime.Now;
//            WaitEn.ApproveUserId = user_id;
//            WaitEn.ApproveRemark = Remarks;

//            TApproveWait.InserTApproveWait(WaitEn, null);
//            return true;
//        }
//        catch (Exception ex)
//        {
//            throw ex;

//        }
//    }
//    /// <summary>
//    /// 事务审核统一使用方法，只处理待办事项。审核撤销
//    /// </summary>   
//    /// <param name="Approve_id">单据ID</param> 
//    /// <returns></returns>
//    //public bool ClearApproveWait(string Approve_id)
//    //{
//    //    try
//    //    {
//    //        TApproveWait.DeleteTApproveWait(Approve_id, 0);

//    //        return true;
//    //    }
//    //    catch (Exception ex)
//    //    {
//    //        throw ex;

//    //    }
//    //}
//    /// <summary>
//    /// 事务新增或提交时，保存到待办
//    /// </summary>
//    /// <param name="ApproveTypeEnum">单据类型,字典表中的对应approvetype类型的VALUES值</param>
//    /// <param name="APPROVE_ID">单据ID</param>
//    ///  /// <param name="url">url,必须自己设置好参数等信息。</param>
//    ///  <param name="url">事务标题</param>
//    /// <returns></returns>
//    public bool InsertNewApproveWait(string type, string APPROVE_ID, string url, string ApproveTitle)
//    {
//        try
//        {
//            TApproveWaitEntity WaitEn = new TApproveWaitEntity();
//            //新增下游待办。
//            WaitEn.Id = Guid.NewGuid().ToString();
//            WaitEn.TApproveType = (type).ToString();
//            WaitEn.ApproveId = APPROVE_ID;
//            WaitEn.ApproveDate = DateTime.Now;
//            WaitEn.ApproveUserId = "n";
//            WaitEn.ApproveRemark = "";
//            WaitEn.ApproveNumber = 1;
//            WaitEn.WaitApproveId = TApproveWait.GetUserIdASApproveOn((type).ToString());//下一个审核人
//            WaitEn.ApproveUrl = url;
//            WaitEn.State = 0;
//            WaitEn.ApproveTitle = ApproveTitle;
//            TApproveWait.InserTApproveWait(null, WaitEn);
//            return true;
//        }
//        catch (Exception ex)
//        {
//            throw ex;
//        }
//    }
//    /// <summary>
//    /// 查询当前事务ID对应的审核记录
//    /// 返回内容说明  shr 审核人，APPROVE_DATE   审核时间，APPROVE_REMARK  审核意见，approve_title  事务标题
//    /// </summary>
//    /// <param name="APPROVE_ID">事务ID</param>
//    /// <returns>dataset </returns>
//    public DataSet GetApproveWait(string APPROVE_ID)
//    {
//        try
//        {
//            return TApplicationDA.GetTApproveWaitAll(APPROVE_ID);
//        }
//        catch (Exception ex)
//        {
//            throw ex;
//        }
//    }

//    /// <summary>
//    /// 查询当前待办信息
//    /// </summary>
//    /// <param name="ApproveTypeEnum">事务类型</param>
//    /// <param name="user_id">用户ID</param>
//    /// <returns></returns>
//    public DataSet GetApproveID(BaseEnum.ApproveTypeEnum ApproveTypeEnum, string user_id)
//    {
//        string strSql = "SELECT * FROM T_APPROVE_WAIT";
//        strSql += " where Wait_APPROVE_ID='" + user_id + "'";
//        if (ApproveTypeEnum != null)
//            strSql += " and T_APPROVE_TYPE='" + (int)ApproveTypeEnum + "'";
//        strSql += " order by approve_date desc";
//        return KFSQ.DataAccess.DataAccessCommon.SelectDataSet(strSql);
//    }

//    public static string toGB(string str,int num)
//    {

//        try
//        {
//            return str.Substring(0,num);
//        }
//        catch (Exception e)
//        {
//            return null;
//        }
//    }


//}