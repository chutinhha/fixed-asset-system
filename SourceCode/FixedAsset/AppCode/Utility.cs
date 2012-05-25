//using System;
//using System.IO;
//using System.Web;
//using System.Web.UI;
//using AccorServices.SecurityModule.EncryptionComponent;

//namespace KFSQ.Server.Common.Enum
//{
//    public class Utility
//    {
//        public const string LeftPlaceHolder = "【";
//        public const string RightPlaceHolder = "】";

//        //热门话题图片
//        public const int HotTopicsThumbnailWidth = 260;
//        public const int HotTopicsThumbnailHeight = 180;

//        //热门话题图片
//        public const int SuperExperienceThumbnailWidth = 83;
//        public const int SuperExperienceThumbnailHeight = 63;
//        //推荐商品图片
//        public const int RecommendedProductThumbnailWidth = 70;
//        public const int RecommendedProductThumbnailHeight = 70;

//        public static string Domain
//        {
//            get
//            {
//                string domain = System.Configuration.ConfigurationManager.AppSettings["FileDomain"].ToString();
//                if (domain == "")
//                {

//                    return (HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://") +
//                                 HttpContext.Current.Request.Url.Host +
//                                 (HttpContext.Current.Request.Url.Port != 80 ? ":" + HttpContext.Current.Request.Url.Port.ToString() : string.Empty) + "/community";// 
//                }
//                else
//                {
//                    return domain + "/community";
//                }

//            }
//        }

//        public static string AppRootPath
//        {
//            get
//            {
//                return System.Configuration.ConfigurationManager.AppSettings["AppRootPath"].ToString();
//            }
//        }

//        public static int AreaBalance
//        {
//            get
//            {
//                if (System.Configuration.ConfigurationManager.AppSettings["AreaBalance"].ToString().Trim() == "")
//                {
//                    return 8;
//                }
//                else
//                {
//                    return Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["AreaBalance"].ToString().Trim());
//                }
//            }
//        }

//        public enum AdminType
//        {
//            HotTopic,
//            SuperExperience
//        }

//        public static string SaveThumbnailImage(byte[] fileContent, string extention, System.Drawing.Imaging.ImageFormat imageFormat)
//        {
//            using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(fileContent)))
//            {
//                // 生成缩略图
//                using (System.Drawing.Image thumbnailImage = image.GetThumbnailImage(Utility.HotTopicsThumbnailWidth, Utility.HotTopicsThumbnailHeight, null,
//                                        IntPtr.Zero))
//                {
//                    using (var stream = new MemoryStream())
//                    {
//                        thumbnailImage.Save(stream, imageFormat);
//                        string thumbnailName = @"upload\" + DateTime.Today.ToString("yyyyMM") + @"\" + DateTime.Today.Day.ToString() + @"\" + Guid.NewGuid() + extention;
//                        WriteAllBytes(HttpContext.Current.Server.MapPath("../"), thumbnailName, stream.GetBuffer());
//                        stream.Close();
//                        return thumbnailName;
//                    }
//                }
//            }
//        }

//        public static void WriteAllBytes(string path, string virtualPath, byte[] bytes)
//        {
//            var filePath = System.IO.Path.Combine(path, virtualPath);
//            var dirName = System.IO.Path.GetDirectoryName(filePath);
//            if (!Directory.Exists(dirName))
//            {
//                Directory.CreateDirectory(dirName);
//            }
//            File.WriteAllBytes(filePath, bytes);
//        }

//        public static bool SupportedImageFormat(string contentType)
//        {
//            return string.Compare(contentType, "image/pjpeg", true) == 0 ||
//                   string.Compare(contentType, "image/jpeg", true) == 0 ||
//                   string.Compare(contentType, "image/gif", true) == 0 ||
//                   string.Compare(contentType, "image/bmp", true) == 0 ||
//                   string.Compare(contentType, "image/x-png", true) == 0;
//        }
//        public static bool GetImageFormat(string contentType, out System.Drawing.Imaging.ImageFormat imageFormat)
//        {
//            switch (contentType)
//            {
//                case "image/pjpeg":
//                case "image/jpeg":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Jpeg;
//                    return true;
//                case "image/gif":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Gif;
//                    return true;
//                case "image/bmp":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Bmp;
//                    return true;
//                case "image/tiff":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Tiff;
//                    return true;
//                case "image/x-icon":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Icon;
//                    return true;
//                case "image/x-png":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Png;
//                    return true;
//                case "image/x-emf":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Emf;
//                    return true;
//                case "image/x-exif":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Exif;
//                    return true;
//                case "image/x-wmf":
//                    imageFormat = System.Drawing.Imaging.ImageFormat.Wmf;
//                    return true;
//            }
//            imageFormat = System.Drawing.Imaging.ImageFormat.MemoryBmp;
//            return false;
//        }

