/********************************************************************
* File Name:Rolepermission
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
    ///ROLEPERMISSION
    /// <summary>
    [Serializable]
    public partial class Rolepermission
    {
        #region ��ɫ���
        ///<summary>
        ///ColumnName:��ɫ���;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
        #endregion

        #region �˵����
        ///<summary>
        ///ColumnName:�˵����;Size:40;NOT NULL
        ///</summary>
        public string Menuid{  get;set;}
        #endregion

        #region ��ע
        ///<summary>
        ///ColumnName:��ע;Size:800;
        ///</summary>
        public string Remark{  get;set;}
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
