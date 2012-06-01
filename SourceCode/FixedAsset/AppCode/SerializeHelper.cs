using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace FixedAsset.Web
{
    public class SerializeHelper
    {
        public SerializeHelper()
        { }

        #region 把对象序列化并返回相应的字节

        /// <summary>
        /// 把对象序列化并返回相应的字节
        /// </summary>
        /// <param name="obj">需要序列化的对象</param>
        /// <returns>byte[]</returns>
        private static byte[] Serialize(object obj)
        {
            if (obj == null)
                return null;

            try
            {
                MemoryStream ms = new MemoryStream();
                IFormatter formatter = new BinaryFormatter();
                formatter.Serialize(ms, obj);
                ms.Position = 0;
                byte[] buffer = new byte[ms.Length];
                int iRet = ms.Read(buffer, 0, buffer.Length);
                ms.Close();
                formatter = null;
                return buffer;
            }
            catch
            {
                throw;
            }
            //return null;
        }

        #endregion 把对象序列化并返回相应的字节

        #region 把字节反序列化成相应的对象

        /// <summary>
        /// 把字节反序列化成相应的对象
        /// </summary>
        /// <param name="bytes">字节流</param>
        /// <returns>object</returns>
        private static object Deserialize(byte[] bytes)
        {
            if (bytes == null && bytes.Length == 0)
                return null;

            try
            {
                MemoryStream ms = new MemoryStream(bytes);
                ms.Position = 0;
                IFormatter formatter = new BinaryFormatter();
                object obj = formatter.Deserialize(ms);
                ms.Close();
                formatter = null;
                return obj;
            }
            catch
            {
                throw;

            }
            return null;
        }

        #endregion 把字节反序列化成相应的对象

        #region 把对象序列化并返回相应的字符串

        /// <summary>
        /// 把对象序列化并返回相应的字符串
        /// </summary>
        /// <param name="obj">需要序列化的对象</param>
        /// <returns>string</returns>
        public static string SerializeObjectToString(object obj)
        {
            byte[] bytes = Serialize(obj);
            return Convert.ToBase64String(bytes);

            //if (obj == null)
            //{
            //    throw new ArgumentNullException("obj");
            //}

            //UTF8Encoding encoding = new UTF8Encoding(false);
            //XmlSerializer xmlSerializer = new XmlSerializer(obj.GetType());
            //MemoryStream memoryStream = new MemoryStream();
            //XmlTextWriter xmlTextWriter = new XmlTextWriter(memoryStream, encoding);
            //xmlTextWriter.Formatting = Formatting.None;
            //xmlSerializer.Serialize(xmlTextWriter, obj);

            //string content = encoding.GetString(memoryStream.ToArray());
            //return content;
        }

        #endregion 把对象序列化并返回相应的字符串

        #region 把字符串反序列化成相应的对象

        /// <summary>
        /// 把字符串反序列化成相应的对象
        /// </summary>
        /// <param name="text">字符串</param>
        /// <returns>object</returns>
        public static object DeserializeObjectByString(string xml, Type type)
        {
            return DeserializeObjectByString(xml);
            //if (xml == null)
            //{
            //    throw new ArgumentNullException("xml");
            //}
            //if (type == null)
            //{
            //    throw new ArgumentNullException("type");
            //}

            //object obj = null;
            //XmlSerializer xmlSerializer = new XmlSerializer(type);
            //StringReader stringReader = new StringReader(xml);
            //XmlReader xmlReader = new XmlTextReader(stringReader);
            ////EntityBase enBase = new EntityBase();
            ////enBase.ReadXml(xmlReader);
            ////obj = enBase;
            ////try
            //{
            //    obj = xmlSerializer.Deserialize(xmlReader);
            //}
            //catch (InvalidOperationException exception)
            //{
            //    throw new Exception(exception.Message);
            //}
            //finally
            //{
            //    xmlReader.Close();
            //}
            //return obj;
        }

        /// <summary>
        /// 把字符串反序列化成相应的对象
        /// </summary>
        /// <param name="text">字符串</param>
        /// <returns>object</returns>
        public static object DeserializeObjectByString(string text)
        {
            if (text.Trim() == string.Empty) return null;
            byte[] bytes = Convert.FromBase64String(text);
            return Deserialize(bytes);
        }


        #endregion 把字符串反序列化成相应的对象
    }
}
