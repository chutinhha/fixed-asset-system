/********************************************************************
* File Name:Usermaproleinfo
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
    ///USERMAPROLEINFO
    /// <summary>
    [Serializable]
    public partial class Usermaproleinfo
    {
        #region �û�ID
        ///<summary>
        ///ColumnName:�û�ID;Size:40;NOT NULL
        ///</summary>
        public string Userid{  get;set;}
        #endregion

        #region ��ɫID
        ///<summary>
        ///ColumnName:��ɫID;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
        #endregion

        #region ����޸�ʱ��
        ///<summary>
        ///ColumnName:����޸�ʱ��;
        ///</summary>
        public DateTime? Lastmodifieddate{  get;set;}
        #endregion

        #region ����޸���
        ///<summary>
        ///ColumnName:����޸���;Size:40;
        ///</summary>
        public string Lastmodifiedby{  get;set;}
        #endregion

    }


}
