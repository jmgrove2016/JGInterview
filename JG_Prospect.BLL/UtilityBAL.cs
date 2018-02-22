using JG_Prospect.Common;
using JG_Prospect.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace JG_Prospect.BLL
{
    public class UtilityBAL
    {

        private static UtilityBAL m_UtilityBAL = new UtilityBAL();

        private UtilityBAL()
        {

        }

        public static UtilityBAL Instance
        {
            get { return m_UtilityBAL; }
            set {; }
        }

        public static void AddException(string pageUrl, string loginID, string exMsg, string exTrace) //, int productTypeId, int estimateId)
        {
            UtilityDAL.Instance.AddException(pageUrl, loginID, exMsg, exTrace);
        }

        #region Content Settings

        public string GetContentSetting(string strKey)
        {
            return UtilityDAL.Instance.GetContentSetting(strKey);
        }

        public int InsertContentSetting(string strKey, string strValue)
        {
            return UtilityDAL.Instance.InsertContentSetting(strKey, strValue);
        }

        public int UpdateContentSetting(string strKey, string strValue)
        {
            return UtilityDAL.Instance.UpdateContentSetting(strKey, strValue);
        }

        public int DeleteContentSetting(string strKey)
        {
            return UtilityDAL.Instance.DeleteContentSetting(strKey);
        }

        #endregion
    }

    public static class EmailManager
    {
        #region Email
        public static bool SendEmail(string strEmailTemplate, string strToAddress, string strSubject, string strBody, List<Attachment> lstAttachments, List<AlternateView> lstAlternateView = null,
            string[] CC = null, string[] BCC = null)
        {
            //Thread email = new Thread(delegate ()
            //{
            SendEmailAsync(strEmailTemplate, strToAddress, strSubject, strBody, lstAttachments, lstAlternateView,
                CC, BCC);
            //});
            //email.IsBackground = true;
            //email.Start();
            return true;
        }

        private static bool SendEmailAsync(string strEmailTemplate, string strToAddress, string strSubject,
                string strBody, List<Attachment> lstAttachments, List<AlternateView> lstAlternateView = null,
                string[] CC = null, string[] BCC = null)
        {
            bool retValue = false;
            //if (!InstallUserBLL.Instance.CheckUnsubscribedEmail(strToAddress))
            //{
            try
            {
                /* Sample HTML Template
                 * *****************************************************************************
                 * Hi #lblFName#,
                 * <br/>
                 * <br/>
                 * You are requested to appear for an interview on #lblDate# - #lblTime#.
                 * <br/>
                 * <br/>
                 * Regards,
                 * <br/>
                */

                string defaultEmailFrom = ConfigurationManager.AppSettings["defaultEmailFrom"].ToString();
                string userName = ConfigurationManager.AppSettings["smtpUName"].ToString();
                string password = ConfigurationManager.AppSettings["smtpPwd"].ToString();

                //if (JGApplicationInfo.GetApplicationEnvironment() == "1" || JGApplicationInfo.GetApplicationEnvironment() == "2")
                //{
                //    strBody = String.Concat(strBody, "<br/><br/><h1>Email is intended for Email Address: " + strToAddress + "</h1><br/><br/>");
                //    strToAddress = "error@kerconsultancy.com";

                //}

                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress(defaultEmailFrom, "JGrove Construction");
                if (JGApplicationInfo.GetApplicationEnvironment() == "1" || JGApplicationInfo.GetApplicationEnvironment() == "2")
                {
                    strBody = String.Concat(strBody, "<br/><br/><h1>Email is intended for Email Address: " + string.Join(", ", strToAddress) + "</h1><br/><br/>");
                    Msg.To.Add("error@kerconsultancy.com");

                }
                else
                {
                    if (!InstallUserBLL.Instance.CheckUnsubscribedEmail(strToAddress))
                    {
                        Msg.To.Add(strToAddress);
                    }
                }
                #region Check for autologin url
                if (strBody.Contains("{AutoLoginCode}"))
                {
                    // Generate auto login code
                    string loginCode = InstallUserDAL.Instance.GenerateLoginCode(strToAddress).Object;
                    strBody = strBody.Replace("{AutoLoginCode}", loginCode);
                }
                #endregion
                // Msg.To.Add(strToAddress);
                // Msg.Bcc.Add(JGApplicationInfo.GetDefaultBCCEmail());
                Msg.Subject = strSubject;// "JG Prospect Notification";
                Msg.Body = strBody;
                Msg.IsBodyHtml = true;
                if (CC != null)
                    foreach (string email in CC)
                    {
                        Msg.CC.Add(email);
                    }
                if (BCC != null)
                    foreach (string email in BCC)
                    {
                        Msg.Bcc.Add(email);
                    }
                //ds = AdminBLL.Instance.GetEmailTemplate('');
                //// your remote SMTP server IP.
                if (lstAttachments != null)
                {
                    foreach (Attachment objAttachment in lstAttachments)
                    {
                        Msg.Attachments.Add(objAttachment);
                    }
                }

                if (lstAlternateView != null)
                {
                    foreach (AlternateView objAlternateView in lstAlternateView)
                    {
                        Msg.AlternateViews.Add(objAlternateView);
                    }
                }

                SmtpClient sc = new SmtpClient(
                                                ConfigurationManager.AppSettings["smtpHost"].ToString(),
                                                Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"].ToString())
                                              );
                NetworkCredential ntw = new NetworkCredential(userName, password);
                sc.UseDefaultCredentials = false;
                sc.Credentials = ntw;
                sc.DeliveryMethod = SmtpDeliveryMethod.Network;
                sc.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["enableSSL"].ToString()); // runtime encrypt the SMTP communications using SSL
                sc.Send(Msg);
                retValue = true;

                Msg = null;
                sc.Dispose();
                sc = null;
            }
            catch (Exception ex)
            {
                UpdateEmailStatistics(ex.Message);

                //if (JGApplicationInfo.IsSendEmailExceptionOn())
                //{
                //    CommonFunction.SendExceptionEmail(ex);
                //}
            }
            //}
            return retValue;
        }


        public static void SendEmailInternal(string strToAddress, string strSubject, string strBody)
        {
            //Thread email = new Thread(delegate ()
            //{
            SendEmailAsync(strToAddress, strSubject, strBody);
            //});
            //email.IsBackground = true;
            //email.Start();            
        }

        private static void SendEmailAsync(string strToAddress, string strSubject, string strBody)
        {
            try
            {
                string userName = ConfigurationManager.AppSettings["VendorCategoryUserName"].ToString();
                string password = ConfigurationManager.AppSettings["VendorCategoryPassword"].ToString();

                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress(userName, "JGrove Construction");
                foreach (string strEmailAddress in strToAddress.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    Msg.To.Add(strEmailAddress);
                }

                Msg.Subject = strSubject;// "JG Prospect Notification";
                Msg.Body = strBody;
                Msg.IsBodyHtml = true;

                SmtpClient sc = new SmtpClient(
                                                ConfigurationManager.AppSettings["smtpHost"].ToString(),
                                                Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"].ToString())
                                              );
                NetworkCredential ntw = new NetworkCredential(userName, password);
                sc.UseDefaultCredentials = false;
                sc.Credentials = ntw;
                sc.DeliveryMethod = SmtpDeliveryMethod.Network;
                sc.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["enableSSL"].ToString()); // runtime encrypt the SMTP communications using SSL
                try
                {
                    sc.Send(Msg);
                }
                catch
                {
                    // do not add throw clause here.
                    // it will lead to infinite loop.
                    // because application error event calls this method to send error details.
                    // here, we need to supress the exception.
                }

                Msg = null;
                sc.Dispose();
                sc = null;
            }
            catch
            {
                // do not add throw clause here.
                // it will lead to infinite loop.
                // because application error event calls this method to send error details.
                // here, we need to supress the exception.
            }
        }

        private static void UpdateEmailStatistics(string emailId)
        {
            string logDirectoryPath = HttpContext.Current.Server.MapPath(@"~\EmailStatistics");

            if (!Directory.Exists(logDirectoryPath))
            {
                Directory.CreateDirectory(logDirectoryPath);
            }

            string path = String.Concat(logDirectoryPath, "\\statistics.txt");

            if (!File.Exists(path))
            {

                using (TextWriter tw = File.CreateText(path))
                {
                    tw.WriteLine(emailId + "  - " + DateTime.Now);
                    tw.Close();
                }


            }
            else if (File.Exists(path))
            {
                using (var tw = new StreamWriter(path, true))
                {
                    tw.WriteLine(emailId + "  - " + DateTime.Now);
                    tw.Close();
                }
            }
        }

        //public static bool SendEmail(string strEmailTemplate, string strToAddress, string strSubject, string strBody, 
        //    List<Attachment> lstAttachments, List<AlternateView> lstAlternateView = null,
        //    string[] CC = null, string[] BCC = null)
        //{
        //    Thread email = new Thread(delegate ()
        //    {
        //        SendEmailAsync(strEmailTemplate, strToAddress, strSubject, strBody, lstAttachments, lstAlternateView,
        //            CC,BCC);
        //    });
        //    email.IsBackground = true;
        //    email.Start();
        //    return true;
        //}

        //private static bool SendEmailAsync(string strEmailTemplate, string strToAddress, string strSubject, string strBody,
        //    List<Attachment> lstAttachments, List<AlternateView> lstAlternateView = null,
        //    string[] CC = null, string[] BCC = null)
        //{
        //    bool retValue = false;
        //    if (!InstallUserBLL.Instance.CheckUnsubscribedEmail(strToAddress))
        //    {
        //        try
        //        {
        //            /* Sample HTML Template
        //             * *****************************************************************************
        //             * Hi #lblFName#,
        //             * <br/>
        //             * <br/>
        //             * You are requested to appear for an interview on #lblDate# - #lblTime#.
        //             * <br/>
        //             * <br/>
        //             * Regards,
        //             * <br/>
        //            */

        //            string defaultEmailFrom = ConfigurationManager.AppSettings["defaultEmailFrom"].ToString();
        //            string userName = ConfigurationManager.AppSettings["smtpUName"].ToString();
        //            string password = ConfigurationManager.AppSettings["smtpPwd"].ToString();

        //            if (JGApplicationInfo.GetApplicationEnvironment() == "1" || JGApplicationInfo.GetApplicationEnvironment() == "2")
        //            {
        //                strBody = String.Concat(strBody, "<br/><br/><h1>Email is intended for Email Address: " + strToAddress + "</h1><br/><br/>");
        //                strToAddress = "error@kerconsultancy.com";

        //            }

        //            MailMessage Msg = new MailMessage();
        //            Msg.From = new MailAddress(defaultEmailFrom, "JGrove Construction");
        //            Msg.To.Add(strToAddress);
        //           // Msg.Bcc.Add(JGApplicationInfo.GetDefaultBCCEmail());
        //            Msg.Subject = strSubject;// "JG Prospect Notification";
        //            Msg.Body = strBody.Replace("#UNSEMAIL#", strToAddress);
        //            Msg.IsBodyHtml = true;
        //            if (CC != null)
        //                foreach (string email in CC)
        //                {
        //                    Msg.CC.Add(email);
        //                }
        //            if (BCC != null)
        //                foreach (string email in BCC)
        //                {
        //                    Msg.Bcc.Add(email);
        //                }
        //            if (lstAttachments != null)
        //            {
        //                foreach (Attachment objAttachment in lstAttachments)
        //                {
        //                    Msg.Attachments.Add(objAttachment);
        //                }
        //            }

        //            if (lstAlternateView != null)
        //            {
        //                foreach (AlternateView objAlternateView in lstAlternateView)
        //                {
        //                    Msg.AlternateViews.Add(objAlternateView);
        //                }
        //            }

        //            SmtpClient sc = new SmtpClient(
        //                                            ConfigurationManager.AppSettings["smtpHost"].ToString(),
        //                                            Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"].ToString())
        //                                          );
        //            NetworkCredential ntw = new NetworkCredential(userName, password);
        //            sc.UseDefaultCredentials = false;
        //            sc.Credentials = ntw;
        //            sc.DeliveryMethod = SmtpDeliveryMethod.Network;
        //            sc.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["enableSSL"].ToString()); // runtime encrypt the SMTP communications using SSL
        //            sc.Send(Msg);
        //            retValue = true;

        //            Msg = null;
        //            sc.Dispose();
        //            sc = null;
        //        }
        //        catch (Exception ex)
        //        {
        //            UpdateEmailStatistics(ex.Message);
        //        }
        //    }
        //    return retValue;
        //}
        #endregion
    }
}
