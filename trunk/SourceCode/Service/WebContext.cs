using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using FixedAsset.Domain;
using FixedAsset.IServices;

namespace FixedAsset.Services
{
    public class WebContext
    {
        #region Constants
        public const string ConstWebContext = "WebContext";
        public const string ConstSessionId = "ConstSessionId";
        public const string ConstUserMenuItems = "ConstUserMenuItems";

        #endregion

        #region Fields
        private HttpContext _context = HttpContext.Current;
        #endregion

        #region Ctor
        /// <summary>
        /// Creates a new instance of the WebContext class
        /// </summary>
        private WebContext()
        {
        }
        #endregion

        #region Methods

        #endregion

        #region Properties
        /// <summary>
        /// Gets an instance of the WebContext, which can be used to retrieve information about current context.
        /// </summary>
        public static WebContext Current
        {
            get
            {
                if (HttpContext.Current == null)
                {
                    object data = Thread.GetData(Thread.GetNamedDataSlot(ConstWebContext));
                    if (data != null)
                    {
                        return (WebContext)data;
                    }
                    var context = new WebContext();
                    Thread.SetData(Thread.GetNamedDataSlot(ConstWebContext), context);
                    return context;
                }
                if (HttpContext.Current.Items[ConstWebContext] == null)
                {
                    var context = new WebContext();
                    HttpContext.Current.Items.Add(ConstWebContext, context);
                    return context;
                }
                return (WebContext)HttpContext.Current.Items[ConstWebContext];
            }
        }

        public Tuser CurrentUser
        {
            get
            {
                if (string.IsNullOrEmpty(CurrentUserSessionId))
                {
                    return null;
                }
                var user = this[CurrentUserSessionId] as Tuser;
                //长时间没有操作系统，请重新登录系统，Web系统中做不到重新自动登录
                if (user != null)
                {
                    
                }
                return user;
            }
            set
            {
                if (value != null)
                {
                    this.UserMenuItems = null;
                    //if (string.IsNullOrEmpty(value.LastLoginIpAddress)
                    //    || (!string.IsNullOrEmpty(value.LastLoginIpAddress) && value.LastLoginIpAddress == UserHostAddress))
                    //{
                    //    //同一账户重复登录生成新的SessionId
                    CurrentUserSessionId = Guid.NewGuid().ToString("N");//作为单点登录的SessionId
                    if (HttpContext.Current != null)
                    {
                        CurrentUserSessionId = HttpContext.Current.Session.SessionID;
                    }
                    this[CurrentUserSessionId] = value;
                    //}
                    //else
                    //{
                    //    CurrentUserSessionId = value.SessionId;
                    //    this[CurrentUserSessionId] = value;
                    //}
                    //value.LastLoginIpAddress = UserHostAddress;
                    //value.SessionId = CurrentUserSessionId;
                    //value.IsOnline = true;
                    //value.LastLoginTime = DateTime.Now;
                    //UserService.UpdateUserInfoByUserId(value);
                }
                else
                {
                    var user = this[CurrentUserSessionId] as Tuser;
                    if (user != null)
                    {                                                       
                        //////删除登录信息
                        //user.IsOnline = false;
                        //user.LastLoginTime = DateTime.Now;
                        //user.LastLoginIpAddress = this.UserHostAddress;
                        //user.SessionId = string.Empty;
                        //UserService.UpdateUserInfoByUserId(user);//更新到DB 
                        CurrentUserSessionId = string.Empty;
                        this[CurrentUserSessionId] = null;
                    }
                }
            }
        }
        /// <summary>
        /// Gets or sets an object item in the context by the specified key.
        /// </summary>
        /// <param name="key">The key of the value to get.</param>
        /// <returns>The value associated with the specified key.</returns>
        public object this[string key]
        {
            get
            {
                if (this._context == null)
                {
                    return null;
                }

                if (_context.Session[key] != null)
                {
                    return _context.Session[key];
                }
                return null;
            }
            set
            {
                if (this._context != null)
                {
                    _context.Session[key] = value;
                }
            }
        }
        public string CurrentUserSessionId
        {
            get
            {
                if (this[ConstSessionId] != null)
                {
                    return this[ConstSessionId].ToString();
                }
                return string.Empty;
            }
            set { this[ConstSessionId] = value; }
        }
        protected long? CurrentUserId { get; set; }
        /// <summary>
        /// Gets an user host address
        /// </summary>
        public string UserHostAddress
        {
            get
            {
                string result = string.Empty;
                result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (string.IsNullOrEmpty(result))
                {
                    result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                }
                if (string.IsNullOrEmpty(result))
                {
                    result = HttpContext.Current.Request.UserHostAddress;
                }
                if (string.IsNullOrEmpty(result) || !Regex.IsMatch(result, "^((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)$"))
                {
                    return "0.0.0.0";
                }
                return result;
            }
        }
        /// <summary>
        /// 用户拥有权限的菜单
        /// </summary>
        public List<Menuitem> UserMenuItems
        {
            get
            {
                List<Menuitem> menuItems = null;
                if (this[ConstUserMenuItems] == null)
                {
                    //this[ConstUserMenuItems] = UserService.RetrieveMenuItemsByUserId(CurrentUser.UserId);
                }
                menuItems = this[ConstUserMenuItems] as List<Menuitem>;
                if (menuItems == null || menuItems.Count == 0)
                {
                    //menuItems = UserService.RetrieveMenuItemsByUserId(CurrentUser.UserId);
                    this[ConstUserMenuItems] = menuItems;
                }
                if (menuItems == null) { menuItems = new List<Menuitem>(); }
                return menuItems;
            }
            private set { this[ConstUserMenuItems] = value; }
        }
        protected ITuserService UserService
        {
            get { return new TuserService() ; }
        }
        protected IMenuitemService MenuItemService
        {
            get { return new MenuitemService(); }
        }
        #endregion
    }
}
