/********************************************************************
* File Name:Subcompanyinfo
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-27
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
    ///SUBCOMPANYINFO
    /// <summary>
    [Serializable]
    public partial class Subcompanyinfo
    {
        #region �ֹ�˾���
        ///<summary>
        ///ColumnName:�ֹ�˾���;NOT NULL
        ///</summary>
        public decimal Subcompanyid{  get;set;}
        #endregion

        #region �ֹ�˾����
        ///<summary>
        ///ColumnName:�ֹ�˾����;Size:100;
        ///</summary>
        public string Subcompanyname{  get;set;}
        #endregion

        #region �ֹ�˾����ID
        ///<summary>
        ///ColumnName:�ֹ�˾����ID;Size:100;
        ///</summary>
        public string Fgssortid{  get;set;}
        #endregion

        #region �ֹ�˾����(700,701,702)
        ///<summary>
        ///ColumnName:�ֹ�˾����(700,701,702);Size:3;
        ///</summary>
        public string Subcompanycode{  get;set;}
        #endregion

    }


}
