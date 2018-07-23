using JG_Prospect.Common;
using JG_Prospect.Common.modal;
using JG_Prospect.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JG_Prospect.BLL
{ 
    public class ChatBLL
    {
        private static ChatBLL m_ChatBLL = new ChatBLL();

        public static ChatBLL Instance
        {
            get { return m_ChatBLL; }
            private set {; }
        }

        public void AddChatUser(int UserID, string ConnectionId)
        {
            ChatDAL.Instance.AddChatUser(UserID, ConnectionId);
        }

        public ActionOutput<ChatUser> GetChatUsers()
        {
            return ChatDAL.Instance.GetChatUsers();
        }

        public ActionOutput<ChatUser> GetChatUsers(List<int> userIds)
        {
            return ChatDAL.Instance.GetChatUsers(userIds);
        }

        public ActionOutput<ChatUser> GetChatUser(int UserId)
        {
            return ChatDAL.Instance.GetChatUser(UserId);
        }

        public ActionOutput<ChatUser> GetChatUser(string ConnectionId)
        {
            return ChatDAL.Instance.GetChatUser(ConnectionId);
        }

        public ActionOutput<ActiveUser> GetOnlineUsers(int LoggedInUserId)
        {
            return ChatDAL.Instance.GetOnlineUsers(LoggedInUserId);
        }

        public ActionOutput<ActiveUser> GetAllChatHistory()
        {
            return ChatDAL.Instance.GetAllChatHistory();
        }

        public ActionOutput<ChatMessage> GetChatMessages(int LoggedInUserId, string ChatGroupId, string receiverIds, int chatSourceId, int userChatGroupId)
        {
            return ChatDAL.Instance.GetChatMessages(LoggedInUserId,ChatGroupId, receiverIds, chatSourceId, userChatGroupId);
        }

        public ActionOutput<ChatMessage> GetTaskChatMessages(int loggedInUserId, int chatSourceId, int TaskId, int TaskMultilevelListId = 0)
        {
            return ChatDAL.Instance.GetTaskChatMessages(loggedInUserId, chatSourceId, TaskId, TaskMultilevelListId);
        }

        public ActionOutput<int> GetTaskUsers(int TaskId)
        {
            return ChatDAL.Instance.GetTaskUsers(TaskId);
        }

        public ChatFile GetChatFile(int id)
        {
            return ChatDAL.Instance.GetChatFile(id);
        }

        public ActionOutput<bool> SetChatMessageRead(string ChatGroupId, int ReceiverId, int UserChatGroupId)
        {
            return ChatDAL.Instance.SetChatMessageRead(ChatGroupId, ReceiverId, UserChatGroupId);
        }

        public int GetChatUserCount()
        {
            return ChatDAL.Instance.GetChatUserCount();
        }

        public int SaveChatFile(string imageName, string newImageName, string contentType)
        {
            return ChatDAL.Instance.SaveChatFile(imageName, newImageName, contentType);
        }

        public void DeleteChatUser(string ConnectionId)
        {
            ChatDAL.Instance.DeleteChatUser(ConnectionId);
        }

        public void SaveChatMessage(ChatMessage message, string ChatGroupId, string ReceiverIds, int SenderUserId)
        {
            ChatDAL.Instance.SaveChatMessage(message, ChatGroupId, ReceiverIds, SenderUserId);
        }

        public int CreateTaskChatGroup(int taskId, int? taskMultilevelListId)
        {
            return ChatDAL.Instance.CreateTaskChatGroup(taskId, taskMultilevelListId);
        }

        public void ChatLogger(string chatGroupId, string message, int chatSourceId, int UserId, string IP)
        {
            ChatDAL.Instance.ChatLogger(chatGroupId, message, chatSourceId, UserId, IP);
        }

        public void SendOfflineChatEmail(int LoginUserID, int UserID, string LoginUserInstallID, 
                                        string Message, int ChatSource, string BaseUrl, string chatGroupId)
        {
            // Get Html Template
            string messageUrl = string.Empty, toEmail = string.Empty, body = string.Empty;
            //string BaseUrl = System.Web.HttpContext.Current.Request.Url.Scheme + "://" + System.Web.HttpContext.Current.Request.Url.Authority + System.Web.HttpContext.Current.Request.ApplicationPath.TrimEnd('/') + "/";
            HTMLTemplatesMaster html = HTMLTemplateBLL.Instance.GetHTMLTemplateMasterById(HTMLTemplates.HR_EditSales_TouchpointLog_Email);
            // sender details
            var sender = InstallUserBLL.Instance.getuserdetails(LoginUserID).Tables[0].Rows[0];
            string pic = string.IsNullOrEmpty(sender["Picture"].ToString()) ? "default.jpg"
                                : sender["Picture"].ToString().Replace("~/UploadeProfile/", "");
            pic = BaseUrl + "Employee/ProfilePictures/" + pic;
            html.Body = html.Body.Replace("{ImageUrl}", pic);
            html.Body = html.Body.Replace("{Name}", sender["FristName"].ToString() + " " + sender["LastName"].ToString());
            html.Body = html.Body.Replace("{Designation}", sender["Designation"].ToString());
            html.Body = html.Body.Replace("{UserInstallID}", sender["UserInstallID"].ToString());
            html.Body = html.Body.Replace("{ProfileUrl}", BaseUrl + "Sr_App/ViewSalesUser.aspx?id=" + sender["Id"].ToString());
            html.Body = html.Body.Replace("{MessageContent}", Message.Replace("Note :", "").Trim());
            
            // Generate auto login code
            string loginCode = InstallUserDAL.Instance.GenerateLoginCode(UserID).Object;
            var receiver = InstallUserBLL.Instance.getuserdetails(UserID).Tables[0].Rows[0];
            toEmail = receiver["Email"].ToString();
            messageUrl = BaseUrl + "Sr_App/TouchPointLog.aspx?TUID=" + UserID + "&CGID=" + chatGroupId +
                                    "&auth=" + loginCode + "&RcvrID=" + LoginUserID + "&Src=" + ChatSource;


            body = (html.Header + html.Body + html.Footer).Replace("{MessageUrl}", messageUrl);
            EmailManager.SendEmail("New Message", toEmail, html.Subject, body, null);
        }


        public ActionOutput<ChatMessage> GetChatMessages(int userId, int receiverId, int chatSourceId)
        {
            return ChatDAL.Instance.GetChatMessages(userId, receiverId, chatSourceId);
        }

        public ActionOutput<ChatUnReadCount> GetChatUnReadCount(int LoggedInUserId)
        {
            return ChatDAL.Instance.GetChatUnReadCount(LoggedInUserId);
        }

        public int AddMemberToChatGroup(string chatGroupId, int userId, int loggedInUserId, string existingUsers, int? userChatGroupId)
        {
            return ChatDAL.Instance.AddMemberToChatGroup(chatGroupId, userId, loggedInUserId, existingUsers, userChatGroupId);
        }
        
        public int? GetUserChatGroupId(string chatGroupId)
        {
            return ChatDAL.Instance.GetUserChatGroupId(chatGroupId);
        }

        public List<ChatUser> GetChatGroupMembers(int loggedInUserId,int? userChatGroupId)
        {
            return ChatDAL.Instance.GetChatGroupMembers(loggedInUserId, userChatGroupId);
        }

        public List<ChatUser> GetChatGroupMembers(int userChatGroupId)
        {
            return ChatDAL.Instance.GetChatGroupMembers(userChatGroupId);
        }

        public void RemoveChatGroupMember(int userChatGroupId, int userId)
        {
            ChatDAL.Instance.RemoveChatGroupMember(userChatGroupId, userId);
        }

        public DateTime SaveLastChatSeen(int senderUserId, int userChatGroupId, int receiverId)
        {
            return ChatDAL.Instance.SaveLastChatSeen(senderUserId, userChatGroupId, receiverId);
        }

        public DateTime? GetLastChatSeen(int senderUserId, int userChatGroupId, int receiverId)
        {
            return ChatDAL.Instance.GetLastChatSeen(senderUserId, userChatGroupId, receiverId);
        }

        public DataSet GetSalesUsersStaticticsAndData(string strSearchTerm, string strStatus, Int32 intDesignationId, Int32 intSourceId, DateTime? fromdate, DateTime? todate, int userid, int intPageIndex, int intPageSize, string strSortExpression)
        {
            return ChatDAL.Instance.GetSalesUsersStaticticsAndData(strSearchTerm, strStatus, intDesignationId, intSourceId, fromdate, todate, userid, intPageIndex, intPageSize, strSortExpression);
        }
    }
}
