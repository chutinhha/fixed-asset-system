/********************************************************************
* File Name:Menuitem
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-06-05
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    ///<summary>
    ///≤Àµ•±Ì
    ///</summary>
    [Serializable]
    public partial class Menuitem
    {
        #region ±‡∫≈
        ///<summary>
        ///ColumnName:±‡∫≈;Size:40;NOT NULL
        ///</summary>
        public string Menuid{  get;set;}
        #endregion

        #region ≤Àµ•√˚
        ///<summary>
        ///ColumnName:≤Àµ•√˚;Size:100;
        ///</summary>
        public string Menuname{  get;set;}
        #endregion

        #region ∏∏≤Àµ•±‡∫≈
        ///<summary>
        ///ColumnName:∏∏≤Àµ•±‡∫≈;Size:40;
        ///</summary>
        public string Parentmenuid{  get;set;}
        #endregion

        #region ¡¥Ω”µÿ÷∑
        ///<summary>
        ///ColumnName:¡¥Ω”µÿ÷∑;Size:100;
        ///</summary>
        public string Menuaddress{  get;set;}
        #endregion

        #region ≈≈–Ú
        ///<summary>
        ///ColumnName:≈≈–Ú;
        ///</summary>
        public decimal Orderby{  get;set;}
        #endregion

        #region π¶ƒ‹±‡∫≈
        ///<summary>
        ///ColumnName:π¶ƒ‹±‡∫≈;Size:50;
        ///</summary>
        public string Functionid{  get;set;}
        #endregion

        #region ∞¥≈•±‡∫≈£®“‘∂∫∫≈∑÷∏Ó£©
        ///<summary>
        ///ColumnName:∞¥≈•±‡∫≈£®“‘∂∫∫≈∑÷∏Ó£©;Size:200;
        ///</summary>
        public string Buttonid{  get;set;}
        #endregion

    }


}
