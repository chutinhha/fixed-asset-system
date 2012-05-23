﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using log4net.Config;

namespace FixedAsset.Web
{
    public class Global : System.Web.HttpApplication
    {

        /// <summary>
        /// Configuration Log4net 
        /// </summary>
        protected void ConfigureLogging()
        {
            if (HttpContext.Current != null)
            {
                //Classic Application Pool TempImages
                if (!string.IsNullOrEmpty(HttpContext.Current.Request.PhysicalApplicationPath))
                {
                    string logFile = HttpContext.Current.Request.PhysicalApplicationPath + "log4net.config";
                    if (File.Exists(logFile))
                    {
                        XmlConfigurator.Configure(new System.IO.FileInfo(logFile));
                    }
                }
            }
        }
        protected void Application_Start(object sender, EventArgs e)
        {
            ConfigureLogging();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}