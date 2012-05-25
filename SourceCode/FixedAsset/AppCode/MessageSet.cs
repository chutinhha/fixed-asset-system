//using System;
//using System.Configuration;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.IO;
//using System.Xml;

///// <summary>
/////MessageSet 的摘要说明
///// </summary>
//public sealed class MessageSet
//{
//    public MessageSet()
//    {
//        //
//        //TODO: 在此处添加构造函数逻辑
//        //
//    }
//    /// <summary>
//    /// 获得客户端需要翻译词语的信息
//    /// </summary>
//    /// <param name="p_MessageID">信息ID</param>
//    /// <returns>信息</returns>
//    public static string GetClientMessage(int p_MessageID)
//    {
//        string outstr = string.Empty;

//        FileInfo fi = new FileInfo(ConfigurationSettings.AppSettings["MessagePath"].ToString());
//        if (fi.Exists)//如果文件存在
//        {
//            //FileStream fs = new FileStream(ParamConfig.ClientMessageFile,FileMode.Open);
//            XmlTextReader XmlRdr = new System.Xml.XmlTextReader(ConfigurationSettings.AppSettings["MessagePath"].ToString());
//            string tempstr = string.Empty;
//            while (!XmlRdr.EOF)
//            {
//                //tempstr = XmlRdr.Name;
//                if (XmlRdr.MoveToContent() == XmlNodeType.Element && XmlRdr.Name == "ROW")//
//                {
//                    tempstr = XmlRdr.GetAttribute("ID");

//                    if (tempstr == p_MessageID.ToString())
//                    {
//                        outstr = XmlRdr.GetAttribute("Message");
//                        XmlRdr.Read();
//                        //return outstr;
//                    }
//                    else
//                    {
//                        XmlRdr.Read();
//                    }
//                }
//                else
//                {
//                    XmlRdr.Read();
//                }
//            }
//            XmlRdr.Close();
//            //				fs.Close();
//            //				fs= null;
//        }
//        else
//        {
//            outstr = "File Not Found";
//        }
//        return outstr;
//    }

//}