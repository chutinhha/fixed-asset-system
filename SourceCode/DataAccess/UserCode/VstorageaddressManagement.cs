using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FixedAsset.Domain;

namespace FixedAsset.DataAccess.UserCode
{
    public class VstorageaddressManagement : BaseManagement
    {
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
