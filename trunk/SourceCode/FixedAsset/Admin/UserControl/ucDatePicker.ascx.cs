using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucDatePicker : System.Web.UI.UserControl
    {
        #region Properties
        public bool Enabled
        {
            get
            {
                bool enabled = true;
                enabled = this.txtDatePicker.Enabled;
                return enabled;
            }
            set
            {
                if (value == false)
                {
                    txtDatePicker.Enabled = false;
                }
                else
                {
                    txtDatePicker.Enabled = true;
                }
            }
        }

        public Unit Width
        {
            get
            {
                Unit width = 120;
                width = this.txtDatePicker.Width;
                return width;
            }
            set
            {
                if (value.ToString().Trim().Length <= 0)
                {
                    txtDatePicker.Width = 120;
                }
                else
                {
                    txtDatePicker.Width = value;
                }
            }
        }

        public DateTime? DateValue
        {
            get
            {
                DateTime dateTime = DateTime.MinValue;
                if (DateTime.TryParse(this.txtDatePicker.Text, out dateTime))
                {

                    return dateTime;
                }
                else
                {
                    txtDatePicker.Text = string.Empty;
                    return null;
                }
            }
            set
            {
                if (value .HasValue)
                {
                    txtDatePicker.Text = value.Value.ToString(FixedAsset.Web.AppCode.UiConst.DateFormat);
                }
                else
                {
                    txtDatePicker.Text = string.Empty;
                }
            }
        }

        public DateTime MinDate
        {
            get
            {
                DateTime dateTime = DateTime.MinValue;
                if (!DateTime.TryParse(this.hfMinDate.Value, out dateTime))
                {
                    hfMinDate.Value = string.Empty;
                }
                return dateTime;
            }
            set
            {
                if (value != DateTime.MinValue)
                {
                    hfMinDate.Value = value.ToString(UiConst.DateFormat);
                }
                else
                {
                    hfMinDate.Value = string.Empty;
                }
            }
        }

        public DateTime MaxDate
        {
            get
            {
                DateTime dateTime = DateTime.MinValue;
                if (!DateTime.TryParse(this.hfMaxDate.Value, out dateTime))
                {
                    hfMaxDate.Value = string.Empty;
                }
                return dateTime;
            }
            set
            {
                if (value != DateTime.MinValue)
                {
                    hfMaxDate.Value = value.ToString(UiConst.DateFormat);
                }
                else
                {
                    hfMaxDate.Value = string.Empty;
                }
            }
        }
        #endregion 

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }
    }
}