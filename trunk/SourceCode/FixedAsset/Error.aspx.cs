using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web
{
    public partial class Error : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
            try
            {
                base.OnLoad(e);
                if (!IsPostBack)
                {
                    var exception = Session[UiConst.CurrentException] as Exception;
                    if (exception != null)
                    {
                        litError.Text = exception.ToString();
                        Session[UiConst.CurrentException] = null;
                    }
                }
            }
            catch (Exception exception)
            {
               
            }
        }
    }
}