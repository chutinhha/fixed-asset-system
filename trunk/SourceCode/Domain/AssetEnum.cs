using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SeallNet.Utility;

namespace FixedAsset.Domain
{
    [EnumCatetory(EnumName = "编码模式")]
    public enum CodeMode:int 
    {
        [EnumDescript(Descript = "默认")]
        DefaultMode = 0,
        [EnumDescript(Descript = "年份")]
        Year = 10,
        [EnumDescript(Descript = "月份")]
        Month = 20,
        [EnumDescript(Descript = "日")]
        Day = 30,
    }
    [EnumCatetory(EnumName = "采购计划状态")]
    public enum ApproveResult:int
    {
        [EnumDescript(Descript = "草稿")]
        Draft = 0,
        [EnumDescript(Descript = "已提交")]
        Approving = 1,
        [EnumDescript(Descript = "同意")]
        Approved = 2,
        [EnumDescript(Descript = "拒绝")]
        Rejected = 3,
        [EnumDescript(Descript = "已废除")]
        Deleted = 4,
    }
    
    #region 设备部分
    /// <summary>
    /// 在用，未用，报废
    /// </summary>
    [EnumCatetory(EnumName = "设备状态")]
    public enum AssetState : int
    {
        [EnumDescript(Descript = "在用")]
        InUse = 1,
        [EnumDescript(Descript = "未用")]
        NoUse = 2,
        [EnumDescript(Descript = "报废")]
        Scrapped = 3,
    }
    ///Managemode
    /// /// <summary>
    /// 托管:0自管:1
    /// </summary>
    [EnumCatetory(EnumName = "管理模式")]
    public enum ManageMode : int
    {
        [EnumDescript(Descript = "托管")]
        Managed = 0,
        [EnumDescript(Descript = "自管")]
        SelfManagement = 1
    }
    ///<summary>
    /// 财务类别(A帐:0B帐:1)
    /// </summary>
    [EnumCatetory(EnumName = "财务类别")]
    public enum FinanceCategory : int
    {
        [EnumDescript(Descript = "A帐")]
        AAccount = 0,
        [EnumDescript(Descript = "B帐")]
        BAccount = 1
    }
    #endregion

    [EnumCatetory(EnumName = "设备安装状态")]
    public enum SetupState : int
    {
        [EnumDescript(Descript = "草稿")]
        Draft = 0,
        [EnumDescript(Descript = "已提交")]
        Approving = 1,
        [EnumDescript(Descript = "同意")]
        Approved = 2,
        [EnumDescript(Descript = "拒绝")]
        Rejected = 3,
        [EnumDescript(Descript = "已废除")]
        Deleted = 4,
    }
}
