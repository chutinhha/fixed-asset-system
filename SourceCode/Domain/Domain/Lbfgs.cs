/********************************************************************
* File Name:Lbfgs
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-25
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
    ///LB_FGS
    /// <summary>
    [Serializable]
    public partial class Lbfgs
    {
        #region �ֹ�˾ID
        ///<summary>
        ///ColumnName:�ֹ�˾ID;NOT NULL
        ///</summary>
        public decimal Fgsid{  get;set;}
        #endregion

        #region �ֹ�˾����
        ///<summary>
        ///ColumnName:�ֹ�˾����;Size:100;
        ///</summary>
        public string Fgs{  get;set;}
        #endregion

        #region �ֹ�˾����ID
        ///<summary>
        ///ColumnName:�ֹ�˾����ID;Size:100;
        ///</summary>
        public string Fgssortid{  get;set;}
        #endregion

        #region FGLD
        ///<summary>
        ///ColumnName:FGLD;Size:100;
        ///</summary>
        public string Fgld{  get;set;}
        #endregion

        #region FGLDLXDH
        ///<summary>
        ///ColumnName:FGLDLXDH;Size:50;
        ///</summary>
        public string Fgldlxdh{  get;set;}
        #endregion

        #region WLLZGY
        ///<summary>
        ///ColumnName:WLLZGY;Size:100;
        ///</summary>
        public string Wllzgy{  get;set;}
        #endregion

        #region WLLZGYLXDH
        ///<summary>
        ///ColumnName:WLLZGYLXDH;Size:50;
        ///</summary>
        public string Wllzgylxdh{  get;set;}
        #endregion

    }


}
