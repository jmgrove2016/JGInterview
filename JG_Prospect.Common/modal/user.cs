using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JG_Prospect.Common.modal
{
    public class user
    {
        public string username;
        public string loginid;
        public string email;
        public string designation;
        public string password;
        public string usertype;
        public string status;
        public string phone;
        public string phonetype;
        public string address;
        public string state;
        public string city;
        public object zip;
        public string picture;
        public string attachements;
        public string fristname;
        public string lastname;
        public int id;
        public string businessname;
        public string dob;
        public string ssn;
        public string ssn1;
        public string ssn2;
        public string signature;
        public string tin;
        public string citizenship;
        public string ein1;
        public string ein2;
        public string a;
        public string b;
        public string c;
        public string d;
        public string e;
        public string f;
        public string g;
        public string h;
        public string i;
        public string j;
        public string k;
        public string Field1;
        public string Field2;
        public string Field3;
        public string Field4;
        public string Field5;
        public string Field6;
        public string Field7;
        public string Field8;
        public string Field9;
        public string Field10;
        public string Field11;
        public string Field12;
        public string maritalstatus;
        public int PrimeryTradeId;
        public int SecondoryTradeId;
        public string Notes;
        public string Source;
        public int SourceId;
        public string Reason;
        public string GeneralLiability;
        public string PqLicense;
        public string WorkersComp;
        public string Attachment;
        public string HireDate;
        public string TerminitionDate;
        public string WorkersCompCode;
        public string NextReviewDate;
        public string EmpType;
        public string LastReviewDate;
        public string PayRates;
        public string ExtraEarning;
        public string ExtraEarningAmt;
        public string ExtraIncomeType;
        public string PayMethod;
        public string Deduction;
        public string DeductionType;
        public string AbaAccountNo;
        public string AccountNo;
        public string AccountType;
        public string InstallId;
        public string PTradeOthers;
        public string STradeOthers;
        public string DeductionReason;
        public string str_SuiteAptRoom;
        public int FullTimePosition;
        public string ContractorsBuilderOwner;
        public string MajorTools;
        public bool? DrugTest = null;
        public bool? ValidLicense = null;
        public bool? TruckTools = null;
        public bool? PrevApply = null;
        public bool? LicenseStatus = null;
        public bool? CrimeStatus = null;
        public string StartDate;
        public string SalaryReq;
        public string Avialability;
        public string ResumePath;
        public bool? skillassessmentstatus = null;
        public string assessmentPath;
        public string WarrentyPolicy;
        public string CirtificationTraining;
        public double businessYrs;
        public double underPresentComp;
        public string websiteaddress;
        public string PersonName;
        public string PersonType;
        public string CompanyPrinciple;
        public string UserType;
        public string Email2;
        public string Phone2;
        public string Phone2Type;
        public string CompanyName;
        public string SourceUser;
        public string DateSourced;
        public string InstallerType;
        public string BusinessType;
        public string CEO;
        public string LegalOfficer;
        public string President;
        public string Owner;
        public string AllParteners;
        public string MailingAddress;
        public bool? Warrantyguarantee = null;
        public int WarrantyYrs;
        public bool? MinorityBussiness = null;
        public bool? WomensEnterprise = null;
        public string InterviewTime;
        public string ActivationDate;
        public string UserActivated;
        public string LIBC;
        public int Flag;

        public bool? CruntEmployement = null;
        public string CurrentEmoPlace;
        public string LeavingReason;
        public bool? CompLit = null;
        public bool? FELONY = null;
        public string shortterm;
        public string LongTerm;
        public string BestCandidate;
        public string TalentVenue;
        public string Boardsites;
        public string NonTraditional;
        public string ConSalTraning;
        public string BestTradeOne;
        public string BestTradeTwo;
        public string BestTradeThree;

        public string aOne;
        public string aOneTwo;
        public string bOne;
        public string cOne;
        public string aTwo;
        public string aTwoTwo;
        public string bTwo;
        public string cTwo;
        public string aThree;
        public string aThreeTwo;
        public string bThree;
        public string cThree;

        public string RejectionDate;
        public string RejectionTime;
        public int RejectedUserId;
        public int AddedBy;
        public Boolean TC;

        public string Address2;
        public string Zip2;
        public string State2;
        public string City2;
        public string SuiteAptRoom2;
        public string SalesExperience;

        public string PositionAppliedFor;
        public int DesignationID;
        public string PhoneISDCode;
        public string PhoneExtNo;
        public string CountryCode;
        public string NameMiddleInitial;
        public bool IsEmailPrimaryEmail;
        public bool IsPhonePrimaryPhone;
        public bool IsEmailContactPreference;
        public bool IsCallContactPreference;
        public bool IsTextContactPreference;
        public bool IsMailContactPreference;

        public string GitUserName;
    }

    public class user1
    {
        public int Id;
        public string Email;
        public string Email2;//Add By ratnakar
        public string Notes; // Add By ratnakar
        public string Designation;
        public int DesignationId;
        public string usertype;
        public string status;
        public string phone;
        public string phonetype;
        public string address;
        public string state;
        public string city;
        public string zip;
        public string firstname;
        public string lastname;
        public int PrimeryTradeId;
        public int SecondoryTradeId;
        public string Source;
        public int SourceId;
        public string SuiteAptRoom;
        public int FullTimePosition;
        public bool DrugTest;
        public bool PrevApply;
        public string SalaryReq;
        public string Avialability;
        public string Phone2;
        public string Phone2Type;
        public string CompanyName;
        public string SourceUser;
        public string DateSourced;
        public bool CurrentEmployement;
        public string LeavingReason;
        public bool FELONY;

        public string Address2;
        public string Zip2;
        public string State2;
        public string City2;
        public string SuiteAptRoom2;
        public string SalesExperience;
        public string UserType;
        public string Password;
        public Int64 Row_Num;

    }

    public class LoginUser
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string ProfilePic { get; set; }
    }

    public class ChatMentionUser
    {
        public int id { get; set; }
        public string name { get; set; }
        public string avatar { get; set; }
        public string type { get; set; }
    }

    public class ActiveUser
    {
        public ActiveUser()
        {
            //LastActivityAt = DateTime.UtcNow;
            Status = 1;
        }
        public int? UserId { get; set; }
        public string UserInstallId { get; set; }
      //  public string FirstName { get; set; }
       // public string LastName { get; set; }
       // public string Email { get; set; }
        public DateTime? OnlineAt { get; set; }
        public string OnlineAtFormatted { get; set; }
        public string ProfilePic { get; set; }
        public DateTime LastActivityAt { get; set; }

        public string LastMessage { get; set; }
        public DateTime? LastMessageAt { get; set; }
        public string LastMessageAtFormatted { get; set; }
        public bool IsRead { get; set; }
        public int Status { get; set; }

        public string ChatGroupId { get; set; }
        public string ReceiverIds { get; set; }

        public string GroupOrUsername { get; set; }
    }

    public class ChatUser : ActiveUser
    {
        public ChatUser()
        {
            ConnectionIds = new List<string>();
        }
        public List<string> ConnectionIds { get; set; }
        public bool ChatClosed { get; set; }
    }

    public class ChatMessage
    {
        public int UserId { get; set; }
        public string UserInstallId { get; set; }
        public string UserProfilePic { get; set; }
        public string UserFullname { get; set; }
        public string Message { get; set; }
        public DateTime MessageAt { get; set; }
        public string MessageAtFormatted { get; set; }

        public int ChatSourceId { get; set; }

        public string ChatGroupId { get; set; }

    }

    public class ChatMessageActiveUser
    {
        public ChatMessageActiveUser()
        {
            ActiveUsers = new List<modal.ActiveUser>();
            ChatMessages = new List<modal.ChatMessage>();
        }
        public string ChatGroupId { get; set; }
        public string ChatGroupName { get; set; }
        public List<ActiveUser> ActiveUsers { get; set; }
        public List<ChatMessage> ChatMessages { get; set; }
    }

    public class ChatGroup
    {
        public ChatGroup()
        {
            ChatUsers = new List<ChatUser>();
            ChatMessages = new List<ChatMessage>();
        }
        public string ChatGroupId { get; set; }
        public string ChatGroupName { get; set; }
        public List<ChatUser> ChatUsers { get; set; }
        public List<ChatMessage> ChatMessages { get; set; }
        public int SenderId { get; set; }
    }

    public sealed class SingletonUserChatGroups
    {
        SingletonUserChatGroups()
        {
            ChatGroups = new List<ChatGroup>();
            ActiveUsers = new List<ActiveUser>();
        }

        private static readonly object padlock = new object();
        private static SingletonUserChatGroups instance = null;
        public List<ChatGroup> ChatGroups { get; set; }
        public List<ActiveUser> ActiveUsers { get; set; }
        public static SingletonUserChatGroups Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new SingletonUserChatGroups();
                        }
                    }
                }
                return instance;
            }
        }
    }

    public sealed class SingletonGlobal
    {
        SingletonGlobal()
        {
            RandomGUID = JGConstant.RandomGUID;
            ConnectedClients = new List<string>();
        }

        private static readonly object padlock = new object();
        private static SingletonGlobal instance = null;
        public string RandomGUID { get; set; }
        public List<string> ConnectedClients { get; set; }
        public static SingletonGlobal Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new SingletonGlobal();
                        }
                    }
                }
                return instance;
            }
        }
    }
}
