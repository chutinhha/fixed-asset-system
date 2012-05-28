using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FixedAsset.Domain;

namespace FixedAsset.DataAccess
{
    public class VstorageaddressManagement : BaseManagement
    {
        #region Construct 
        public VstorageaddressManagement()
        { }
        public VstorageaddressManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion
        public List<Vstorageaddress>  RetrieveAllVstorageaddress()
        {
            try
            {
                string sqlCommand = @"SELECT * FROM v_storage_address";
                return this.Database.ExecuteToList<Vstorageaddress>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }  
        }
    }
}