//        public static byte[] ReadFileBytes(HttpPostedFile file)
//        {
//            if (file == null)
//            {
//                return null;
//            }
//            Stream fileContent = file.InputStream;
//            if ((fileContent == null) || (fileContent == Stream.Null))
//            {
//                return null;
//            }
//            long length = fileContent.Length;
//            var reader = new BinaryReader(fileContent);
//            byte[] buffer;
//            if (length > Int32.MaxValue)
//            {
//                throw new HttpException("The file stream is longer than Int32.MaxValue.  Upload file supports only streams less than or equal to Int32.MaxValue.");
//            }
//            if (!fileContent.CanSeek)
//            {
//                throw new HttpException("The file stream does not support seeking.");
//            }
//            int position = (int)fileContent.Position;
//            int count = (int)length;
//            try
//            {
//                fileContent.Seek(0L, SeekOrigin.Begin);
//                buffer = reader.ReadBytes(count);
//            }
//            finally
//            {
//                fileContent.Seek((long)position, SeekOrigin.Begin);
//            }
//            if (buffer.Length != count)
//            {
//                throw new HttpException("The byte stream that represents the uploaded file appears to be incomplete.  Try the upload again.");
//            }
//            return buffer;
//        }

//        public static string GetCdnResolveUrl()
//        {
//            return GetCdnResolveUrl(string.Empty);
//        }

//        public static string GetCdnResolveUrl(string path)
//        {
//            string domain = System.Configuration.ConfigurationManager.AppSettings["FileDomain"].ToString().Trim();
//            if (path.ToLower().StartsWith("http"))
//            {
//                return path;
//            }
            
//            path = path.Replace("../","").Replace("./","");

//            string url = "";

//            if (domain == "")
//            {
//                url = (HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://") +
//                             HttpContext.Current.Request.Url.Host +
//                             (HttpContext.Current.Request.Url.Port != 80 ? ":" + HttpContext.Current.Request.Url.Port.ToString() : string.Empty) +
//                             HttpContext.Current.Response.ApplyAppPathModifier(string.Format("~{0}", (path.StartsWith(@"\") || path.StartsWith(@"/")) ? path : "/" + path));
//            }
//            else
//            {
//                url = domain + HttpContext.Current.Response.ApplyAppPathModifier(string.Format("~{0}", (path.StartsWith(@"\") || path.StartsWith(@"/")) ? path : "/" + path));
//            }
//            return url;
//        }

//        public static string GetCurrentUrl()
//        {
//            return GetCurrentUrl(string.Empty);
//        }

//        private static System.Web.UI.Page page;
//        public static string GetCurrentUrl(string path)
//        {
//            //if (path.ToLower().StartsWith("http"))
//            //{
//            //    return path;
//            //}

//            //path = path.Replace("../", "").Replace("./", "");

//            //string url = "";

//            //url = (HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://") +
//            //                 HttpContext.Current.Request.Url.Host +
//            //                 (HttpContext.Current.Request.Url.Port != 80 ? ":" + HttpContext.Current.Request.Url.Port.ToString() : string.Empty) +
//            //                 HttpContext.Current.Response.ApplyAppPathModifier(string.Format("~{0}", (path.StartsWith(@"\") || path.StartsWith(@"/")) ? path : "/" + path));
//            string url;
//            if (page != null)
//            {
//                url = page.ResolveUrl("~");
//            }
//            else
//            {
//                page = new System.Web.UI.Page();
//                url = page.ResolveUrl("~");
//            }
//            return url;
//        }

//        public static string BuildMainNavigation(Page page ,string categoryname,int categoryId)
//        {
//            return string.Format("<a onclick=\"javascript:urchinTracker('/Community/Navigation/main_category');\" href='{0}?categoryId={1}'>{2}</a>", page.ResolveUrl("~/MainCategoryHomePage.aspx"), categoryId, categoryname);
//        }
//        public static string BuildSubNavigation(Page page, string categoryname, int category, int subCategory)
//        {
//            return string.Format("<a onclick=\"javascript:urchinTracker('/Community/Navigation/sub_category');\"  href='{0}SubCategoryHomePage.aspx?categoryId={1}&subCategoryId={3}'>{2}</a>", page.ResolveUrl("~"), category, categoryname, subCategory);
//        }

//        public static string Encrypt(string strContent)
//        {
//            return Encryption.Encrypt(strContent);
//        }

//        public static string Decrypt(string strContent)
//        {
//            if (string.IsNullOrEmpty(strContent))
//                return string.Empty;
//            return Encryption.Decrypt(strContent);
//        }
//    }
//}
