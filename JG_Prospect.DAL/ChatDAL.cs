using JG_Prospect.Common.modal;
using JG_Prospect.DAL.Database;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JG_Prospect.Common;

namespace JG_Prospect.DAL
{
    public class ChatDAL
    {
        public static ChatDAL m_ChatDAL = new ChatDAL();

        public static ChatDAL Instance
        {
            get { return m_ChatDAL; }
            private set {; }
        }
        public DataSet returndata;

        public void AddChatUser(int UserID, string ConnectionId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("AddChatUser");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@UserId", DbType.Int32, UserID);
                    database.AddInParameter(command, "@ConnectionId", DbType.String, ConnectionId);
                    database.ExecuteNonQuery(command);
                }
            }
            catch (Exception ex)
            { Console.Write(ex.Message); }
        }

        public ActionOutput<ChatUser> GetChatUsers()
        {
            try
            {
                List<ChatUser> users = new List<ChatUser>();
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatUsers");

                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow item in returndata.Tables[0].Rows)
                        {
                            int userId = Convert.ToInt32(item["UserId"].ToString());
                            string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                            ChatUser user = new ChatUser
                            {
                                UserId = userId,
                                //ConnectionId = item["ConnectionId"].ToString(),
                                GroupOrUsername = item["FirstName"].ToString() + " " + item["LastName"].ToString(),
                                //Email = item["Email"].ToString(),
                                ProfilePic = pic,
                                UserInstallId = item["UserInstallId"].ToString(),
                                OnlineAt = Convert.ToDateTime(item["OnlineAt"].ToString()),
                                OnlineAtFormatted = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST().ToString()
                            };
                            foreach (DataRow connectionRow in returndata.Tables[0].Rows)
                            {
                                // Same user can open chat in multiple browsers/tabs at the same time.
                                // Adding all ConnectionIds with chat user
                                if (Convert.ToInt32(connectionRow["UserId"].ToString()) == userId)
                                {
                                    user.ConnectionIds.Add(connectionRow["ConnectionId"].ToString());
                                }
                            }
                            if (!users.Select(m => m.UserId).ToList().Contains(user.UserId))
                                users.Add(user);
                        }
                    }
                    else
                    {
                        // User if Offline
                        var usrs = InstallUserDAL.Instance.GetUsersByIds();
                        if (usrs != null && usrs.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow usr in usrs.Tables[0].Rows)
                            {
                                string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(usr["Picture"].ToString()) ? "default.jpg"
                                               : usr["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                                users.Add(new ChatUser
                                {
                                    UserId = Convert.ToInt32(usr["Id"].ToString()),
                                    GroupOrUsername = usr["FristName"].ToString() + " " + usr["LastName"].ToString(),
                                    //Email = usr["Email"].ToString(),
                                    ProfilePic = pic,
                                    UserInstallId = usr["UserInstallId"].ToString(),
                                    OnlineAt = null,
                                    OnlineAtFormatted = null
                                });
                            }
                        }
                    }
                    return new ActionOutput<ChatUser>
                    {
                        Results = users,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatUser>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Error
                };
            }
        }

        public void ChatLogger(string chatGroupId, string message, int chatSourceId, int UserId, string IP)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    DbCommand command = database.GetStoredProcCommand("SaveChatLog");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ChatGroupId", DbType.String, chatGroupId);
                    database.AddInParameter(command, "@Message", DbType.String, message);
                    database.AddInParameter(command, "@ChatSourceId", DbType.String, chatSourceId);
                    database.AddInParameter(command, "@UserId", DbType.Int32, UserId);
                    database.AddInParameter(command, "@IP", DbType.String, IP);
                    database.ExecuteNonQuery(command);
                }
            }
            catch (Exception ex)
            { Console.Write(ex.Message); }
        }

        public ActionOutput<ChatUser> GetChatUsers(List<int> userIds)
        {
            try
            {
                List<ChatUser> users = new List<ChatUser>();
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatUsers");
                    database.AddInParameter(command, "@UserIds", DbType.String, string.Join(",", userIds));

                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow item in returndata.Tables[0].Rows)
                        {
                            int userId = Convert.ToInt32(item["UserId"].ToString());
                            string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                            ChatUser user = new ChatUser
                            {
                                UserId = userId,
                                GroupOrUsername = item["FirstName"].ToString() + " " + item["LastName"].ToString(),
                                //Email = item["Email"].ToString(),
                                ProfilePic = pic,
                                UserInstallId = item["UserInstallId"].ToString(),
                                OnlineAt = Convert.ToDateTime(item["OnlineAt"].ToString()),
                                OnlineAtFormatted = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST().ToString()
                            };
                            if (!string.IsNullOrEmpty(item["ConnectionId"].ToString()))
                                user.ConnectionIds.AddRange(item["ConnectionId"].ToString().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList());
                            //foreach (DataRow connectionRow in returndata.Tables[0].Rows)
                            //{
                            //    // Same user can open chat in multiple browsers/tabs at the same time.
                            //    // Adding all ConnectionIds with chat user
                            //    if (Convert.ToInt32(connectionRow["UserId"].ToString()) == userId)
                            //    {
                            //        user.ConnectionIds.Add(connectionRow["ConnectionId"].ToString());
                            //    }
                            //}
                            users.Add(user);
                        }
                    }
                    else
                    {
                        // User if Offline
                        var usrs = InstallUserDAL.Instance.GetUsersByIds(userIds);
                        if (usrs != null && usrs.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow usr in usrs.Tables[0].Rows)
                            {
                                string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(usr["Picture"].ToString()) ? "default.jpg"
                                               : usr["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                                users.Add(new ChatUser
                                {
                                    UserId = Convert.ToInt32(usr["Id"].ToString()),
                                    GroupOrUsername = usr["FristName"].ToString() + " " + usr["LastName"].ToString(),
                                    //Email = usr["Email"].ToString(),
                                    ProfilePic = pic,
                                    UserInstallId = usr["UserInstallId"].ToString(),
                                    OnlineAt = null,
                                    OnlineAtFormatted = null
                                });
                            }
                        }
                    }
                    return new ActionOutput<ChatUser>
                    {
                        Results = users,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatUser>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Error
                };
            }
        }

        public ActionOutput<ChatUser> GetChatUser(int UserId)
        {
            try
            {
                ChatUser user = null;
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatUser");
                    database.AddInParameter(command, "@UserId", DbType.Int32, UserId);
                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        DataRow item = returndata.Tables[0].Rows[0];
                        string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                        user = new ChatUser
                        {
                            UserId = Convert.ToInt32(item["UserId"].ToString()),
                            //ConnectionId = item["ConnectionId"].ToString(),
                            GroupOrUsername = item["FirstName"].ToString() + " " + item["LastName"].ToString(),
                            //Email = item["Email"].ToString(),
                            ProfilePic = pic,
                            UserInstallId = item["UserInstallId"].ToString(),
                            OnlineAt = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST(),
                            OnlineAtFormatted = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST().ToString()
                        };
                        // Same user can open chat in multiple browsers/tabs at the same time.
                        // Adding all ConnectionIds with chat user
                        foreach (DataRow connectionRow in returndata.Tables[0].Rows)
                        {
                            user.ConnectionIds.Add(connectionRow["ConnectionId"].ToString());
                        }
                    }
                    else
                    {
                        // User if Offline
                        var usr = InstallUserDAL.Instance.getuserdetails(UserId).Tables[0].Rows[0];
                        string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(usr["Picture"].ToString()) ? "default.jpg"
                                                : usr["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                        user = new ChatUser
                        {
                            UserId = UserId,
                            GroupOrUsername = usr["FristName"].ToString() + " " + usr["LastName"].ToString(),
                            //Email = usr["Email"].ToString(),
                            ProfilePic = pic,
                            UserInstallId = usr["UserInstallId"].ToString(),
                            OnlineAt = null,
                            OnlineAtFormatted = null
                        };
                    }
                    return new ActionOutput<ChatUser>
                    {
                        Object = user,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatUser>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Successfull
                };
            }
        }

        public ActionOutput<ChatUser> GetChatUser(string ConnectionId)
        {
            try
            {
                ChatUser user = null;
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatUserByConnectionId");
                    database.AddInParameter(command, "@ConnectionId", DbType.String, ConnectionId);
                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        DataRow item = returndata.Tables[0].Rows[0];
                        string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                        user = new ChatUser
                        {
                            UserId = Convert.ToInt32(item["UserId"].ToString()),
                            //ConnectionId = item["ConnectionId"].ToString(),
                            GroupOrUsername = item["FirstName"].ToString() + " " + item["LastName"].ToString(),
                            //Email = item["Email"].ToString(),
                            ProfilePic = pic,
                            UserInstallId = item["UserInstallId"].ToString(),
                            OnlineAt = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST(),
                            OnlineAtFormatted = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST().ToString()
                        };
                        // Same user can open chat in multiple browsers/tabs at the same time.
                        // Adding all ConnectionIds with chat user
                        foreach (DataRow connectionRow in returndata.Tables[0].Rows)
                        {
                            user.ConnectionIds.Add(connectionRow["ConnectionId"].ToString());
                        }
                    }
                    else
                    {
                        // User if Offline
                        user = new ChatUser
                        {
                            OnlineAt = null,
                            OnlineAtFormatted = null
                        };
                    }
                    return new ActionOutput<ChatUser>
                    {
                        Object = user,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatUser>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Successfull
                };
            }
        }

        public ActionOutput<ActiveUser> GetOnlineUsers(int LoggedInUserId)
        {
            try
            {
                List<ActiveUser> users = new List<ActiveUser>();
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetOnlineUsers");
                    database.AddInParameter(command, "@LoggedInUserId", DbType.Int32, LoggedInUserId);
                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow item in returndata.Tables[0].Rows)
                        {
                            // DataRow item = returndata.Tables[0].Rows[0];
                            string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                    : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                            users.Add(new ActiveUser
                            {
                                UserId = string.IsNullOrEmpty(item["UserId"].ToString()) ? null : (int?)Convert.ToInt32(item["UserId"].ToString()),
                                //ConnectionId = item["ConnectionId"].ToString(),
                                GroupOrUsername = item["GroupOrUsername"].ToString(),
                                //Email = item["Email"].ToString(),
                                ProfilePic = pic,
                                UserInstallId = item["UserInstallId"].ToString(),
                                OnlineAt = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST(),
                                OnlineAtFormatted = Convert.ToDateTime(item["OnlineAt"].ToString()).ToEST().ToString(),
                                LastMessage = item["LastMessage"].ToString(),
                                LastMessageAt = !string.IsNullOrEmpty(item["MessageAt"].ToString()) ?
                                                    (DateTime?)Convert.ToDateTime(item["MessageAt"].ToString()).ToEST() : null,
                                LastMessageAtFormatted = !string.IsNullOrEmpty(item["MessageAt"].ToString()) ?
                                                    Convert.ToDateTime(item["MessageAt"].ToString()).ToEST().ToString() : null,
                                IsRead = Convert.ToBoolean(item["IsRead"].ToString()),
                                ChatGroupId = item["ChatGroupId"].ToString(),
                                ReceiverIds = item["ReceiverIds"].ToString(),
                            });
                        }
                    }
                    return new ActionOutput<ActiveUser>
                    {
                        Results = users,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ActiveUser>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Error
                };
            }
        }

        public ActionOutput SetChatMessageRead(int ChatMessageId, int ReceiverId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("SetChatMessageRead");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ChatMessageId", DbType.Int32, ChatMessageId);
                    database.AddInParameter(command, "@ReceiverId", DbType.Int32, ReceiverId);
                    database.ExecuteScalar(command);
                    return new ActionOutput { Status = ActionStatus.Successfull };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput { Status = ActionStatus.Error, Message = ex.Message };
            }
        }

        public ActionOutput SetChatMessageRead(string ChatGroupId, int ReceiverId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("SetChatMessageReadByChatGroupId");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ChatGroupId", DbType.String, ChatGroupId);
                    database.AddInParameter(command, "@ReceiverId", DbType.Int32, ReceiverId);
                    database.ExecuteScalar(command);
                    return new ActionOutput { Status = ActionStatus.Successfull };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput { Status = ActionStatus.Error, Message = ex.Message };
            }
        }

        public int GetChatUserCount()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatUserCount");

                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);
                    return Convert.ToInt32(returndata.Tables[0].Rows[0]["TotalCount"].ToString());
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public void DeleteChatUser(string ConnectionId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("DeleteChatUser");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ConnectionId", DbType.String, ConnectionId);
                    database.ExecuteScalar(command);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void SaveChatMessage(ChatMessage message, string ChatGroupId, string ReceiverIds, int SenderUserId)
        {
            try
            {
                // sort ReceiverIds into Asc
                List<int> ids = ReceiverIds.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                                           .Select(m => Convert.ToInt32(m))
                                           .Distinct()
                                           .ToList();

                // Remove SenderId From ReceiverIds
                ids.Remove(SenderUserId);

                // Create CSV values from ids
                ReceiverIds = string.Join(",", ids.OrderBy(m => m).ToList());

                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("SaveChatMessage");
                    command.CommandType = CommandType.StoredProcedure;
                    database.AddInParameter(command, "@ChatSourceId", DbType.Int32, message.ChatSourceId);
                    database.AddInParameter(command, "@ChatGroupId", DbType.String, ChatGroupId);
                    database.AddInParameter(command, "@SenderId", DbType.Int32, message.UserId);
                    database.AddInParameter(command, "@TextMessage", DbType.String, message.Message);
                    database.AddInParameter(command, "@ChatFileId", DbType.String, null);
                    database.AddInParameter(command, "@ReceiverIds", DbType.String, ReceiverIds);
                    database.ExecuteScalar(command);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public ActionOutput<ChatMessage> GetChatMessages(string ChatGroupId, string receiverIds)
        {
            try
            {
                List<ChatMessage> messages = new List<ChatMessage>();
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatMessages");
                    database.AddInParameter(command, "@ChatGroupId", DbType.String, ChatGroupId);
                    database.AddInParameter(command, "@ReceiverIds", DbType.String, receiverIds);
                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow item in returndata.Tables[0].Rows)
                        {
                            // DataRow item = returndata.Tables[0].Rows[0];
                            string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                    : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                            messages.Add(new ChatMessage
                            {
                                ChatGroupId = item["ChatGroupId"].ToString(),
                                UserId = Convert.ToInt32(item["SenderId"].ToString()),
                                Message = item["TextMessage"].ToString(),
                                ChatSourceId = Convert.ToInt32(item["ChatSourceId"].ToString()),
                                UserProfilePic = pic,
                                UserInstallId = item["UserInstallId"].ToString(),
                                UserFullname = item["Fullname"].ToString(),
                                MessageAt = Convert.ToDateTime(item["CreatedOn"].ToString()),
                                MessageAtFormatted = Convert.ToDateTime(item["CreatedOn"].ToString()).ToString()
                            });
                        }
                    }
                    return new ActionOutput<ChatMessage>
                    {
                        Results = messages,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatMessage>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Error
                };
            }
        }

        public ActionOutput<ChatMessage> GetChatMessages(int userId, int receiverId)
        {
            try
            {
                List<ChatMessage> messages = new List<ChatMessage>();
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("GetChatMessagesByUsers");
                    database.AddInParameter(command, "@UserId", DbType.Int32, userId);
                    database.AddInParameter(command, "@ReceiverId", DbType.Int32, receiverId);

                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    if (returndata != null && returndata.Tables[0] != null && returndata.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow item in returndata.Tables[0].Rows)
                        {
                            // DataRow item = returndata.Tables[0].Rows[0];
                            string pic = "Employee/ProfilePictures/" + (string.IsNullOrEmpty(item["Picture"].ToString()) ? "default.jpg"
                                                    : item["Picture"].ToString().Replace("~/UploadeProfile/", ""));
                            messages.Add(new ChatMessage
                            {
                                ChatGroupId = item["ChatGroupId"].ToString(),
                                UserId = Convert.ToInt32(item["SenderId"].ToString()),
                                Message = item["TextMessage"].ToString(),
                                ChatSourceId = Convert.ToInt32(item["ChatSourceId"].ToString()),
                                UserProfilePic = pic,
                                UserInstallId = item["UserInstallId"].ToString(),
                                UserFullname = item["Fullname"].ToString(),
                                MessageAt = Convert.ToDateTime(item["CreatedOn"].ToString()),
                                MessageAtFormatted = Convert.ToDateTime(item["CreatedOn"].ToString()).ToString()
                            });
                        }
                    }
                    return new ActionOutput<ChatMessage>
                    {
                        Results = messages,
                        Status = ActionStatus.Successfull
                    };
                }
            }
            catch (Exception ex)
            {
                return new ActionOutput<ChatMessage>
                {
                    Message = ex.Message,
                    Status = ActionStatus.Error
                };
            }
        }
    }
}
