/********************************************************************
* File Name:Roleinfo
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
    ///<summary>
    ///ROLEINFO
    ///</summary>
    [Serializable]
    public partial class Roleinfo
    {
        #region ��ɫID
        ///<summary>
        ///ColumnName:��ɫID;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
        #endregion

        #region ��ɫ��
        ///<summary>
        ///ColumnName:��ɫ��;Size:40;
        ///</summary>
        public string Rolename{  get;set;}
        #endregion

        #region ��ɫ״̬
        ///<summary>
        ///ColumnName:��ɫ״̬;
        ///</summary>
        public RoleState Rolestate { get; set; }
        #endregion

        #region ��ɫ����
        ///<summary>
        ///ColumnName:��ɫ����;Size:400;
        ///</summary>
        public string Description { get; set; }
        #endregion

        #region ����༭
        ///<summary>
        ///ColumnName:����༭;
        ///</summary>
        public bool Allowedit { get; set; }
        #endregion

        #region ����ʱ��
        ///<summary>
        ///ColumnName:����ʱ��;
        ///</summary>
        public DateTime? Createddate { get; set; }
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:40;
        ///</summary>
        public string Creator { get; set; }
        #endregion

        #region ����޸�ʱ��
        ///<summary>
        ///ColumnName:����޸�ʱ��;
        ///</summary>
        public DateTime? Lastmodifieddate { get; set; }
        #endregion

        #region ����޸���
        ///<summary>
        ///ColumnName:����޸���;Size:40;
        ///</summary>
        public string Lastmodifiedby { get; set; }
        #endregion
    }
}
