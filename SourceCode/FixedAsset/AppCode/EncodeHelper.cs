using System;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web;

/// <summary>
///EncodeHelper 的摘要说明
///Author:Petter.shen 
///Modify Date:2011-12-29
/// </summary>

public class EncodeHelper
{
    /// <summary>
    /// MD5加密
    /// </summary>
    /// <param name="strOriginal"></param>
    /// <returns></returns>
    public static string MD5Encode(string strOriginal)
    {
        byte[] byteInput = UTF8Encoding.UTF8.GetBytes(strOriginal);
        MD5CryptoServiceProvider objMD5 = new MD5CryptoServiceProvider();
        byte[] byteOutput = objMD5.ComputeHash(byteInput);
        return BitConverter.ToString(byteOutput).Replace("-", "");
    }
}
