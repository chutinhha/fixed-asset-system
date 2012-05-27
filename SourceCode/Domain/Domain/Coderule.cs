/********************************************************************
* File Name:Coderule
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-26
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///CODERULE
    /// <summary>
    [Serializable]
    public partial class Coderule
    {
        #region 编码前缀
        ///<summary>
        ///ColumnName:编码前缀;Size:20;NOT NULL
        ///</summary>
        public string Codeprefix{  get;set;}
        #endregion

        #region 规则名称
        ///<summary>
        ///ColumnName:规则名称;Size:40;
        ///</summary>
        public string Rulename{  get;set;}
        #endregion

        #region 是否需要编码前缀
        ///<summary>
        ///ColumnName:是否需要编码前缀;
        ///</summary>
        public bool Isneedcodeprefix{  get;set;}
        #endregion

        #region 是否默认规则
        ///<summary>
        ///ColumnName:是否默认规则;
        ///</summary>
        public bool Isdefault { get; set; }
        #endregion

        #region 开始序号
        ///<summary>
        ///ColumnName:开始序号;
        ///</summary>
        public decimal Startnumber{  get;set;}
        #endregion

        #region 序号位数
        ///<summary>
        ///ColumnName:序号位数;
        ///</summary>
        public decimal Numberwidth{  get;set;}
        #endregion

        #region YEARWIDTH
        ///<summary>
        ///ColumnName:YEARWIDTH;
        ///</summary>
        public decimal Yearwidth{  get;set;}
        #endregion

        #region CURRENTNO
        ///<summary>
        ///ColumnName:CURRENTNO;
        ///</summary>
        public decimal Currentno{  get;set;}
        #endregion

        #region CURRENTSERIALNUMBER
        ///<summary>
        ///ColumnName:CURRENTSERIALNUMBER;Size:50;
        ///</summary>
        public string Currentserialnumber{  get;set;}
        #endregion 
    }
}
