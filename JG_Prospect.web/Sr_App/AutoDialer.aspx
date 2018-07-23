<%@ Page Title="" Language="C#" MasterPageFile="~/Sr_App/SR_app.Master" AutoEventWireup="true" CodeBehind="AutoDialer.aspx.cs" Inherits="JG_Prospect.Sr_App.AutoDialer" %>

<%@ Register Src="~/Controls/_UserGridPhonePopup.ascx" TagPrefix="uc1" TagName="_UserGridPhonePopup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Controls/user-grid.css" rel="stylesheet" />
    <style>
        .dialer-container div#phone {
            width: 23%;
            float: left;
        }

        div#wrapper {
            text-align: left;
        }

        .dialer-right > div {
            z-index: 101;
            border: 1px solid #bbb;
            border-radius: 5px;
            background: #fff;
        }

        .dialer-right {
            float: left;
            width: 76.8%;
        }

            .dialer-right div.scrips {
                min-height: 539px;
                padding: 5px;
            }



        div.userlist-grid {
            float: left;
            width: 100%;
            background: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        string baseUrl = HttpContext.Current.Request.Url.Scheme +
                                "://" + HttpContext.Current.Request.Url.Authority +
                                HttpContext.Current.Request.ApplicationPath.TrimEnd('/') + "/";

    %>
    <link href="../css/chosen.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/js/chosen.jquery.js")%>"></script>
    <script src="../js/angular/scripts/jgapp.js"></script>
    <script src="../js/angular/scripts/TaskSequence.js"></script>
    <script src="../js/angular/scripts/FrozenTask.js"></script>
    <script src="../js/TaskSequencing.js"></script>
    <script src="../js/jquery.dd.min.js"></script>
    <script src="../js/angular/scripts/ClosedTasls.js"></script>
    <script src="../js/angular/scripts/Phone.js"></script>
    <div class="dialer-container"  ng-app="JGApp" ng-controller="SalesUserController">
        <div id="wrapper">
            <div class="auto-dialer-top-section">
            <div id="phone">
                <div class="col-md-4 phone">
                    <div class="row1">
                        <input type="hidden" id="appSettings" />
                        <textarea style="display: none;" rows="4" cols="40" id="sendFeedbackComment" placeholder="Optional comments"></textarea>
                        <div class="col-md-12 white-shadow">
                            <input type="text" name="name" onkeyup="trimSpace(this)" onblur="trimSpace(this)" id="toNumber" class="form-control tel" placeholder="+91801XXXXXXX" value="" />
                            <div class="num-pad">
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            1
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            2 <span class="small">
                                                <p>
                                                    ABC
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            3 <span class="small">
                                                <p>
                                                    DEF
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            4 <span class="small">
                                                <p>
                                                    GHI
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            5 <span class="small">
                                                <p>
                                                    JKL
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            6 <span class="small">
                                                <p>
                                                    MNO
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            7 <span class="small">
                                                <p>
                                                    PQRS
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            8 <span class="small">
                                                <p>
                                                    TUV
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            9 <span class="small">
                                                <p>
                                                    WXYZ
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            *
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            0 <span class="small">
                                                <p>
                                                    +
                                                </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="num">
                                        <div class="txt">
                                            #
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <input type="button" id="makecall" class="btn btn-success btn-block flatbtn" value="CALL" />
                            <input type="button" class="hangup btn btn-danger btn-block flatbtn" value="HANGUP" />
                            <%
                                List<int> AllowedDesignations = new List<int>();
                                AllowedDesignations.Add(1);
                                AllowedDesignations.Add(5);
                                AllowedDesignations.Add(21);
                                AllowedDesignations.Add(23);
                                if (AllowedDesignations.Contains(DesignationId))
                                {
                            %>
                            <div class="play-stop" style="display:none;">
                                <div class="row">
                                    <span class="back" title="Back" onclick="dialPreviousNumber(this)"><i class="fas fa-step-backward"></i></span>
                                    <span class="play" title="Start" onclick="startAutoDiualer(this)"><i class="fas fa-play-circle"></i></span>
                                    <span class="pause" style="display: none;" title="Pause" onclick="pauseAutoDialer(this)"><i class="fas fa-pause-circle"></i></span>
                                    <span class="stop" title="Stop" onclick="stopAutoDiualer(this)"><i class="fas fa-stop-circle"></i></span>
                                    <span class="next" title="Forward" onclick="diaNextNumber(this)"><i class="fas fa-step-forward"></i></span>
                                </div>
                            </div>
                            <%
                                }
                             %> 
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="button-3">
                    <div class="callinfo">
                        <h4 id="boundType">Fetching...</h4>
                        <h4 id="callNum">Fetching...</h4>
                        <h2 id="callDuration">00:00</h2>
                    </div>
                </div>
                               
                
            </div>
            <div class="dialer-right">
                <input type="hidden" class="script-data" value="" />
                <div class="scrips">
                    <div class="tabs">
                        <div onclick="showhideType(this, 1);">Inbound</div>
                        <div onclick="showhideType(this, 2);" class="active">Outbound</div>
                    </div>
                    <div class="script-data">
                        <div class="inner-tabs">
                        </div>
                        <div class="content">
                        </div>
                        <div class="content-right"></div>
                    </div>
                </div>                
            </div>
                <div class="bottom-row">
                    <div class="logger">
                        <div class="title">Recent Calls</div>
                        <div class="log-content">
                            <div ng-repeat="Log in PhoneCallLogList.Results" class="user-row row bg1" title="{{Log.ReceiverFullName}}({{Log.ReceiverNumber}}) : {{Log.CallDurationFormatted}}" uid="780">
                                <div class="user-image">
                                    <div class="img">
                                        <img src="<%=baseUrl %>Employee/ProfilePictures/{{Log.ReceiverProfilePic}}" />
                                    </div>
                                </div>
                                <div class="contents">
                                    <div class="top">
                                        <div class="name">{{Log.ReceiverFullName}}</div>
                                    </div>
                                    <div class="msg-container">
                                        <div class="tick">
                                            <span class="img {{Log.Mode}} {{Log.CallDurationInSeconds ==0 ? 'not-connected':''}}"></span></div>
                                        <div class="msg">{{Log.CallStartTimeFormatted}}</div>
                                    </div>
                                </div>
                                <div class="caller">
                                    <div class="video"><i class="fas fa-video" aria-hidden="true"></i></div>
                                    <div class="phone"><i class="fa fa-phone" aria-hidden="true"></i></div>
                                    <div class="mic"><i class="fas fa-microphone" aria-hidden="true"></i></div>
                                </div>
                            </div>                        
                        </div>
                    </div>

                    <div class="phone-stats">
                        <div style="padding: 10px; font-size: 16px; font-weight: bold;">Phone Statistic - <a href="">Detailed Report</a></div>
                        <table class="stats">
                            <tr>
                                <td>Total Outbound</td>
                                <td>{{PhoneCallStatistics.TotalOutbound}}</td>
                                <td>Total Duration</td>
                                <td>{{PhoneCallStatistics.TotalCallDurationFormatted}}</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Total Applicant Called</td>
                                <td>{{PhoneCallStatistics.TotalApplicantCalled}}</td>
                                <td>Total Referal Applicant Called</td>
                                <td>{{PhoneCallStatistics.TotalReferralApplicantCalled}}</td>
                                <td>Total Interview Date Called</td>
                                <td>{{PhoneCallStatistics.TotalInterviewDateCalled}}</td>
                            </tr>
                            <tr>
                                <td>Total Applicant Duration</td>
                                <td>{{PhoneCallStatistics.TotalApplicantDurationFormatted}}</td>
                                <td>Total Referal Applicant Duration</td>
                                <td>{{PhoneCallStatistics.TotalReferralApplicantFormatted}}</td>
                                <td>Total Interview Date Duration</td>
                                <td>{{PhoneCallStatistics.TotalInterviewDateFormatted}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <%--<div class="auto-dialer-middle-section">
                
            </div>--%>
            <div class="auto-dialer-bottom-section">
                <uc1:_UserGridPhonePopup runat="server" ID="_UserGridPhonePopup" />
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            $('.footer_panel').remove();
            GetPhoneScripts(this);
            $('.search-user').trigger('click');

            resetSettings();
            initPhone();
            sequenceScopePhone.GetPhoneCallLogList();
            var pH = $(window).height();
            $('.auto-dialer-bottom-section').css('height', (parent.phonePopupHeight - 414) + 'px');

            
        });
    </script>
</asp:Content>
