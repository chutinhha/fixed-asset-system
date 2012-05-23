using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FixedAsset.Web.AppCode
{
    public class UiConst
    {
        public const string CurrentException = "CurrentException";
        public const string DateFormat = "yyyy-MM-dd";
        public const string DateFormatCh = "yyyy\x5e74MM\x6708dd\x65e5";
        public const string DateTimeFormat = "yyyy-MM-dd HH:mm:ss";
        public const string RateFormat = "0.00";
        public const string MoneyFormat = "###,###.00";
        public const string Log4NetAppender = "SeallNetLog";
        public const string CurrentUser = "CurrentUser";
        public const string CreateAction = "CreateAction";
        public const string UpdateAction = "UpdateAction";
        public const string CopyAction = "CopyAction";
        public const string DeleteAction = "DeleteAction";
        public const string CellPhoneRegex = "^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\\d{8}$";
        public const string QqRegex = "[1-9][0-9]{4,}";
        public const string EmailRegex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

        public const string IpAddressRegex =
            "^((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)$";
    }
}