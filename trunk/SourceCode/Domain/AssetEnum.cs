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
    [EnumCatetory(EnumName = "审核结果")]
    public enum Approveresult:int
    {
        [EnumDescript(Descript = "草稿")]
        Draft = 0,
        [EnumDescript(Descript = "审核中")]
        Approving = 10,
        [EnumDescript(Descript = "同意")]
        Approved = 20,
        [EnumDescript(Descript = "同意")]
        Rejected = 30,
    } 
}
