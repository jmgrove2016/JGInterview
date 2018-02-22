<%@ Page Title="" Language="C#" MasterPageFile="~/Sr_App/SR_app.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ITDashboard.aspx.cs" Inherits="JG_Prospect.Sr_App.ITDashboard" %>

<%@ Register Src="~/Sr_App/LeftPanel.ascx" TagName="LeftPanel" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .clsTestMail {
            padding: 20px;
            font-size: 14px;
        }

            .clsTestMail input[type='text'] {
                padding: 5px;
            }

            .clsTestMail input[type='submit'] {
                background: #000;
                color: #fff;
                padding: 5px 7px;
                border: 1px solid #808080;
            }

                .clsTestMail input[type='submit']:hover {
                    background: #fff;
                    color: #000;
                    cursor: pointer;
                }

        .table tr {
            border: solid 1px #fff;
        }

        .modalBackground {
            background-color: #333333;
            filter: alpha(opacity=70);
            opacity: 0.7;
            z-index: 100 !important;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: #CCCCCC;
            padding: 1px;
            width: 900px;
            Height: 550px;
            overflow-y: auto;
        }

        .badge1 {
            padding: 1px 5px 2px;
            font-size: 12px;
            font-weight: bold;
            white-space: nowrap;
            color: #ffffff;
            background-color: #e55456;
            -webkit-border-radius: 9px;
            -moz-border-radius: 9px;
            border-radius: 8px;
            display: inline;
        }

        .ui-autocomplete {
            z-index: 999999999 !important;
            max-height: 250px;
            overflow-y: auto;
            overflow-x: hidden;
        }

        .pagination-ys {
            padding-left: 0;
            margin: 5px 0;
            border-radius: 4px;
            align-content: flex-end;
            line-height: none !important;
        }

            .pagination-ys td {
                border: none !important;
            }

            .pagination-ys table > tbody {
                height: unset !important;
            }

                .pagination-ys table > tbody > tr > td {
                    display: inline !important;
                    background: none;
                    border: none !important;
                }

                    .pagination-ys table > tbody > tr > td > a,
                    .pagination-ys table > tbody > tr > td > span {
                        position: relative;
                        float: left;
                        padding: 8px 12px;
                        line-height: 1.42857143;
                        text-decoration: none;
                        color: #dd4814;
                        background-color: #ffffff;
                        border: 1px solid #dddddd;
                        margin-left: -1px;
                    }

                    .pagination-ys table > tbody > tr > td > span {
                        position: relative;
                        float: left;
                        padding: 8px 12px;
                        line-height: 1.42857143;
                        text-decoration: none;
                        margin-left: -1px;
                        z-index: 2;
                        color: #aea79f;
                        background-color: #f5f5f5;
                        border-color: #dddddd;
                        cursor: default;
                    }

                    .pagination-ys table > tbody > tr > td:first-child > a,
                    .pagination-ys table > tbody > tr > td:first-child > span {
                        margin-left: 0;
                        border-bottom-left-radius: 4px;
                        border-top-left-radius: 4px;
                    }

                    .pagination-ys table > tbody > tr > td:last-child > a,
                    .pagination-ys table > tbody > tr > td:last-child > span {
                        border-bottom-right-radius: 4px;
                        border-top-right-radius: 4px;
                    }

                    .pagination-ys table > tbody > tr > td > a:hover,
                    .pagination-ys table > tbody > tr > td > span:hover,
                    .pagination-ys table > tbody > tr > td > a:focus,
                    .pagination-ys table > tbody > tr > td > span:focus {
                        color: #97310e;
                        background-color: #eeeeee;
                        border-color: #dddddd;
                    }

        /*.dashboard tr {
        display: flex;
    }

   .pagination-ys td {
        border-spacing: 0px !important;
        flex: 1 auto;
        word-wrap: break-word;
        background: none !important;
        line-height: none !important;
    }

    .dashboard thead tr:after {
        content:'';
        overflow-y: scroll;
        visibility: hidden;
        height: 0;
    }
 
    .dashboard thead th {
        flex: 1 auto;
        display: block;
        background-color: #000 !important;
    }

    .dashboard tbody {
        display: block;
        width: 100%;
        overflow-y: auto;
        height: 370px;
    }*/

        table.table tr.trHeader {
            background: none !important;
        }

        table.table th {
            border: none;
        }

        .dashboard tr {
            display: flex;
        }

        .dashboard td {
            border-spacing: 0px !important;
            padding: 3px !important;
            flex: 1 auto;
            word-wrap: break-word;
            background: none !important;
            padding: 3px 0 0 0 !important;
            line-height: none !important;
        }

        .dashboard thead tr:after {
            content: '';
            overflow-y: scroll;
            visibility: hidden;
            height: 0;
        }

        .dashboard thead th {
            flex: 1 auto;
            display: block;
            padding: 0px;
            background-color: #000;
        }


            .dashboard thead th:first-child {
                border-top-left-radius: 4px;
            }

            .dashboard thead th:last-child {
                border-top-right-radius: 4px;
            }


        .dashboard tbody {
            display: block;
            width: 100%;
            overflow-y: auto;
            height: 370px;
        }

        .tableFilter tbody tr td {
            padding: 10px;
        }

        .itdashtitle {
            margin-left: 7px;
        }

        .orange {
            background-color: orange;
            color: black;
        }

        .yellow {
            background-color: yellow;
            color: black;
        }

            .yellow span.parent-task-title {
                color: red;
            }

        .gray {
            background-color: Gray;
        }

        .red {
            background-color: red;
            color: white;
        }

            .red span.parent-task-title {
                color: white;
            }

        .black {
            background-color: black;
            color: white;
        }

            .black span.parent-task-title {
                color: red;
            }

        .lightgray {
            background-color: lightgray;
        }

        .green {
            background-color: green;
            color: white;
        }

            .green span.parent-task-title {
                color: white;
            }

        .defaultColor {
            background-color: #F6F1F3;
        }

        span.parent-task-title {
            color: red;
        }

        .notes-section {
            float: left;
            width: 100%;
        }

        .notes-popup {
            width: 100%;
            background: #fff;
            border-radius: 5px;
            margin: 10px 0px;
        }

        .notes-popup-background {
            display: none;
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
            background: #000;
            opacity: 0.5;
        }

        .notes-popup .heading {
            width: 100%;
            display: inline-block;
            background: #A33E3F;
            color: #fff;
            padding: 5px 0;
            border-radius: 5px 5px 0 0;
        }

            .notes-popup .heading .title {
                padding: 0 5px;
                float: left;
            }

        .notes-popup .content {
            padding: 5px;
        }

        .notes-popup .heading .close {
            float: right;
            top: -11px;
            font-size: 14px;
            right: -8px;
            background: #ccc;
            border-radius: 19px;
            cursor: pointer;
        }

        .notes-popup .content table {
            width: 100%;
        }

            .notes-popup .content table th {
                border: 1px solid #ccc;
                text-align: left;
                padding: 3px;
                font-size: 13px;
                color: #ddd;
                background: #000;
            }

            .notes-popup .content table td {
                padding: 3px;
                font-size: 12px;
                border: 1px solid #ccc;
            }

            .notes-popup .content table tr:nth-child(even) {
                background: #ba4f50;
                color: #fff;
            }

            .notes-popup .content table tr:nth-child(odd) {
                background: #FFF;
                color: #000;
            }

            .notes-popup .content table tr th:nth-child(1), .notes-popup .content table tr td:nth-child(1) {
                width: 210px;
            }

        .notes-popup .add-notes-container {
            display: inline-block;
            width: 98%;
            padding: 5px;
            POSITION: relative;
        }

            .notes-popup .add-notes-container textarea {
                width: 80% !important;
                height: 50px !important;
                padding: 5px !important;
                float: left;
                margin-right: 10px;
            }

        .notes-popup .notes-container .note-desc {
            width: 194px;
            height: 29px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .notes-table tr:nth-child(odd) a {
        }

        .notes-table tr:nth-child(even) a, .notes-popup tr:nth-child(even) a {
            color: #fff;
        }

        .notes-table tr th:nth-child(1), .notes-table tr td:nth-child(1) {
            width: 5%;
        }

        .notes-table tr th:nth-child(2), .notes-table tr td:nth-child(2) {
            width: 27%;
        }

        .notes-table tr th:nth-child(3), .notes-table tr td:nth-child(3) {
            width: 90px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        .GrdBtnAdd {
            margin-top: 12px;
            height: 30px;
            background: url(img/main-header-bg.png) repeat-x;
            color: #fff;
            cursor: pointer;
            border-radius: 5px;
        }

        .refresh {
            height: 20px;
            cursor: pointer;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
            padding: 5px;
            background-color: #fff;
            vertical-align: middle;
            margin: 10px;
        }

        #ViewTab {
            width: 100%;
            float: right;
        }

        #ContentPlaceHolder1_lblalertpopup {
            float: left;
        }

        #ViewTab ul {
            position: absolute;
            top: 305px;
            margin-right: 19px;
        }

        .noData {
            width: 100%;
            clear: both;
            text-align: center;
            line-height: 50px;
            font-size: 15px;
        }

        .hours-col {
            line-height: 30px;
        }

        #ddlDesignationSeq_chosen ul.chosen-choices {
            max-height: 58px;
            overflow-y: auto;
        }

        .seq-number-fixed {
            width: 120px;
        }

        .seq-taskid-fixed {
            width: 130px;
        }

        .seq-tasktitle-fixed {
            width: 350px;
        }

        .seq-taskstatus-fixed {
            width: 250px;
        }

        .seq-taskduedate-fixed {
            width: 100px;
        }

        .seq-notes-fixed {
            width: 40%;
        }

        .seq-notes-fixed {
            width: 33%;
        }

        #taskSequence {
            margin-top: 42px;
        }
    </style>
    <link href="../css/chosen.css" rel="stylesheet" />
    <link href="../Styles/dd.css" rel="stylesheet" />
    <link href="../Content/touchPointlogs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_panel" ng-app="JGApp">
        <!-- appointment tabs section start -->
        <ul class="appointment_tab">
            <li><a href="home.aspx">Sales Calendar</a></li>
            <li><a href="GoogleCalendarView.aspx">Master  Calendar</a></li>
            <li><a class="active" href="ITDashboard.aspx">Operations Calendar</a></li>
            <li><a href="CallSheet.aspx">Call Sheet</a></li>
            <li id="li_AnnualCalender" visible="false" runat="server"><a href="#" runat="server">Annual Event Calendar</a> </li>
        </ul>
        <!-- appointment tabs section end -->
        <h1><b>IT Dashboard</b></h1>
        <%--     <asp:Panel ID="pnlTestEmail" Visible="false" GroupingText="Test E-Mail" runat="server" CssClass="clsTestMail">
            <asp:TextBox ID="txtTestEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnTestMail" runat="server" Text="Send Mail" OnClick="btnTestMail_Click" />
            <br />
            <asp:Label runat="server" ID="lblMessage"></asp:Label>
        </asp:Panel>--%>

        <%--<asp:UpdatePanel runat="server" ID="upAlerts"><ContentTemplate>--%>

        <div id="ViewTab">
            <h2 runat="server" id="lblalertpopup">Alerts:
            <a id="lblNonFrozenTaskCounter" runat="server" style="cursor: pointer">NA</a>
                <a id="lblFrozenTaskCounter" runat="server" style="cursor: pointer">NA</a>
            </h2>
            <ul class="appointment_tab">
                <li><a href="ITDashboard.aspx" class="active">Tasklist View</a></li>
                <li><a href="ITDashboardCalendar.aspx">Calendar View</a></li>
            </ul>
        </div>

        <!--  ------- Start DP new/frozen tasks popup ------  -->
        <div id="pnlNewFrozenTask" class="modal hide">
            <button id="btnFake" style="display: none" runat="server"></button>
            <div id="taskFrozen" ng-controller="FrozenTaskController">

                <table class="table" runat="server" id="table1" style="width: 100%">
                    <tr>
                        <td width="30%">
                            <h2 class="itdashtitle">Partial Frozen Tasks</h2>
                        </td>
                        <td>Designation</td>
                        <td>Users</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <select data-placeholder="Select Designation" class="chosen-dropdown-FrozenTasks" multiple style="width: 100%;" id="ddlFrozenTasksDesignations">
                                <option selected value="">All</option>
                                <option value="1">Admin</option>
                                <option value="2">Jr. Sales</option>
                                <option value="3">Jr Project Manager</option>
                                <option value="4">Office Manager</option>
                                <option value="5">Recruiter</option>
                                <option value="6">Sales Manager</option>
                                <option value="7">Sr. Sales</option>
                                <option value="8">IT - Network Admin</option>
                                <option value="9">IT - Jr .Net Developer</option>
                                <option value="10">IT - Sr .Net Developer</option>
                                <option value="11">IT - Android Developer</option>
                                <option value="12">IT - Sr. PHP Developer</option>
                                <option value="13">IT – JR SEO/Backlinking/Content</option>
                                <option value="14">Installer - Helper</option>
                                <option value="15">Installer - Journeyman</option>
                                <option value="16">Installer - Mechanic</option>
                                <option value="17">Installer - Lead mechanic</option>
                                <option value="18">Installer - Foreman</option>
                                <option value="19">Commercial Only</option>
                                <option value="20">SubContractor</option>
                                <option value="22">Admin-Sales</option>
                                <option value="23">Admin Recruiter</option>
                                <option value="24">IT - Senior QA</option>
                                <option value="25">IT - Junior QA</option>
                                <option value="26">IT - Jr. PHP Developer</option>
                                <option value="27">IT – Sr SEO Developer</option>
                            </select>
                        </td>
                        <td>
                            <select id="ddlSelectFrozenTask" data-placeholder="Select Users" multiple style="width: 350px; padding: 0 10px;" class="chosen-select-frozen">
                                <option selected value="">All</option>
                            </select><span id="lblLoadingFrozen" style="display: none">Loading...</span>
                        </td>
                        <td>
                            <input id="txtSearchUserFrozen" class="textbox ui-autocomplete-input" maxlength="15" placeholder="search users" type="text" style="margin-top: 14px" />
                        </td>
                    </tr>
                </table>

                <div id="taskSequenceTabsFrozen">
                    <ul>
                        <li><a href="#StaffTaskFrozen">Staff Tasks</a></li>
                        <li><a href="#TechTaskFrozen">Tech Tasks</a></li>
                    </ul>
                    <div id="StaffTaskFrozen">
                        <div id="tblStaffSeqFrozen" class="div-table tableSeqTask">
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number">Sequence#</div>
                                <div class="div-table-col seq-taskid">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate">Due Date</div>
                                <div class="div-table-col seq-notes">Notes</div>
                            </div>
                            <!-- NG Repeat Div starts -->
                            <div ng-attr-id="divMasterTaskFrozen{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in FrozenTask" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='2', yellow: Task.Status==='3', lightgray: Task.Status==='8'}" repeat-end="onStaffEnd()">
                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number">
                                    <a ng-attr-id="autoClickFrozen{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-seqdesgid="{{Task.SequenceDesignationId}}"><span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="SeqLabelFrozen{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span></a>

                                    <a id="A1" runat="server" style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{Task.TaskId}}" href="javascript:void(0);" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-hide="{{Task.TaskId == BlinkTaskId}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" onclick="swapSequence(this,true)">&#9650;</a>
                                    <a id="A2" runat="server" style="text-decoration: none;" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" href="javascript:void(0);" onclick="swapSequence(this,false)" ng-show="!$last">&#9660;</a>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}                                        
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus">
                                    <select id="drpStatusSubsequenceFrozen" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>
                                        <option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress</option>
                                        <%} %>
                                        <option ng-selected="{{Task.Status == '10'}}" value="10">Finished</option>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />
                                    <%-- <select id="lstbAssign" data-chosen="1" data-placeholder="Select Users" ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id" ng-model="DesignationAssignUsersModel" multiple>
                                        </select>--%>
                                    <%--<asp:ListBox ID="ddcbSeqAssigned" runat="server" Width="100" ClientIDMode="AutoID" SelectionMode="Multiple"
                                            data-chosen="1" data-placeholder="Select Users" ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id" ng-model="DesignationAssignUsersModel"
                                            AutoPostBack="false">--%>

                                    <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssignedFrozen" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                                
                                        </option>
                                    </select>

                                    <%--                                        <select id="ddcbSeqAssigned" style="width: 100px;" multiple  ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id"  ng-model="DesignationAssignUsersModel" ng-attr-data-AssignedUsers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        </select>--%>
                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate">
                                    <div class="seqapprovalBoxes">
                                        <div style="width: 65%; float: left;">
                                            <input type="checkbox" id="chkngUserFrozen" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" id="chkQAFrozen" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" id="chkAlphaUserFrozen" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" id="chkBetaUserFrozen" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" id="chkngITLeadFrozen" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" id="chkngAdminFrozen" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 30%; float: right;">
                                            <input type="checkbox" id="chkngITLeadMasterFrozen" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" id="chkngAdminMasterFrozen" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>

                                    <div ng-attr-data-taskid="{{Task.TaskId}}" class="seqapprovepopup" style="display: none">

                                        <div id="divTaskAdmin{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">Admin: </div>
                                            <div style="width: 30%;" class="display_inline"></div>
                                            <div ng-class="{hide : StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                            </div>
                                            <div ng-class="{hide : !StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                        </div>
                                        <div id="divTaskITLead{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">ITLead: </div>
                                            <!-- ITLead Hours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <span>
                                                    <label>{{Task.ITLeadHours}}</label>Hour(s)
                                                </span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- ITLead password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>

                                        </div>
                                        <div id="divUser{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">User: </div>
                                            <!-- UserHours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <span>
                                                    <label>{{Task.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- User password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                                <!-- Nested row starts -->

                                <div class="div-table-nested" ng-class="{hide : StringIsNullOrEmpty(Task.SubSeqTasks)}">

                                    <!-- Body section starts -->
                                    <div class="div-table-row" ng-repeat="TechTask in correctDataforAngularFrozenTaks(Task.SubSeqTasks)" ng-class="{orange : TechTask.Status==='4', yellow: TechTask.Status==='2', yellow: TechTask.Status==='3', lightgray: TechTask.Status==='8'}">
                                        <!-- Sequence# starts -->
                                        <div class="div-table-col seq-number">
                                            <a style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{TechTask.TaskId}}" href="javascript:void(0);" class="uplink" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" onclick="swapSubSequence(this,true)">&#9650;</a><a style="text-decoration: none;" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" class="downlink" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" href="javascript:void(0);" ng-show="!$last" onclick="swapSubSequence(this,false)">&#9660;</a>
                                            <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-seqdesgid="{{TechTask.SequenceDesignationId}}"><span class="badge badge-error badge-xstext">
                                                <label ng-attr-id="SeqLabel{{TechTask.TaskId}}">{{getSequenceDisplayText(!TechTask.Sequence?"N.A.":TechTask.Sequence + " (" + toRoman(TechTask.SubSequence)+ ")",TechTask.SequenceDesignationId,TechTask.IsTechTask == "false" ? "SS" : "TT")}}</label></span></a>
                                            <div class="handle-counter" ng-class="{hide: TechTask.TaskId != HighLightTaskId}" ng-attr-id="divSeq{{TechTask.TaskId}}">
                                                <input type="text" class="textbox hide" ng-attr-data-original-val='{{ TechTask.Sequence == null && 0 || TechTask.Sequence}}' ng-attr-data-original-desgid="{{TechTask.SequenceDesignationId}}" ng-attr-id='txtSeq{{TechTask.TaskId}}' value="{{  TechTask.Sequence == null && 0 || TechTask.Sequence}}" />


                                            </div>
                                        </div>
                                        <!-- Sequence# ends -->

                                        <!-- ID# and Designation starts -->
                                        <div class="div-table-col seq-taskid">
                                            <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{TechTask.MainParentId}}&hstid={{TechTask.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{TechTask.InstallId}}" parentdata-highlighter="{{TechTask.MainParentId}}" data-highlighter="{{TechTask.TaskId}}" class="bluetext" target="_blank">{{ TechTask.InstallId }}</a><br />
                                            {{getDesignationString(TechTask.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{TechTask.TaskId}}" ng-class="{hide: TechTask.TaskId != HighLightTaskId}">
                                            <select class="textbox hide" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                        </div>
                                        <!-- ID# and Designation ends -->

                                        <!-- Parent Task & SubTask Title starts -->
                                        <div class="div-table-col seq-tasktitle">
                                            {{ TechTask.ParentTaskTitle }}
                                        <br />
                                            {{ TechTask.Title }}
                                        </div>
                                        <!-- Parent Task & SubTask Title ends -->

                                        <!-- Status & Assigned To starts -->
                                        <div class="div-table-col seq-taskstatus">
                                            <select id="drpStatusSubsequenceFrozenNested" onchange="changeTaskStatusClosed(this);" data-highlighter="{{TechTask.TaskId}}">
                                                <option ng-selected="{{TechTask.Status == '1'}}" value="1">Open</option>
                                                <option ng-selected="{{TechTask.Status == '2'}}" style="color: red" value="2">Requested</option>
                                                <option ng-selected="{{TechTask.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                                <option ng-selected="{{TechTask.Status == '4'}}" value="4">InProgress</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '5'}}" value="5">Pending</option>
                                                <option ng-selected="{{TechTask.Status == '6'}}" value="6">ReOpened</option>
                                                <option ng-selected="{{TechTask.Status == '7'}}" value="7">Closed</option>
                                                <option ng-selected="{{TechTask.Status == '8'}}" value="8">SpecsInProgress</option>
                                                <%} %>
                                                <option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>
                                                <option ng-selected="{{TechTask.Status == '11'}}" value="11">Test</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '12'}}" value="12">Live</option>
                                                <option ng-selected="{{TechTask.Status == '14'}}" value="14">Billed</option>
                                                <option ng-selected="{{TechTask.Status == '9'}}" value="9">Deleted</option>
                                                <%} %>
                                            </select>
                                            <br />
                                            <select id="ddcbSeqAssignedFrozenNested" style="width: 100%;" multiple ng-attr-data-assignedusers="{{TechTask.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{TechTask.TaskId}}" data-taskstatus="{{TechTask.Status}}">
                                                <option
                                                    ng-repeat="item in DesignationAssignUsers"
                                                    value="{{item.Id}}"
                                                    label="{{item.FristName}}"
                                                    class="{{item.CssClass}}">{{item.FristName}}
                                                
                                                </option>
                                            </select>
                                        </div>
                                        <div class="div-table-col seq-taskduedate">
                                            <div class="seqapprovalBoxes">
                                                <div style="width: 65%; float: left;">
                                                    <input type="checkbox" id="chkngUserFrozenNested" ng-checked="{{TechTask.OtherUserStatus}}" ng-disabled="{{TechTask.OtherUserStatus}}" class="fz fz-user" title="User" />
                                                    <input type="checkbox" id="chkQAFrozenNested" class="fz fz-QA" title="QA" />
                                                    <input type="checkbox" id="chkAlphaUserFrozenNested" class="fz fz-Alpha" title="AlphaUser" />
                                                    <br />
                                                    <input type="checkbox" id="chkBetaUserFrozenNested" class="fz fz-Beta" title="BetaUser" />
                                                    <input type="checkbox" id="chkngITLeadFrozenNested" ng-checked="{{TechTask.TechLeadStatus}}" ng-disabled="{{TechTask.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                                    <input type="checkbox" id="chkngAdminFrozenNested" ng-checked="{{TechTask.AdminStatus}}" ng-disabled="{{TechTask.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                                </div>
                                                <div style="width: 30%; float: right;">
                                                    <input type="checkbox" id="chkngITLeadMasterFrozenNested" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                                    <input type="checkbox" id="chkngAdminMasterFreezeSeqTask" class="fz fz-admin largecheckbox" title="Admin" />
                                                </div>
                                            </div>

                                            <div ng-attr-data-taskid="{{TechTask.TaskId}}" class="seqapprovepopup">

                                                <div id="divTaskAdmin{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">Admin: </div>
                                                    <div style="width: 30%;" class="display_inline"></div>
                                                    <div ng-class="{hide : StringIsNullOrEmpty(TechTask.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(TechTask.AdminStatusUpdated) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.AdminUserInstallId)? TechTask.AdminUserId : TechTask.AdminUserInstallId}} - {{TechTask.AdminUserFirstName}} {{TechTask.AdminUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                                    </div>
                                                    <div ng-class="{hide : !StringIsNullOrEmpty(TechTask.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(TechTask.AdminStatusUpdated) }">
                                                        <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                </div>
                                                <div id="divTaskITLead{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">ITLead: </div>
                                                    <!-- ITLead Hours section -->
                                                    <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : !StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <span>
                                                            <label>{{TechTask.ITLeadHours}}</label>Hour(s)
                                                        </span>
                                                    </div>
                                                    <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                                    </div>
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                    <!-- ITLead password section -->
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : !StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.TechLeadUserInstallId)? TechTask.TechLeadUserId : TechTask.TechLeadUserInstallId}} - {{TechTask.TechLeadUserFirstName}} {{TechTask.TechLeadUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                                    </div>

                                                </div>
                                                <div id="divUser{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">User: </div>
                                                    <!-- UserHours section -->
                                                    <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(TechTask.UserHours), display_inline : !StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <span>
                                                            <label>{{TechTask.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                                    </div>
                                                    <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.UserHours), display_inline : StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                                    </div>
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.UserHours), display_inline : StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                    <!-- User password section -->
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(TechTask.UserHours), display_inline : !StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.OtherUserInstallId)? TechTask.OtherUserId : TechTask.OtherUserInstallId}} - {{TechTask.OtherUserFirstName}} {{TechTask.OtherUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="div-table-col seq-notes">
                                            Notes
                                        </div>
                                        <!-- Status & Assigned To ends -->


                                    </div>
                                    <!-- Body section ends -->

                                </div>

                                <!-- Nested row ends -->

                            </div>
                        </div>

                        <div class="text-center">
                            <jgpager page="{{page}}" pages-count="{{pagesCount}}" total-count="{{TotalRecords}}" search-func="getTasks(page)"></jgpager>
                        </div>
                        <div ng-show="loader.loading" style="position: absolute; left: 50%; bottom: -20%">
                            Loading...
                <img src="../img/ajax-loader.gif" />
                        </div>

                    </div>

                    <div id="TechTaskFrozen">

                        <div id="tblTechSeqFrozen" class="div-table tableSeqTask">
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number">Sequence#</div>
                                <div class="div-table-col seq-taskid">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate">Due Date</div>
                                <div class="div-table-col seq-notes">Notes</div>
                            </div>

                            <div ng-attr-id="divMasterTask{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in FrozenTask" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='2', yellow: Task.Status==='3', lightgray: Task.Status==='8'}" repeat-end="onTechEnd()">

                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number">
                                    <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-seqdesgid="{{Task.SequenceDesignationId}}"><span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="SeqLabel{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span></a><a style="text-decoration: none;" ng-attr-data-taskid="{{Task.TaskId}}" href="javascript:void(0);" class="uplink" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-show="!$first" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" onclick="swapSequence(this,true)">&#9650;</a><a style="text-decoration: none;" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-taskseq="{{Task.Sequence}}" class="downlink" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" href="javascript:void(0);" onclick="swapSequence(this,false)" ng-show="!$last">&#9660;</a>
                                    <div class="handle-counter" ng-class="{hide: Task.TaskId != HighLightTaskId}" ng-attr-id="divSeq{{Task.TaskId}}">
                                        <input type="text" class="textbox hide" ng-attr-data-original-val='{{ Task.Sequence == null && 0 || Task.Sequence}}' ng-attr-data-original-desgid="{{Task.SequenceDesignationId}}" ng-attr-id='txtSeq{{Task.TaskId}}' value="{{  Task.Sequence == null && 0 || Task.Sequence}}" />


                                    </div>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{Task.TaskId}}" ng-class="{hide: Task.TaskId != HighLightTaskId}">
                                            <select class="textbox" ng-attr-data-taskid="{{Task.TaskId}}" onchange="setDropDownChangedData(this)" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus">
                                    <select id="drpStatusSubsequenceTechFrozen" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>
                                        <option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress</option>
                                        <%} %>
                                        <option ng-selected="{{Task.Status == '10'}}" value="10">Finished</option>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />
                                    <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssigned" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                                
                                        </option>
                                    </select>

                                    <%--                                        <select id="ddcbSeqAssigned" style="width: 100px;" multiple  ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id"  ng-model="DesignationAssignUsersModel" ng-attr-data-AssignedUsers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        </select>--%>
                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate">
                                    <div class="seqapprovalBoxes">
                                        <div style="width: 65%; float: left;">
                                            <input type="checkbox" id="chkngUserTechFrozen" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" id="chkQATechFrozen" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" id="chkAlphaUserTechFrozen" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" id="chkBetaUserTechFrozen" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" id="chkngITLeadTechFrozen" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" id="chkngAdminTechFrozen" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 30%; float: right;">
                                            <input type="checkbox" id="chkngITLeadMasterTechFrozen" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" id="chkngAdminMasterTechFrozen" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>

                                    <div ng-attr-data-taskid="{{Task.TaskId}}" class="seqapprovepopup">

                                        <div id="divTaskAdmin{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">Admin: </div>
                                            <div style="width: 30%;" class="display_inline"></div>
                                            <div ng-class="{hide : StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                            </div>
                                            <div ng-class="{hide : !StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                        </div>
                                        <div id="divTaskITLead{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">ITLead: </div>
                                            <!-- ITLead Hours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <span>
                                                    <label>{{Task.ITLeadHours}}</label>Hour(s)
                                                </span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- ITLead password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>

                                        </div>
                                        <div id="divUser{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">User: </div>
                                            <!-- UserHours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <span>
                                                    <label>{{Task.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- User password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                            </div>

                        </div>






                        <div class="text-center">
                            <jgpager page="{{Techpage}}" pages-count="{{TechpagesCount}}" total-count="{{TechTotalRecords}}" search-func="getTechTasks(page)"></jgpager>
                        </div>


                        <%--  <!-- UI-Grid Starts Here -->

                            <div id="divUIGrid" ng-controller="UiGridController">
                                <div ui-grid="gridOptions" ui-grid-expandable class="grid"></div>
                            </div>

                            <!-- UI-Grid Ends here -->--%>
                    </div>

                </div>


            </div>

            <div id="taskNonFrozen" ng-controller="NonFrozenTaskController">
                <h2 class="itdashtitle">Non Frozen Tasks</h2>


                <div id="taskSequenceTabsNonFrozen">
                    <ul>
                        <li><a href="#StaffTaskNonFrozen">Staff Tasks</a></li>
                        <li><a href="#TechTaskNonFrozen">Tech Tasks</a></li>

                    </ul>
                    <div id="StaffTaskNonFrozen">
                        <div id="tblStaffSeqNonFrozen" class="div-table tableSeqTask">
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number">Sequence#</div>
                                <div class="div-table-col seq-taskid">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate">Due Date</div>
                                <div class="div-table-col seq-notes">Notes</div>
                            </div>
                            <!-- NG Repeat Div starts -->
                            <div ng-attr-id="divMasterTaskNonFrozen{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in NonFrozenTask" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='2', yellow: Task.Status==='3', lightgray: Task.Status==='8'}" repeat-end="onStaffEnd()">
                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number">
                                    <a ng-attr-id="autoClickNonFrozen{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-seqdesgid="{{Task.SequenceDesignationId}}"><span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="SeqLabelNonFrozen{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span></a>

                                    <a id="A3" runat="server" style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{Task.TaskId}}" href="javascript:void(0);" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-hide="{{Task.TaskId == BlinkTaskId}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" onclick="swapSequence(this,true)">&#9650;</a>
                                    <a id="A4" runat="server" style="text-decoration: none;" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" href="javascript:void(0);" onclick="swapSequence(this,false)" ng-show="!$last">&#9660;</a>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}                                        
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus">
                                    <select id="drpStatusSubsequenceNonFrozen" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>
                                        <option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress</option>
                                        <%} %>
                                        <option ng-selected="{{Task.Status == '10'}}" value="10">Finished</option>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />
                                    <%-- <select id="lstbAssign" data-chosen="1" data-placeholder="Select Users" ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id" ng-model="DesignationAssignUsersModel" multiple>
                                        </select>--%>
                                    <%--<asp:ListBox ID="ddcbSeqAssigned" runat="server" Width="100" ClientIDMode="AutoID" SelectionMode="Multiple"
                                            data-chosen="1" data-placeholder="Select Users" ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id" ng-model="DesignationAssignUsersModel"
                                            AutoPostBack="false">--%>

                                    <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssignedNonFrozen" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                                
                                        </option>
                                    </select>

                                    <%--                                        <select id="ddcbSeqAssigned" style="width: 100px;" multiple  ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id"  ng-model="DesignationAssignUsersModel" ng-attr-data-AssignedUsers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        </select>--%>
                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate">
                                    <div class="seqapprovalBoxes">
                                        <div style="width: 65%; float: left;">
                                            <input type="checkbox" id="chkngUserNonFrozen" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" id="chkQANonFrozen" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" id="chkAlphaUserNonFrozen" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" id="chkBetaUserNonFrozen" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" id="chkngITLeadNonFrozen" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" id="chkngAdminNonFrozen" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 30%; float: right;">
                                            <input type="checkbox" id="chkngITLeadMasterNonFrozen" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" id="chkngAdminMasterNonFrozen" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>

                                    <div ng-attr-data-taskid="{{Task.TaskId}}" class="seqapprovepopup" style="display: none">

                                        <div id="divTaskAdmin{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">Admin: </div>
                                            <div style="width: 30%;" class="display_inline"></div>
                                            <div ng-class="{hide : StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                            </div>
                                            <div ng-class="{hide : !StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                        </div>
                                        <div id="divTaskITLead{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">ITLead: </div>
                                            <!-- ITLead Hours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <span>
                                                    <label>{{Task.ITLeadHours}}</label>Hour(s)
                                                </span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- ITLead password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>

                                        </div>
                                        <div id="divUser{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">User: </div>
                                            <!-- UserHours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <span>
                                                    <label>{{Task.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- User password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                                <!-- Nested row starts -->

                                <div class="div-table-nested" ng-class="{hide : StringIsNullOrEmpty(Task.SubSeqTasks)}">

                                    <!-- Body section starts -->
                                    <div class="div-table-row" ng-repeat="TechTask in correctDataforAngularFrozenTaks(Task.SubSeqTasks)" ng-class="{orange : TechTask.Status==='4', yellow: TechTask.Status==='2', yellow: TechTask.Status==='3', lightgray: TechTask.Status==='8'}">
                                        <!-- Sequence# starts -->
                                        <div class="div-table-col seq-number">
                                            <a style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{TechTask.TaskId}}" href="javascript:void(0);" class="uplink" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" onclick="swapSubSequence(this,true)">&#9650;</a><a style="text-decoration: none;" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" class="downlink" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" href="javascript:void(0);" ng-show="!$last" onclick="swapSubSequence(this,false)">&#9660;</a>
                                            <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-seqdesgid="{{TechTask.SequenceDesignationId}}"><span class="badge badge-error badge-xstext">
                                                <label ng-attr-id="SeqLabel{{TechTask.TaskId}}">{{getSequenceDisplayText(!TechTask.Sequence?"N.A.":TechTask.Sequence + " (" + toRoman(TechTask.SubSequence)+ ")",TechTask.SequenceDesignationId,TechTask.IsTechTask == "false" ? "SS" : "TT")}}</label></span></a>
                                            <div class="handle-counter" ng-class="{hide: TechTask.TaskId != HighLightTaskId}" ng-attr-id="divSeq{{TechTask.TaskId}}">
                                                <input type="text" class="textbox hide" ng-attr-data-original-val='{{ TechTask.Sequence == null && 0 || TechTask.Sequence}}' ng-attr-data-original-desgid="{{TechTask.SequenceDesignationId}}" ng-attr-id='txtSeq{{TechTask.TaskId}}' value="{{  TechTask.Sequence == null && 0 || TechTask.Sequence}}" />


                                            </div>
                                        </div>
                                        <!-- Sequence# ends -->

                                        <!-- ID# and Designation starts -->
                                        <div class="div-table-col seq-taskid">
                                            <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{TechTask.MainParentId}}&hstid={{TechTask.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{TechTask.InstallId}}" parentdata-highlighter="{{TechTask.MainParentId}}" data-highlighter="{{TechTask.TaskId}}" class="bluetext" target="_blank">{{ TechTask.InstallId }}</a><br />
                                            {{getDesignationString(TechTask.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{TechTask.TaskId}}" ng-class="{hide: TechTask.TaskId != HighLightTaskId}">
                                            <select class="textbox hide" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                        </div>
                                        <!-- ID# and Designation ends -->

                                        <!-- Parent Task & SubTask Title starts -->
                                        <div class="div-table-col seq-tasktitle">
                                            {{ TechTask.ParentTaskTitle }}
                                        <br />
                                            {{ TechTask.Title }}
                                        </div>
                                        <!-- Parent Task & SubTask Title ends -->

                                        <!-- Status & Assigned To starts -->
                                        <div class="div-table-col seq-taskstatus">
                                            <select id="drpStatusSubsequenceNonFrozenNested" onchange="changeTaskStatusClosed(this);" data-highlighter="{{TechTask.TaskId}}">
                                                <option ng-selected="{{TechTask.Status == '1'}}" value="1">Open</option>
                                                <option ng-selected="{{TechTask.Status == '2'}}" style="color: red" value="2">Requested</option>
                                                <option ng-selected="{{TechTask.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                                <option ng-selected="{{TechTask.Status == '4'}}" value="4">InProgress</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '5'}}" value="5">Pending</option>
                                                <option ng-selected="{{TechTask.Status == '6'}}" value="6">ReOpened</option>
                                                <option ng-selected="{{TechTask.Status == '7'}}" value="7">Closed</option>
                                                <option ng-selected="{{TechTask.Status == '8'}}" value="8">SpecsInProgress</option>
                                                <%} %>
                                                <option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>
                                                <option ng-selected="{{TechTask.Status == '11'}}" value="11">Test</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '12'}}" value="12">Live</option>
                                                <option ng-selected="{{TechTask.Status == '14'}}" value="14">Billed</option>
                                                <option ng-selected="{{TechTask.Status == '9'}}" value="9">Deleted</option>
                                                <%} %>
                                            </select>
                                            <br />
                                            <select id="ddcbSeqAssignedNonFrozenNested" style="width: 100%;" multiple ng-attr-data-assignedusers="{{TechTask.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{TechTask.TaskId}}" data-taskstatus="{{TechTask.Status}}">
                                                <option
                                                    ng-repeat="item in DesignationAssignUsers"
                                                    value="{{item.Id}}"
                                                    label="{{item.FristName}}"
                                                    class="{{item.CssClass}}">{{item.FristName}}
                                                
                                                </option>
                                            </select>
                                        </div>
                                        <!-- Status & Assigned To ends -->

                                        <div class="div-table-col seq-taskduedate">
                                            <div class="seqapprovalBoxes">
                                                <div style="width: 65%; float: left;">
                                                    <input type="checkbox" id="chkngUserNonFrozenNested" ng-checked="{{TechTask.OtherUserStatus}}" ng-disabled="{{TechTask.OtherUserStatus}}" class="fz fz-user" title="User" />
                                                    <input type="checkbox" id="chkQANonFrozenNested" class="fz fz-QA" title="QA" />
                                                    <input type="checkbox" id="chkAlphaUserNonFrozenNested" class="fz fz-Alpha" title="AlphaUser" />
                                                    <br />
                                                    <input type="checkbox" id="chkBetaUserNonFrozenNested" class="fz fz-Beta" title="BetaUser" />
                                                    <input type="checkbox" id="chkngITLeadNonFrozenNested" ng-checked="{{TechTask.TechLeadStatus}}" ng-disabled="{{TechTask.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                                    <input type="checkbox" id="chkngAdminNonFrozenNested" ng-checked="{{TechTask.AdminStatus}}" ng-disabled="{{TechTask.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                                </div>
                                                <div style="width: 30%; float: right;">
                                                    <input type="checkbox" id="chkngITLeadMasterNonFrozenNested" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                                    <input type="checkbox" id="chkngAdminMasterNonFrozenNested" class="fz fz-admin largecheckbox" title="Admin" />
                                                </div>
                                            </div>

                                            <div ng-attr-data-taskid="{{TechTask.TaskId}}" class="seqapprovepopup">

                                                <div id="divTaskAdmin{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">Admin: </div>
                                                    <div style="width: 30%;" class="display_inline"></div>
                                                    <div ng-class="{hide : StringIsNullOrEmpty(TechTask.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(TechTask.AdminStatusUpdated) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.AdminUserInstallId)? TechTask.AdminUserId : TechTask.AdminUserInstallId}} - {{TechTask.AdminUserFirstName}} {{TechTask.AdminUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                                    </div>
                                                    <div ng-class="{hide : !StringIsNullOrEmpty(TechTask.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(TechTask.AdminStatusUpdated) }">
                                                        <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                </div>
                                                <div id="divTaskITLead{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">ITLead: </div>
                                                    <!-- ITLead Hours section -->
                                                    <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : !StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <span>
                                                            <label>{{TechTask.ITLeadHours}}</label>Hour(s)
                                                        </span>
                                                    </div>
                                                    <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                                    </div>
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                    <!-- ITLead password section -->
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(TechTask.ITLeadHours), display_inline : !StringIsNullOrEmpty(TechTask.ITLeadHours) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.TechLeadUserInstallId)? TechTask.TechLeadUserId : TechTask.TechLeadUserInstallId}} - {{TechTask.TechLeadUserFirstName}} {{TechTask.TechLeadUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                                    </div>

                                                </div>
                                                <div id="divUser{{TechTask.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                                    <div style="width: 10%;" class="display_inline">User: </div>
                                                    <!-- UserHours section -->
                                                    <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(TechTask.UserHours), display_inline : !StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <span>
                                                            <label>{{TechTask.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                                    </div>
                                                    <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.UserHours), display_inline : StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                                    </div>
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(TechTask.UserHours), display_inline : StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                            data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{TechTask.TaskId}}" />
                                                    </div>
                                                    <!-- User password section -->
                                                    <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(TechTask.UserHours), display_inline : !StringIsNullOrEmpty(TechTask.UserHours) }">
                                                        <a class="bluetext" href="CreateSalesUser.aspx?id={{TechTask.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(TechTask.OtherUserInstallId)? TechTask.OtherUserId : TechTask.OtherUserInstallId}} - {{TechTask.OtherUserFirstName}} {{TechTask.OtherUserLastName}}
                                                        </a>
                                                        <br />
                                                        <span>{{ TechTask.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ TechTask.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(TechTask.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="div-table-col seq-notes">
                                            Notes
                                        </div>
                                    </div>
                                    <!-- Body section ends -->

                                </div>

                                <!-- Nested row ends -->

                            </div>
                        </div>


                        <div class="text-center">
                            <jgpager page="{{page}}" pages-count="{{pagesCount}}" total-count="{{TotalRecords}}" search-func="getTasks(page)"></jgpager>

                        </div>
                        <div ng-show="loader.loading" style="position: absolute; left: 50%; bottom: 10%">
                            Loading...
                <img src="../img/ajax-loader.gif" />
                        </div>

                    </div>

                    <div id="TechTaskNonFrozen">

                        <div id="tblTechSeqNonFrozen" class="div-table tableSeqTask">
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number">Sequence#</div>
                                <div class="div-table-col seq-taskid">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate">Due Date</div>
                                <div class="div-table-col seq-notes">Notes</div>
                            </div>

                            <div ng-attr-id="divMasterTask{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in NonFrozenTask" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='2', yellow: Task.Status==='3', lightgray: Task.Status==='8'}" repeat-end="onTechEnd()">

                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number">
                                    <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-seqdesgid="{{Task.SequenceDesignationId}}"><span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="SeqLabel{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span></a><a style="text-decoration: none;" ng-attr-data-taskid="{{Task.TaskId}}" href="javascript:void(0);" class="uplink" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-show="!$first" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" onclick="swapSequence(this,true)">&#9650;</a><a style="text-decoration: none;" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-taskseq="{{Task.Sequence}}" class="downlink" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" href="javascript:void(0);" onclick="swapSequence(this,false)" ng-show="!$last">&#9660;</a>
                                    <div class="handle-counter" ng-class="{hide: Task.TaskId != HighLightTaskId}" ng-attr-id="divSeq{{Task.TaskId}}">
                                        <input type="text" class="textbox hide" ng-attr-data-original-val='{{ Task.Sequence == null && 0 || Task.Sequence}}' ng-attr-data-original-desgid="{{Task.SequenceDesignationId}}" ng-attr-id='txtSeq{{Task.TaskId}}' value="{{  Task.Sequence == null && 0 || Task.Sequence}}" />


                                    </div>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{Task.TaskId}}" ng-class="{hide: Task.TaskId != HighLightTaskId}">
                                            <select class="textbox" ng-attr-data-taskid="{{Task.TaskId}}" onchange="setDropDownChangedData(this)" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus">
                                    <select id="drpStatusSubsequenceTechTaskFrozen" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>
                                        <option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress</option>
                                        <%} %>
                                        <option ng-selected="{{Task.Status == '10'}}" value="10">Finished</option>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />
                                    <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssigned" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                                
                                        </option>
                                    </select>

                                    <%--                                        <select id="ddcbSeqAssigned" style="width: 100px;" multiple  ng-options="item as item.FristName for item in DesignationAssignUsers track by item.Id"  ng-model="DesignationAssignUsersModel" ng-attr-data-AssignedUsers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        </select>--%>
                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate">
                                    <div class="seqapprovalBoxes">
                                        <div style="width: 65%; float: left;">
                                            <input type="checkbox" id="chkngUserTechTaskFrozen" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" id="chkQATechTaskFrozen" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" id="chkAlphaUserTechTaskFrozen" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" id="chkBetaUserTechTaskFrozen" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" id="chkngITLeadTechTaskFrozen" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" id="chkngAdminTechTaskFrozen" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 30%; float: right;">
                                            <input type="checkbox" id="chkngITLeadMasterTechTaskFrozen" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" id="chkngAdminMasterTechTaskFrozen" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>

                                    <div ng-attr-data-taskid="{{Task.TaskId}}" class="seqapprovepopup">

                                        <div id="divTaskAdmin{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">Admin: </div>
                                            <div style="width: 30%;" class="display_inline"></div>
                                            <div ng-class="{hide : StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                            </div>
                                            <div ng-class="{hide : !StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                        </div>
                                        <div id="divTaskITLead{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">ITLead: </div>
                                            <!-- ITLead Hours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <span>
                                                    <label>{{Task.ITLeadHours}}</label>Hour(s)
                                                </span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- ITLead password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>

                                        </div>
                                        <div id="divUser{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">User: </div>
                                            <!-- UserHours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <span>
                                                    <label>{{Task.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- User password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                            </div>

                        </div>






                        <div class="text-center">
                            <jgpager page="{{Techpage}}" pages-count="{{TechpagesCount}}" total-count="{{TechTotalRecords}}" search-func="getTechTasks(page)"></jgpager>
                        </div>


                        <%--  <!-- UI-Grid Starts Here -->

                            <div id="divUIGrid" ng-controller="UiGridController">
                                <div ui-grid="gridOptions" ui-grid-expandable class="grid"></div>
                            </div>

                            <!-- UI-Grid Ends here -->--%>
                    </div>


                </div>


            </div>
        </div>

        <!-- -------------------- End DP -------------------  -->

        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        <div id="taskSequence" ng-controller="TaskSequenceSearchController">
            <div class="loading" ng-show="loading === true"></div>


            <%if (IsSuperUser)
                { %>
            <table style="width: 100%" id="tableFilter" runat="server" class="tableFilter">
                <tr>
                    <td colspan="6" style="padding: 0px !important;">
                        <h2 class="itdashtitle">In Progress, Assigned-Requested</h2>
                    </td>
                </tr>
                <tr style="background-color: #000; color: white; font-weight: bold; text-align: center;">

                    <td>
                        <span id="lblDesignation">Designation</span></td>
                    <td>
                        <span id="lblUserStatus">User & Task Status</span><span style="color: red">*</span></td>
                    <td>
                        <span id="lblAddedBy">Users</span></td>
                    <td style="width: 250px">
                        <span id="lblSourceH">Saved Report</span></td>
                    <td style="width: 380px">
                        <span id="Label2">Select Period</span>
                    </td>
                    <td>Search</td>
                </tr>
                <tr>
                    <td>

                        <select data-placeholder="Select Designation" class="chosen-dropDown" multiple style="width: 200px;" id="ddlDesignationSeq">
                            <option selected value="">All</option>
                            <option value="1">Admin</option>
                            <option value="2">Jr. Sales</option>
                            <option value="3">Jr Project Manager</option>
                            <option value="4">Office Manager</option>
                            <option value="5">Recruiter</option>
                            <option value="6">Sales Manager</option>
                            <option value="7">Sr. Sales</option>
                            <option value="8">IT - Network Admin</option>
                            <option value="9">IT - Jr .Net Developer</option>
                            <option value="10">IT - Sr .Net Developer</option>
                            <option value="11">IT - Android Developer</option>
                            <option value="12">IT - Sr. PHP Developer</option>
                            <option value="13">IT – JR SEO/Backlinking/Content</option>
                            <option value="14">Installer - Helper</option>
                            <option value="15">Installer - Journeyman</option>
                            <option value="16">Installer - Mechanic</option>
                            <option value="17">Installer - Lead mechanic</option>
                            <option value="18">Installer - Foreman</option>
                            <option value="19">Commercial Only</option>
                            <option value="20">SubContractor</option>
                            <option value="22">Admin-Sales</option>
                            <option value="23">Admin Recruiter</option>
                            <option value="24">IT - Senior QA</option>
                            <option value="25">IT - Junior QA</option>
                            <option value="26">IT - Jr. PHP Developer</option>
                            <option value="27">IT – Sr SEO Developer</option>
                        </select>
                    </td>
                    <td>
                        <select data-placeholder="Select Designation" class="chosen-dropDownStatus" multiple style="width: 200px;" id="ddlUserStatus">

                            <option selected value="A0">All</option>

                            <optgroup label="User Status">
                                <option value="U1">Active</option>
                                <option value="U6">Offer Made</option>
                                <option value="U5">Interview Date</option>
                            </optgroup>
                            <optgroup label="Task Status">
                                <option value="T4">In Progress</option>
                                <%--<option value="T2">Request</option>--%>
                                <option value="T3">Request-Assigned</option>
                                <%--<option value="T1">Open</option>--%>
                                <%--<option value="T8">Specs In Progress-NOT OPEN</option>--%>
                                <option value="T11">Test Commit</option>
                                <option value="T12">Live Commit</option>
                                <option value="T7">Closed</option>
                                <option value="T14">Billed</option>
                                <option value="T9">Deleted</option>
                            </optgroup>
                        </select>
                    </td>
                    <td>
                        <select id="ddlSelectUserInProTask" data-placeholder="Select Users" multiple style="width: 200px;" class="chosen-select-users">
                            <option selected value="">All</option>
                        </select><span id="lblLoading" style="display: none">Loading...</span>
                    </td>
                    <td></td>
                    <td style="text-align: left; text-wrap: avoid; padding: 0px">
                        <div style="float: left; width: 57%;">
                            <input class="chkAllDates" name="chkAllDates" type="checkbox"><label for="chkAllDates">All</label>
                            <input class="chkOneYear" name="chkOneYear" type="checkbox"><label for="chkOneYear">1 year</label>
                            <input class="chkThreeMonth" name="chkThreeMonth" type="checkbox"><label for="chkThreeMonth"> Quarter (3 months)</label>
                            <br />
                            <input class="chkOneMonth" name="chkOneMonth" type="checkbox"><label for="chkOneMonth"> 1 month</label>
                            <input class="chkTwoWks" name="chkTwoWks" type="checkbox"><label for="chkTwoWks"> 2 weeks (pay period!)</label>
                        </div>

                        <div>
                            <span id="Label3">From :*
                            <asp:TextBox ID="txtfrmdate" runat="server" TabIndex="2" CssClass="dateFrom"
                                onkeypress="return false" MaxLength="10"
                                Style="width: 80px;"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtendFromDate" runat="server" TargetControlID="txtfrmdate">
                                </cc1:CalendarExtender>
                                <br />
                            </span>

                            <span id="Label4">To :*
                            <asp:TextBox ID="txtTodate" CssClass="dateTo" onkeypress="return false"
                                MaxLength="10" runat="server" TabIndex="3"
                                Style="width: 80px; margin-left: 16px;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtTodate">
                                </cc1:CalendarExtender>
                            </span>

                            <span id="requirefrmdate" style="color: Red; visibility: hidden;">Select From date</span><span id="Requiretodate" style="color: Red; visibility: hidden;"> Select To date</span>
                        </div>
                    </td>
                    <td>
                        <input id="txtSearchUser" class="textbox ui-autocomplete-input" maxlength="15" placeholder="search users" type="text" />
                    </td>
                </tr>
            </table>
            <%}
                else
                { %>

            <table style="width: 100%" id="tableFilterUser" runat="server" class="tableFilter">
                <tr>
                    <td colspan="6" style="padding: 0px !important;">
                        <h2 class="itdashtitle">In Progress, Assigned-Requested</h2>
                    </td>
                </tr>
                <tr style="background-color: #000; color: white; font-weight: bold; text-align: center;">
                    <td style="width: 34%">
                        <span>Saved Report</span></td>
                    <td style="width: 33%">
                        <span>Select Period</span>
                    </td>
                    <td style="width: 33%">Search</td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: left; text-wrap: avoid; padding: 0px">
                        <div style="float: left; width: 57%;">
                            <input class="chkAllDates" name="chkAllDates" type="checkbox"><label for="chkAllDates">All</label>
                            <input class="chkOneYear" name="chkOneYear" type="checkbox"><label for="chkOneYear">1 year</label>
                            <input class="chkThreeMonth" name="chkThreeMonth" type="checkbox"><label for="chkThreeMonth"> Quarter (3 months)</label>
                            <br />
                            <input class="chkOneMonth" name="chkOneMonth" type="checkbox"><label for="chkOneMonth"> 1 month</label>
                            <input class="chkTwoWks" name="chkTwoWks" type="checkbox"><label for="chkTwoWks"> 2 weeks (pay period!)</label>
                        </div>

                        <div>
                            <span>From :*
                            <asp:TextBox ID="TextBox1" runat="server" TabIndex="2" CssClass="dateFrom"
                                onkeypress="return false" MaxLength="10"
                                Style="width: 80px;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
                                </cc1:CalendarExtender>
                                <br />
                            </span>

                            <span>To :*
                            <asp:TextBox ID="TextBox2" CssClass="dateTo" onkeypress="return false"
                                MaxLength="10" runat="server" TabIndex="3"
                                Style="width: 80px; margin-left: 16px;"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TextBox2">
                                </cc1:CalendarExtender>
                            </span>

                            <span id="requirefrmdate" style="color: Red; visibility: hidden;">Select From date</span><span id="Requiretodate" style="color: Red; visibility: hidden;"> Select To date</span>
                        </div>
                    </td>
                    <td>
                        <input id="txtSearchUser" class="textbox ui-autocomplete-input" maxlength="15" placeholder="search users" type="text" />
                    </td>
                </tr>
            </table>

            <%} %>
            <h2 class="itdashtitle">In Progress, Assigned-Requested</h2>
            <%
                if (TaskListView)
                {%>

            <!--Top Grid Records Starts-->
            <div id="taskSequenceTabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                <div id="StaffTask">
                    <div id="tblStaffSeq" class="div-table tableSeqTask">
                        <div>
                            <div style="float: left; padding-top: 10px; margin-right: 1.7%; /*margin-bottom: -40px; */">
                                <span id="lblFrom">{{pageFrom}}</span>&nbsp;<span id="ContentPlaceHolder1_Label5">to</span>&nbsp;
                            <span id="lblTo" style="color: #19ea19">{{pageTo}}</span>
                                <span id="lblof">of</span>
                                <span id="lblCount" style="color: red;">{{pageOf}}</span>
                                <span id="lblselectedchk" style="font-weight: bold;"></span>
                                <img src="/img/refresh.png" class="refresh" id="refreshInProgTasks">
                            </div>
                            <div style="width:80%; max-height: 200px; overflow: auto; float: right; margin-top: 20px;">
                                <div id="accordion">
                                    <h2>&nbsp;<strong>How to commit your work</strong></h2>
                                    <div>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal">
                                            <br />
                                            <span style="font-size: 10pt;">Dear User,
                                        In order to commit your work, You will need to complete your task assigned after completing and performing proper QA, Commit your Task on Test site.</span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt;">To complete your task, you will need Environment in your local machine as described below.</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt;">Please follow below steps:</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">1) Please make sure that you have following software installed:<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">a) Microsoft Visual Studio 2015 or later<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">b) Microsoft SQL Server 2014 or later<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">c) Download and Install Git for windows from this <a href="https://git-scm.com/download/win" target="_blank">link</a>.&nbsp;</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">d) Download and Install&nbsp;</span><span style="font-size: 13.3333px;">Source Tree for windows from this <a href="https://www.sourcetreeapp.com/" target="_blank">link</a></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal">
                                            <span style="font-size: 10pt; font-family: verdana, sans-serif;">
                                                <br />
                                            </span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">2) Download &amp; Setup source code from Our GitHub repository.<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">To do that below are the steps:<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">a)&nbsp;<o:p /></span><span style="font-size: 13.3333px;">Clone the&nbsp;</span><a href="https://github.com/jmgrove2016/JGInterview" target="_blank" style="font-size: 13.3333px;"><span style="color: blue;">Interview Repository</span></a><span style="font-size: 13.3333px;">.&nbsp;If you are new to using Source Tree with Github, Watch our help video from&nbsp;</span><a href="http://web.jmgrovebuildingsupply.com/Tutorials/SourceTree/GithubRepositorySetup.mp4" target="_blank" style="font-size: 13.3333px;">here</a><span style="font-size: 13.3333px;">.&nbsp;</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 13.3333px;">&nbsp; &nbsp; &nbsp; &nbsp;<span style="color: #ff0000;">Note:</span>&nbsp;</span><span style="font-size: 8pt; color: #ff0000;">In help Video, We have taken </span><span style="font-size: 8pt; font-weight: bold; color: #ff0000;">JGProspectLive</span><span style="font-size: 8pt; color: #ff0000;"> Repository example.</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt;">b) Provide your Valid Github account while setting up code into your local system, which you have given at time of Accepting Technical Task from </span>Aptitude<span style="font-size: 10pt;">&nbsp;Success popup(Access to your github username you entered into success popup&nbsp;</span><span style="font-size: 13.3333px;">has already given&nbsp;</span><span style="font-size: 10pt;">&nbsp;automatically to work on our repository on github). Refer this </span><a href="http://web.jmgrovebuildingsupply.com/Resources/Help-Images/Success-Popup.png" target="_blank" style="font-size: 10pt;">image</a>&nbsp;<span style="font-size: 10pt;">for more clear understanding.</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;">
                                            <span style="font-size: 10pt; font-family: verdana, sans-serif;">
                                                <o:p />
                                            </span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">&nbsp;<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">3) Setup the development environment.</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt;">a) Create your own branch on our repository to work on your tech task before you start coding on your assigned&nbsp;</span>Tech Task<span style="font-size: 10pt;">.&nbsp;</span><span style="font-size: 13.3333px;">If you are new to work with Github and don't know how to create your own branch, Watch our help video from&nbsp;</span><a href="http://web.jmgrovebuildingsupply.com/Tutorials/SourceTree/HowtoCreateOwnBranch.mp4" target="_blank" style="font-size: 13.3333px;">here</a><span style="font-size: 13.3333px;">.</span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;">
                                            <span style="font-size: 10pt; font-family: verdana, sans-serif;">b) Please use connection string from web.config file of web project to connect to database.<br />
                                                <br />
                                            </span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; margin-left: 40px;"><span style="font-size: 10pt; font-family: verdana, sans-serif;">c) Use any user from database to login into system in your local development environment. Don't try to use your own username you are using in live website because both environment are different and your username created in live is not in local environment.<o:p /></span></p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">&nbsp;<o:p /></span></p>
                                        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal"><span style="font-size: 10pt; font-family: verdana, sans-serif;">4) Log back into to&nbsp;<a href="http://web.jmgrovebuildingsupply.com/" target="_blank"><span style="color: blue">web.jmgrovebuildingsupply.com</span></a>, it will take you to&nbsp; IT dashboard page where you can see task assigned to you.&nbsp;</span></p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;">a) From ITDashborad, Click on TaskLink and New Task Detail page will be open, and Task Assigned to you will be Highlighted and Blinking in Yellow. Click <a href="http://web.jmgrovebuildingsupply.com/Resources/Help-Images/ITDashboard-InterviewUser.png" target="_blank">Here</a>&nbsp;for more detail image.</p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;">b) Read Task Requirements and Instructions Carefully before you jump over to code.</p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;">c) Keep track of your database related changes into separate SQL file into Your Name Folder created under Database Script folder into Solution.&nbsp;<span style="font-size: 13.3333px;">Click&nbsp;</span><a href="http://web.jmgrovebuildingsupply.com/Resources/Help-Images/Database-Files-Interview.png" target="_blank" style="font-size: 13.3333px;">Here</a><span style="font-size: 13.3333px;">&nbsp;for more detail image.</span></p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;">d) After completing Task, <span style="color: #ff0000;">Make sure you have tested it thoroughly on your local environment by comparing word to word of Task Description with your completed task. Incomplete/Poorly Tested Task submission increase chances of your rejection for position you have applied.</span></p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;"></p>
                                        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal">
                                            <br />
                                        </p>
                                        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal">5) Once You are satisfied with your code, Commit and Push it to remote repository. If you don't know how to commit on GitHub remote repository using Source Tree click on our help video <a href="http://web.jmgrovebuildingsupply.com/Tutorials/SourceTree/HowtoCommitChangesToGithub.mp4" target="_blank">Here</a>.</p>
                                        <p class="MsoNormal" style="line-height: normal; margin-left: 40px;">
                                            <br />
                                        </p>
                                        <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal">6)&nbsp;<span style="font-size: 13.3333px;">Please have all above prerequisites and your task completed, committed and ready for your interview #date# &amp; #time# (EST Time zone) with #manager#.</span></p>
                                        <p class="MsoNormal" style="font-size: 13.3333px; line-height: normal; margin-left: 40px;">
                                            <br />
                                            a)&nbsp;<b style="font-size: 13.3333px;"><span style="font-size: 10pt;">&nbsp;</span></b><span style="font-size: 10pt; color: #ff0000;">your commit message must contain, TaskID# , Your Full Name and Date &amp; Time stamp when you are&nbsp;committing&nbsp;code and notify the staffing coordinator that its been completed.</span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal">
                                            <span style="font-size: 10pt; font-family: verdana, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">
                                                <br />
                                            </span>
                                        </p>
                                        <p class="MsoNormal" style="margin-bottom: 0in; margin-bottom: .0001pt; line-height: normal">
                                            <span style="font-size: 10pt; font-family: verdana, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">NOTE: Please have a look at advanced concepts listed here,&nbsp;</span><span style="font-size: 12.0pt; font-family: times new roman,serif; mso-fareast-font-family: times new roman"><a href="https://docs.microsoft.com/en-gb/aspnet/web-forms/" target="_self"><span style="font-size: 10.0pt; font-family: verdana,sans-serif; color: blue">https://docs.microsoft.com/en-gb/aspnet/web-forms/</span></a></span><span style="font-size: 10pt; font-family: verdana, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp;in order to work faster and efficient with software currently we have.</span><span style="font-size: 10pt; font-family: verdana, sans-serif;"><br />
                                                <br />
                                                <!--[if !supportLineBreakNewLine]-->
                                                <br />
                                                <!--[endif]-->
                                            </span><span style="font-size: 12.0pt; font-family: times new roman,serif; mso-fareast-font-family: times new roman">
                                                <o:p />
                                            </span>
                                        </p>
                                       
                                    </div>
                                </div>
                            </div>
                            <div ng-show="loader.loading" style="align-content: center; width: 90%; text-align: center;" class="">
                                <img src="../img/ajax-loader.gif" style="vertical-align: middle">Please Wait...
                            </div>
                            <div style="clear: both"></div>
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number-fixed">Sequence#</div>
                                <div class="div-table-col seq-taskid-fixed">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle-fixed">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus-fixed">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate-fixed" style="width: 7% !important">
                                    Total Hours<br />
                                    Total $
                                </div>
                                <div class="div-table-col seq-notes-fixed" style="width: 31% !important">Notes</div>
                            </div>
                            <div class="noData" id="noDataIA">No Records Found!</div>
                            <!-- NG Repeat Div starts -->
                            <div ng-attr-id="divMasterTask{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in Tasks" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='3'}" repeat-end="onStaffEnd()">
                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number-fixed">
                                    <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-seqdesgid="{{Task.SequenceDesignationId}}"><span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="SeqLabel{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span></a>

                                    <a id="seqArrowUp" runat="server" style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{Task.TaskId}}" href="javascript:void(0);" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-hide="{{Task.TaskId == BlinkTaskId}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" onclick="swapSequence(this,true)">&#9650;</a>
                                    <a id="seqArrowDown" runat="server" style="text-decoration: none;" ng-class="{hide: Task.Sequence == null || 0}" ng-attr-data-taskid="{{Task.TaskId}}" ng-attr-data-taskseq="{{Task.Sequence}}" ng-attr-data-taskdesg="{{Task.SequenceDesignationId}}" href="javascript:void(0);" onclick="swapSequence(this,false)" ng-show="!$last">&#9660;</a>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid-fixed">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext context-menu" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}                                        
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle-fixed">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus-fixed chosen-div">
                                    <select id="drpStatusSubsequence{{Task.TaskId}}" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <%--<option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>--%>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Request-Assigned</option>
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <%--<option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>--%>
                                        <%--<option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>  --%>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress-NOT OPEN</option>
                                        <%} %>

                                        <%--<option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>--%>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test Commit</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live Commit</option>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />

                                    <select class="ddlAssignedUsers" <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssignedStaff{{Task.TaskId}}" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                        </option>
                                    </select>




                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate-fixed">
                                    <div class="seqapprovalBoxes" id="SeqApprovalDiv{{Task.TaskId}}"
                                        data-adminstatusupdateddate="{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}"
                                        data-adminstatusupdatedtime="{{ Task.AdminStatusUpdated | date:'shortTime' }}"
                                        data-adminstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }}"
                                        data-adminstatusupdated="{{Task.AdminStatusUpdated}}"
                                        data-admindisplayname="{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}"
                                        data-adminstatususerid="{{Task.AdminUserId}}"
                                        data-leadstatusupdateddate="{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}"
                                        data-leadstatusupdatedtime="{{ Task.TechLeadStatusUpdated | date:'shortTime' }}"
                                        data-leadstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.TechLeadStatusUpdated) ? '' : '(EST)' }}"
                                        data-leadstatusupdated="{{Task.ITLeadHours}}"
                                        data-leadhours="{{Task.ITLeadHours}}"
                                        data-leaddisplayname="{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}"
                                        data-leaduserid="{{Task.TechLeadUserId}}"
                                        data-userstatusupdateddate="{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}"
                                        data-userstatusupdatedtime="{{ Task.OtherUserStatusUpdated | date:'shortTime' }}"
                                        data-userstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.OtherUserStatusUpdated) ? '' : '(EST)' }}"
                                        data-userstatusupdated="{{Task.UserHours}}"
                                        data-userhours="{{Task.UserHours}}"
                                        data-userdisplayname="{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}"
                                        data-useruserid="{{Task.OtherUserId}}">
                                        <div style="width: 55%; float: left;">
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngUserMaster{{Task.TaskId}}" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkQAMaster{{Task.TaskId}}" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkAlphaUserMaster{{Task.TaskId}}" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkBetaUserMaster{{Task.TaskId}}" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLead{{Task.TaskId}}" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdmin{{Task.TaskId}}" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 42%; float: right;">
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadMaster{{Task.TaskId}}" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminMaster{{Task.TaskId}}" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>


                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes-fixed-top">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                                <!-- Nested row starts -->

                                <div class="div-table-nested" ng-class="{hide : StringIsNullOrEmpty(Task.SubSeqTasks)}">

                                    <!-- Body section starts -->
                                    <div class="div-table-row" ng-repeat="TechTask in correctDataforAngular(Task.SubSeqTasks)" ng-class="{orange : TechTask.Status==='4', yellow: TechTask.Status==='3'}">
                                        <!-- Sequence# starts -->
                                        <div class="div-table-col seq-number-fixed">
                                            <a style="text-decoration: none;" ng-show="!$first" ng-attr-data-taskid="{{TechTask.TaskId}}" href="javascript:void(0);" class="uplink" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" onclick="swapSubSequence(this,true)">&#9650;</a><a style="text-decoration: none;" ng-class="{hide: TechTask.Sequence == null || 0}" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-taskseq="{{TechTask.SubSequence}}" class="downlink" ng-attr-data-taskdesg="{{TechTask.SequenceDesignationId}}" href="javascript:void(0);" ng-show="!$last" onclick="swapSubSequence(this,false)">&#9660;</a>
                                            <a ng-attr-id="autoClick{{Task.TaskId}}" href="javascript:void(0);" class="badge-hyperlink autoclickSeqEdit" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-attr-data-seqdesgid="{{TechTask.SequenceDesignationId}}"><span class="badge badge-error badge-xstext">
                                                <label ng-attr-id="SeqLabel{{TechTask.TaskId}}">{{getSequenceDisplayText(!TechTask.Sequence?"N.A.":TechTask.Sequence + " (" + toRoman(TechTask.SubSequence)+ ")",TechTask.SequenceDesignationId,TechTask.IsTechTask == "false" ? "SS" : "TT")}}</label></span></a>
                                            <div class="handle-counter" ng-class="{hide: TechTask.TaskId != HighLightTaskId}" ng-attr-id="divSeq{{TechTask.TaskId}}">
                                                <input type="text" class="textbox hide" ng-attr-data-original-val='{{ TechTask.Sequence == null && 0 || TechTask.Sequence}}' ng-attr-data-original-desgid="{{TechTask.SequenceDesignationId}}" ng-attr-id='txtSeq{{TechTask.TaskId}}' value="{{  TechTask.Sequence == null && 0 || TechTask.Sequence}}" />


                                            </div>
                                        </div>
                                        <!-- Sequence# ends -->

                                        <!-- ID# and Designation starts -->
                                        <div class="div-table-col seq-taskid-fixed">
                                            <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{TechTask.MainParentId}}&hstid={{TechTask.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{TechTask.InstallId}}" parentdata-highlighter="{{TechTask.MainParentId}}" data-highlighter="{{TechTask.TaskId}}" class="bluetext context-menu" target="_blank">{{ TechTask.InstallId }}</a><br />
                                            {{getDesignationString(TechTask.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{TechTask.TaskId}}" ng-class="{hide: TechTask.TaskId != HighLightTaskId}">
                                            <select class="textbox hide" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                        </div>
                                        <!-- ID# and Designation ends -->

                                        <!-- Parent Task & SubTask Title starts -->
                                        <div class="div-table-col seq-tasktitle-fixed">
                                            {{ TechTask.ParentTaskTitle }}
                                        <br />
                                            {{ TechTask.Title }}
                                        </div>
                                        <!-- Parent Task & SubTask Title ends -->

                                        <!-- Status & Assigned To starts -->
                                        <div class="div-table-col seq-taskstatus-fixed chosen-div">
                                            <select id="drpStatusSubsequenceNested{{TechTask.TaskId}}" onchange="changeTaskStatusClosed(this);" data-highlighter="{{TechTask.TaskId}}">

                                                <option ng-selected="{{TechTask.Status == '4'}}" value="4">InProgress</option>
                                                <%--<option ng-selected="{{TechTask.Status == '2'}}" style="color: red" value="2">Requested</option>--%>
                                                <option ng-selected="{{TechTask.Status == '3'}}" style="color: lawngreen" value="3">Request-Assigned</option>
                                                <option ng-selected="{{TechTask.Status == '1'}}" value="1">Open</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <%--<option ng-selected="{{TechTask.Status == '5'}}" value="5">Pending</option>--%>
                                                <%--<option ng-selected="{{TechTask.Status == '6'}}" value="6">ReOpened</option>  --%>
                                                <option ng-selected="{{TechTask.Status == '8'}}" value="8">SpecsInProgress-NOT OPEN</option>
                                                <%} %>

                                                <%--<option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>--%>
                                                <option ng-selected="{{TechTask.Status == '11'}}" value="11">Test Commit</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '12'}}" value="12">Live Commit</option>
                                                <option ng-selected="{{TechTask.Status == '7'}}" value="7">Closed</option>
                                                <option ng-selected="{{TechTask.Status == '14'}}" value="14">Billed</option>
                                                <option ng-selected="{{TechTask.Status == '9'}}" value="9">Deleted</option>
                                                <%} %>
                                            </select>
                                            <br />
                                            <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssignedIA{{TechTask.TaskId}}" style="width: 100%;" multiple ng-attr-data-assignedusers="{{TechTask.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{TechTask.TaskId}}" data-taskstatus="{{TechTask.Status}}">
                                                <option
                                                    ng-repeat="item in DesignationAssignUsers"
                                                    value="{{item.Id}}"
                                                    label="{{item.FristName}}"
                                                    class="{{item.CssClass}}">{{item.FristName}}
                                                
                                                </option>
                                            </select>
                                        </div>
                                        <!-- Status & Assigned To ends -->
                                        <div class="div-table-col seq-taskduedate-fixed">
                                            <div class="seqapprovalBoxes" id="SeqApprovalDiv{{TechTask.TaskId}}"
                                                data-adminstatusupdateddate="{{ TechTask.AdminStatusUpdated | date:'M/d/yyyy' }}"
                                                data-adminstatusupdatedtime="{{ TechTask.AdminStatusUpdated | date:'shortTime' }}"
                                                data-adminstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.AdminStatusUpdated) ? '' : '(EST)' }}"
                                                data-adminstatusupdated="{{TechTask.AdminStatusUpdated}}"
                                                data-admindisplayname="{{StringIsNullOrEmpty(TechTask.AdminUserInstallId)? TechTask.AdminUserId : TechTask.AdminUserInstallId}} - {{TechTask.AdminUserFirstName}} {{TechTask.AdminUserLastName}}"
                                                data-adminstatususerid="{{TechTask.AdminUserId}}"
                                                data-leadstatusupdateddate="{{ TechTask.TechLeadStatusUpdated | date:'M/d/yyyy' }}"
                                                data-leadstatusupdatedtime="{{ TechTask.TechLeadStatusUpdated | date:'shortTime' }}"
                                                data-leadstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.TechLeadStatusUpdated) ? '' : '(EST)' }}"
                                                data-leadstatusupdated="{{TechTask.ITLeadHours}}"
                                                data-leadhours="{{TechTask.ITLeadHours}}"
                                                data-leaddisplayname="{{StringIsNullOrEmpty(TechTask.TechLeadUserInstallId)? TechTask.TechLeadUserId : TechTask.TechLeadUserInstallId}} - {{TechTask.TechLeadUserFirstName}} {{TechTask.TechLeadUserLastName}}"
                                                data-leaduserid="{{TechTask.TechLeadUserId}}"
                                                data-userstatusupdateddate="{{ TechTask.OtherUserStatusUpdated | date:'M/d/yyyy' }}"
                                                data-userstatusupdatedtime="{{ TechTask.OtherUserStatusUpdated | date:'shortTime' }}"
                                                data-userstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.OtherUserStatusUpdated) ? '' : '(EST)' }}"
                                                data-userstatusupdated="{{TechTask.UserHours}}"
                                                data-userhours="{{TechTask.UserHours}}"
                                                data-userdisplayname="{{StringIsNullOrEmpty(TechTask.OtherUserInstallId)? TechTask.OtherUserId : TechTask.OtherUserInstallId}} - {{TechTask.OtherUserFirstName}} {{TechTask.OtherUserLastName}}"
                                                data-useruserid="{{TechTask.OtherUserId}}">
                                                <div style="width: 55%; float: left;">
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngUserNested{{TechTask.TaskId}}" ng-checked="{{TechTask.OtherUserStatus}}" ng-disabled="{{TechTask.OtherUserStatus}}" class="fz fz-user" title="User" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkQANested{{TechTask.TaskId}}" class="fz fz-QA" title="QA" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkAlphaUserNested{{TechTask.TaskId}}" class="fz fz-Alpha" title="AlphaUser" />
                                                    <br />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkBetaUserNested{{TechTask.TaskId}}" class="fz fz-Beta" title="BetaUser" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadNested{{TechTask.TaskId}}" ng-checked="{{TechTask.TechLeadStatus}}" ng-disabled="{{TechTask.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminNested{{TechTask.TaskId}}" ng-checked="{{TechTask.AdminStatus}}" ng-disabled="{{TechTask.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                                </div>
                                                <div style="width: 43%; float: right;">
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadMasterNested{{TechTask.TaskId}}" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminMasterNested{{TechTask.TaskId}}" class="fz fz-admin largecheckbox" title="Admin" />
                                                </div>
                                            </div>


                                        </div>
                                        <div class="div-table-col seq-notes-fixed-top">
                                            Notes
                                        </div>
                                    </div>
                                    <!-- Body section ends -->

                                </div>

                                <!-- Nested row ends -->

                            </div>
                        </div>



                    </div>

                </div>
                <!--Top Grid Records Ends-->


                <!--Top Grid Pager Starts-->
                <div class="text-center" style="float: right">
                    <jgpager page="{{page}}" pages-count="{{pagesCount}}" total-count="{{TotalRecords}}" search-func="getTasks(page)"></jgpager>
                </div>
                <!--Top Grid Pager Ends-->


                <!--Bottom Grid Caption Starts-->
                <div>
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="200px" align="left">
                                    <h2 class="itdashtitle">Commits, Closed-Billed</h2>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td style="text-align: right"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--Bottom Grid Caption Ends-->

                <!--Bottom Grid Record Starts-->
                <div id="taskHolder" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <div id="taskSubHolder">
                        <div id="divClosedTask" class="div-table tableSeqTask">
                            <div style="float: left; padding-top: 10px; margin-right: 1.7%; /*margin-bottom: -40px; */">
                                <span id="lblFromClosedTask">{{pageFromCT}}</span>&nbsp;<span>to</span>&nbsp;
                            <span id="lblToClosedTask" style="color: #19ea19">{{pageToCT}}</span>
                                <span id="lblofClosedTask">of</span>
                                <span id="lblCountClosedTask" style="color: red;">{{pageOfCT}}</span>
                                <span id="lblselectedchkClosedTask" style="font-weight: bold;"></span>
                                <img src="/img/refresh.png" class="refresh" id="refreshClosedTask">
                            </div>
                            <div ng-show="loaderClosedTask.loading" style="align-content: center; width: 90%; text-align: center;" class="">
                                <img src="../img/ajax-loader.gif" style="vertical-align: middle">Please Wait...
                            </div>
                            <div style="clear: both"></div>

                            <div class="div-table-row-header">
                                <div class="div-table-col seq-taskid-fixed">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle-fixed">
                                    Parent Task
                                        <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus-fixed">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate-fixed">
                                    Total Hours<br />
                                    Total $
                                </div>
                                <div class="div-table-col seq-notes-fixed">Notes</div>
                            </div>
                            <div class="noData" id="noDataCT">No Records Found!</div>
                            <!-- NG Repeat Div starts -->
                            <div ng-attr-id="divMasterTask{{Task.TaskId}}" class="div-table-row" data-ng-repeat="Task in ClosedTask" ng-class="{red: Task.Status==='12', black : Task.Status==='7', green: Task.Status==='14', white: Task.Status==='11'}" repeat-end="onStaffEnd()">

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid-fixed">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext context-menu" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}                                        
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle-fixed">
                                    <span class="parent-task-title">{{ Task.ParentTaskTitle }}</span>
                                    <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus-fixed chosen-div">
                                    <select id="drpStatusSubsequenceCT{{Task.TaskId}}" onchange="changeTaskStatusClosed(this);" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress-Frozen</option>
                                        <%--<option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>--%>
                                        <option ng-selected="{{Task.Status == '3'}}" value="3">Request-Assigned</option>
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <%--<option ng-selected="{{Task.Status == '5'}}" value="5">Pending</option>--%>
                                        <%--<option ng-selected="{{Task.Status == '6'}}" value="6">ReOpened</option>  --%>
                                        <option ng-selected="{{Task.Status == '8'}}" value="8">SpecsInProgress-NOT OPEN</option>
                                        <%} %>

                                        <%--<option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>--%>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test Commit</option>

                                        <option ng-selected="{{Task.Status == '12'}}" value="12">Live Commit</option>
                                        <option ng-selected="{{Task.Status == '14'}}" value="14">Billed</option>
                                        <% if (IsSuperUser)
                                            { %>
                                        <option ng-selected="{{Task.Status == '7'}}" value="7">Closed</option>
                                        <option ng-selected="{{Task.Status == '9'}}" value="9">Deleted</option>
                                        <%} %>
                                    </select>
                                    <br />

                                    <select class="ddlAssignedUsers" <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssignedStaffClosedTask{{Task.TaskId}}" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                        </option>
                                    </select>




                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate-fixed" style="margin-top: -10px;">
                                    <span class="hours-col">IT Lead: {{Task.ITLeadHours}}, User: {{Task.UserHours}}</span>
                                    <div class="seqapprovalBoxes" id="SeqApprovalDiv{{Task.TaskId}}"
                                        data-adminstatusupdateddate="{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}"
                                        data-adminstatusupdatedtime="{{ Task.AdminStatusUpdated | date:'shortTime' }}"
                                        data-adminstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }}"
                                        data-adminstatusupdated="{{Task.AdminStatusUpdated}}"
                                        data-admindisplayname="{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}"
                                        data-adminstatususerid="{{Task.AdminUserId}}"
                                        data-leadstatusupdateddate="{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}"
                                        data-leadstatusupdatedtime="{{ Task.TechLeadStatusUpdated | date:'shortTime' }}"
                                        data-leadstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.TechLeadStatusUpdated) ? '' : '(EST)' }}"
                                        data-leadstatusupdated="{{Task.ITLeadHours}}"
                                        data-leadhours="{{Task.ITLeadHours}}"
                                        data-leaddisplayname="{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}"
                                        data-leaduserid="{{Task.TechLeadUserId}}"
                                        data-userstatusupdateddate="{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}"
                                        data-userstatusupdatedtime="{{ Task.OtherUserStatusUpdated | date:'shortTime' }}"
                                        data-userstatusupdatedtimezone="{{StringIsNullOrEmpty(Task.OtherUserStatusUpdated) ? '' : '(EST)' }}"
                                        data-userstatusupdated="{{Task.UserHours}}"
                                        data-userhours="{{Task.UserHours}}"
                                        data-userdisplayname="{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}"
                                        data-useruserid="{{Task.OtherUserId}}">
                                        <div style="width: 55%; float: left;">
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngUserMasterClosedTask{{Task.TaskId}}" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkQAMasterClosedTask{{Task.TaskId}}" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkAlphaUserMasterClosedTask{{Task.TaskId}}" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkBetaUserMasterClosedTask{{Task.TaskId}}" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadClosedTask{{Task.TaskId}}" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminClosedTask{{Task.TaskId}}" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 42%; float: right;">
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadMasterClosedTask{{Task.TaskId}}" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" data-taskid="{{Task.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminMasterClosedTask{{Task.TaskId}}" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>


                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes-fixed">
                                    Notes
                                </div>
                                <!-- Notes ends -->

                                <!-- Nested row starts -->

                                <div class="div-table-nested" ng-class="{hide : StringIsNullOrEmpty(Task.SubSeqTasks)}">

                                    <!-- Body section starts -->
                                    <div class="div-table-row" ng-repeat="TechTask in correctDataforAngular(Task.SubSeqTasks)" ng-class="{red: TechTask.Status==='12', black : TechTask.Status==='7', green: TechTask.Status==='14', white: TechTask.Status==='11'}">

                                        <!-- ID# and Designation starts -->
                                        <div class="div-table-col seq-taskid-fixed">
                                            <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{TechTask.MainParentId}}&hstid={{TechTask.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{TechTask.InstallId}}" parentdata-highlighter="{{TechTask.MainParentId}}" data-highlighter="{{TechTask.TaskId}}" class="bluetext context-menu" target="_blank">{{ TechTask.InstallId }}</a><br />
                                            {{getDesignationString(TechTask.TaskDesignation)}}
                                        <div ng-attr-id="divSeqDesg{{TechTask.TaskId}}" ng-class="{hide: TechTask.TaskId != HighLightTaskId}">
                                            <select class="textbox hide" ng-attr-data-taskid="{{TechTask.TaskId}}" ng-options="item as item.Name for item in ParentTaskDesignations track by item.Id" ng-model="DesignationSelectModel[$index]">
                                            </select>
                                        </div>
                                        </div>
                                        <!-- ID# and Designation ends -->

                                        <!-- Parent Task & SubTask Title starts -->
                                        <div class="div-table-col seq-tasktitle-fixed">
                                            {{ TechTask.ParentTaskTitle }}
                                        <br />
                                            {{ TechTask.Title }}
                                        </div>
                                        <!-- Parent Task & SubTask Title ends -->

                                        <!-- Status & Assigned To starts -->
                                        <div class="div-table-col seq-taskstatus-fixed chosen-div">
                                            <select id="drpStatusSubsequenceNestedClosedTask{{TechTask.TaskId}}" onchange="changeTaskStatusClosed(this);" data-highlighter="{{TechTask.TaskId}}">
                                                <option ng-selected="{{TechTask.Status == '4'}}" value="4">InProgress-Frozen</option>
                                                <%--<option ng-selected="{{TechTask.Status == '2'}}" style="color: red" value="2">Requested</option>--%>
                                                <option ng-selected="{{TechTask.Status == '3'}}" value="3">Request-Assigned</option>
                                                <option ng-selected="{{TechTask.Status == '1'}}" value="1">Open</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <%--<option ng-selected="{{TechTask.Status == '5'}}" value="5">Pending</option>--%>
                                                <%--<option ng-selected="{{TechTask.Status == '6'}}" value="6">ReOpened</option>  --%>
                                                <option ng-selected="{{TechTask.Status == '8'}}" value="8">SpecsInProgress-NOT OPEN</option>
                                                <%} %>

                                                <%--<option ng-selected="{{TechTask.Status == '10'}}" value="10">Finished</option>--%>
                                                <option ng-selected="{{TechTask.Status == '11'}}" value="11">Test Commit</option>

                                                <option ng-selected="{{TechTask.Status == '12'}}" value="12">Live Commit</option>
                                                <% if (IsSuperUser)
                                                    { %>
                                                <option ng-selected="{{TechTask.Status == '7'}}" value="7">Closed</option>
                                                <option ng-selected="{{TechTask.Status == '14'}}" value="14">Billed</option>
                                                <option ng-selected="{{TechTask.Status == '9'}}" value="9">Deleted</option>
                                                <%} %>
                                            </select>
                                            <br />
                                            <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbSeqAssigned{{TechTask.TaskId}}" style="width: 100%;" multiple ng-attr-data-assignedusers="{{TechTask.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" onchange="EditSeqAssignedTaskUsers(this);" data-taskid="{{TechTask.TaskId}}" data-taskstatus="{{TechTask.Status}}">
                                                <option
                                                    ng-repeat="item in DesignationAssignUsers"
                                                    value="{{item.Id}}"
                                                    label="{{item.FristName}}"
                                                    class="{{item.CssClass}}">{{item.FristName}}
                                                
                                                </option>
                                            </select>
                                        </div>
                                        <!-- Status & Assigned To ends -->
                                        <div class="div-table-col seq-taskduedate-fixed">
                                            <span class="hours-col">IT Lead: {{TechTask.ITLeadHours}}, User: {{TechTask.UserHours}}</span>
                                            <div class="seqapprovalBoxes" id="SeqApprovalDiv{{TechTask.TaskId}}"
                                                data-adminstatusupdateddate="{{ TechTask.AdminStatusUpdated | date:'M/d/yyyy' }}"
                                                data-adminstatusupdatedtime="{{ TechTask.AdminStatusUpdated | date:'shortTime' }}"
                                                data-adminstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.AdminStatusUpdated) ? '' : '(EST)' }}"
                                                data-adminstatusupdated="{{TechTask.AdminStatusUpdated}}"
                                                data-admindisplayname="{{StringIsNullOrEmpty(TechTask.AdminUserInstallId)? TechTask.AdminUserId : TechTask.AdminUserInstallId}} - {{TechTask.AdminUserFirstName}} {{TechTask.AdminUserLastName}}"
                                                data-adminstatususerid="{{TechTask.AdminUserId}}"
                                                data-leadstatusupdateddate="{{ TechTask.TechLeadStatusUpdated | date:'M/d/yyyy' }}"
                                                data-leadstatusupdatedtime="{{ TechTask.TechLeadStatusUpdated | date:'shortTime' }}"
                                                data-leadstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.TechLeadStatusUpdated) ? '' : '(EST)' }}"
                                                data-leadstatusupdated="{{TechTask.ITLeadHours}}"
                                                data-leadhours="{{TechTask.ITLeadHours}}"
                                                data-leaddisplayname="{{StringIsNullOrEmpty(TechTask.TechLeadUserInstallId)? TechTask.TechLeadUserId : TechTask.TechLeadUserInstallId}} - {{TechTask.TechLeadUserFirstName}} {{TechTask.TechLeadUserLastName}}"
                                                data-leaduserid="{{TechTask.TechLeadUserId}}"
                                                data-userstatusupdateddate="{{ TechTask.OtherUserStatusUpdated | date:'M/d/yyyy' }}"
                                                data-userstatusupdatedtime="{{ TechTask.OtherUserStatusUpdated | date:'shortTime' }}"
                                                data-userstatusupdatedtimezone="{{StringIsNullOrEmpty(TechTask.OtherUserStatusUpdated) ? '' : '(EST)' }}"
                                                data-userstatusupdated="{{TechTask.UserHours}}"
                                                data-userhours="{{TechTask.UserHours}}"
                                                data-userdisplayname="{{StringIsNullOrEmpty(TechTask.OtherUserInstallId)? TechTask.OtherUserId : TechTask.OtherUserInstallId}} - {{TechTask.OtherUserFirstName}} {{TechTask.OtherUserLastName}}"
                                                data-useruserid="{{TechTask.OtherUserId}}">
                                                <div style="width: 55%; float: left;">
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngUserNestedSubTask{{TechTask.TaskId}}" ng-checked="{{TechTask.OtherUserStatus}}" ng-disabled="{{TechTask.OtherUserStatus}}" class="fz fz-user" title="User" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkQANestedSubTask{{TechTask.TaskId}}" class="fz fz-QA" title="QA" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkAlphaUserNestedSubTask{{TechTask.TaskId}}" class="fz fz-Alpha" title="AlphaUser" />
                                                    <br />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkBetaUserNestedSubTask{{TechTask.TaskId}}" class="fz fz-Beta" title="BetaUser" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadNestedSubTask{{TechTask.TaskId}}" ng-checked="{{TechTask.TechLeadStatus}}" ng-disabled="{{TechTask.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminNestedSubTask{{TechTask.TaskId}}" ng-checked="{{TechTask.AdminStatus}}" ng-disabled="{{TechTask.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                                </div>
                                                <div style="width: 43%; float: right;">
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngITLeadMasterNestedSubTask{{TechTask.TaskId}}" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                                    <input type="checkbox" data-taskid="{{TechTask.TaskId}}" onchange="openSeqApprovalPopup(this)" id="chkngAdminMasterNestedSubTask{{TechTask.TaskId}}" class="fz fz-admin largecheckbox" title="Admin" />
                                                </div>
                                            </div>


                                        </div>
                                        <div class="div-table-col seq-notes-fixed">
                                            Notes
                                        </div>
                                    </div>
                                    <!-- Body section ends -->

                                </div>

                                <!-- Nested row ends -->

                            </div>

                            <!-- Hours Total Row Starts -->
                            <div id="divMasterTaskTotal" class="div-table-row">

                                <div class="div-table-col seq-taskid-fixed ng-binding">
                                </div>
                                <div class="div-table-col seq-tasktitle-fixed ng-binding">
                                </div>
                                <div class="div-table-col seq-taskstatus-fixed chosen-div">
                                </div>
                                <div class="div-table-col seq-taskduedate-fixed" style="margin-top: -10px; width: 200px;">
                                    <span class="hours-col ng-binding"><b>(Total) IT Lead: {{TotalHoursITLead}}, User: {{TotalHoursUsers}}</b></span>
                                </div>
                            </div>
                            <!-- Hours Total Row Ends -->
                        </div>



                    </div>

                </div>
                <!--Bottom Grid Record Ends-->

                <!--Bottom Grid Pager Starts-->
                <div class="text-center" style="float: right">
                    <jgpager page="{{pageCT}}" pages-count="{{pagesCountCT}}" total-count="{{TotalRecordsCT}}" search-func="getClosedTasks(page)"></jgpager>
                </div>
                <!--Bottom Grid Pager Ends-->

                <!-- Interview Date popup starts -->
                <div id="HighLightedTask" class="modal hide">
                    <%--<iframe id="ifrmTask" style="height: 100%; width: 100%; overflow: auto;"></iframe>--%>

                    <div id="examPassed">
                        <span id="InterviewDateHeader">Dear Applicant,
                <label id="ltlApplicantName"></label>
                            &nbsp;-&nbsp;<label id="ltlApplicantId"></label>, Thank you for applying to JMGrove Construction
                <label id="ltlDesignation"></label>
                            &nbsp; position. You have been selected for technical interview. We will be interviewing for your technical ability and will be requesting a sample of your work for technical analysis. Please have the following points below ready. In order to appear in the technical interview please follow below steps:

                        </span>

                        <br />
                        <br />
                        <div id="tblIntTechSeq" class="div-table tableSeqTask">
                            <div class="div-table-row-header">
                                <div class="div-table-col seq-number">Sequence#</div>
                                <div class="div-table-col seq-taskid">
                                    ID#<div>Designation</div>
                                </div>
                                <div class="div-table-col seq-tasktitle">
                                    Parent Task
                                            <div>SubTask Title</div>
                                </div>
                                <div class="div-table-col seq-taskstatus">
                                    Status<div>Assigned To</div>
                                </div>
                                <div class="div-table-col seq-taskduedate">Due Date</div>
                                <div class="div-table-col seq-notes">Notes</div>
                            </div>
                            <div ng-attr-id="divIntPopupTask" class="div-table-row" data-ng-repeat="Task in Tasks" ng-class="{orange : Task.Status==='4', yellow: Task.Status==='2', yellow: Task.Status==='3', lightgray: Task.Status==='8'}" repeat-end="onStaffEnd()">
                                <!-- Sequence# starts -->
                                <div class="div-table-col seq-number">
                                    <span class="badge badge-success badge-xstext">
                                        <label ng-attr-id="IntSeqLabel{{Task.TaskId}}">{{getSequenceDisplayText(!Task.Sequence?"N.A.":Task.Sequence,Task.SequenceDesignationId,Task.IsTechTask === "false" ? "SS" : "TT")}}</label></span>
                                </div>
                                <!-- Sequence# ends -->

                                <!-- ID# and Designation starts -->
                                <div class="div-table-col seq-taskid">
                                    <a ng-href="../Sr_App/TaskGenerator.aspx?TaskId={{Task.MainParentId}}&hstid={{Task.TaskId}}" oncontextmenu="openCopyBox(this);return false;" data-installid="{{Task.InstallId}}" parentdata-highlighter="{{Task.MainParentId}}" data-highlighter="{{Task.TaskId}}" class="bluetext context-menu" target="_blank">{{ Task.InstallId }}</a><br />
                                    {{getDesignationString(Task.TaskDesignation)}}                                        
                                </div>
                                <!-- ID# and Designation ends -->

                                <!-- Parent Task & SubTask Title starts -->
                                <div class="div-table-col seq-tasktitle">
                                    {{ Task.ParentTaskTitle }}
                                        <br />
                                    {{ Task.Title }}
                                </div>
                                <!-- Parent Task & SubTask Title ends -->

                                <!-- Status & Assigned To starts -->
                                <div class="div-table-col seq-taskstatus">
                                    <select id="drpIntStatusSubsequence2{{Task.TaskId}}" data-highlighter="{{Task.TaskId}}">
                                        <option ng-selected="{{Task.Status == '1'}}" value="1">Open</option>
                                        <option ng-selected="{{Task.Status == '2'}}" style="color: red" value="2">Requested</option>
                                        <option ng-selected="{{Task.Status == '3'}}" style="color: lawngreen" value="3">Assigned</option>
                                        <option ng-selected="{{Task.Status == '4'}}" value="4">InProgress</option>
                                        <option ng-selected="{{Task.Status == '10'}}" value="10">Finished</option>
                                        <option ng-selected="{{Task.Status == '11'}}" value="11">Test</option>
                                    </select>
                                    <br />

                                    <select <%=!IsSuperUser ? "disabled" : ""%> id="ddcbIntSeqAssignedStaff{{Task.TaskId}}" style="width: 100%;" multiple ng-attr-data-assignedusers="{{Task.TaskAssignedUserIDs}}" data-chosen="1" data-placeholder="Select Users" data-taskid="{{Task.TaskId}}" data-taskstatus="{{Task.Status}}">
                                        <option
                                            ng-repeat="item in DesignationAssignUsers"
                                            value="{{item.Id}}"
                                            label="{{item.FristName}}"
                                            class="{{item.CssClass}}">{{item.FristName}}
                                        
                                        </option>
                                    </select>

                                </div>
                                <!-- Status & Assigned To ends -->

                                <!-- DueDate starts -->
                                <div class="div-table-col seq-taskduedate">
                                    <div class="seqapprovalBoxes">
                                        <div style="width: 65%; float: left;">
                                            <input type="checkbox" id="IntchkngUser{{Task.TaskId}}" ng-checked="{{Task.OtherUserStatus}}" ng-disabled="{{Task.OtherUserStatus}}" class="fz fz-user" title="User" />
                                            <input type="checkbox" id="IntchkQA{{Task.TaskId}}" class="fz fz-QA" title="QA" />
                                            <input type="checkbox" id="IntchkAlphaUser{{Task.TaskId}}" class="fz fz-Alpha" title="AlphaUser" />
                                            <br />
                                            <input type="checkbox" id="IntchkBetaUser{{Task.TaskId}}" class="fz fz-Beta" title="BetaUser" />
                                            <input type="checkbox" id="IntchkngITLead{{Task.TaskId}}" ng-checked="{{Task.TechLeadStatus}}" ng-disabled="{{Task.TechLeadStatus}}" class="fz fz-techlead" title="IT Lead" />
                                            <input type="checkbox" id="IntchkngAdmin{{Task.TaskId}}" ng-checked="{{Task.AdminStatus}}" ng-disabled="{{Task.AdminStatus}}" class="fz fz-admin" title="Admin" />
                                        </div>
                                        <div style="width: 30%; float: right;">
                                            <input type="checkbox" id="IntchkngITLeadMaster{{Task.TaskId}}" class="fz fz-techlead largecheckbox" title="IT Lead" /><br />
                                            <input type="checkbox" id="IntchkngAdminMaster{{Task.TaskId}}" class="fz fz-admin largecheckbox" title="Admin" />
                                        </div>
                                    </div>

                                    <div ng-attr-data-taskid="{{Task.TaskId}}" class="seqapprovepopup">

                                        <div id="divTaskAdminSubTask{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">Admin: </div>
                                            <div style="width: 30%;" class="display_inline"></div>
                                            <div ng-class="{hide : StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : !StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.AdminUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.AdminUserInstallId)? Task.AdminUserId : Task.AdminUserInstallId}} - {{Task.AdminUserFirstName}} {{Task.AdminUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.AdminStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.AdminStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.AdminStatusUpdated) ? '' : '(EST)' }} </span>
                                            </div>
                                            <div ng-class="{hide : !StringIsNullOrEmpty(Task.AdminStatusUpdated), display_inline : StringIsNullOrEmpty(Task.AdminStatusUpdated) }">
                                                <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                        </div>
                                        <div id="divTaskITLeadSubTask{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">ITLead: </div>
                                            <!-- ITLead Hours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <span>
                                                    <label>{{Task.ITLeadHours}}</label>Hour(s)
                                                </span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffITLeadEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.ITLeadHours), display_inline : StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffITLeadPassword" data-hours-id="txtngstaffITLeadEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- ITLead password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.ITLeadHours), display_inline : !StringIsNullOrEmpty(Task.ITLeadHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.TechLeadUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.TechLeadUserInstallId)? Task.TechLeadUserId : Task.TechLeadUserInstallId}} - {{Task.TechLeadUserFirstName}} {{Task.TechLeadUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.TechLeadStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.TechLeadStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.TechLeadStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>

                                        </div>
                                        <div id="divUserSubTask{{Task.TaskId}}" style="margin-bottom: 15px; font-size: x-small;">
                                            <div style="width: 10%;" class="display_inline">User: </div>
                                            <!-- UserHours section -->
                                            <div style="width: 30%;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <span>
                                                    <label>{{Task.UserHours}}</label>Hour(s)
                                                        Hour(s)</span>
                                            </div>
                                            <div style="width: 30%;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="text" style="width: 55px;" placeholder="Est. Hours" data-id="txtngstaffUserEstimatedHours" />
                                            </div>
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : !StringIsNullOrEmpty(Task.UserHours), display_inline : StringIsNullOrEmpty(Task.UserHours) }">
                                                <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this);"
                                                    data-id="txtngstaffUserPassword" data-hours-id="txtngstaffUserEstimatedHours" ng-attr-data-taskid="{{Task.TaskId}}" />
                                            </div>
                                            <!-- User password section -->
                                            <div style="width: 50%; float: right; font-size: x-small;" ng-class="{hide : StringIsNullOrEmpty(Task.UserHours), display_inline : !StringIsNullOrEmpty(Task.UserHours) }">
                                                <a class="bluetext" href="CreateSalesUser.aspx?id={{Task.OtherUserId}}" target="_blank">{{StringIsNullOrEmpty(Task.OtherUserInstallId)? Task.OtherUserId : Task.OtherUserInstallId}} - {{Task.OtherUserFirstName}} {{Task.OtherUserLastName}}
                                                </a>
                                                <br />
                                                <span>{{ Task.OtherUserStatusUpdated | date:'M/d/yyyy' }}</span>&nbsp;<span style="color: red">{{ Task.OtherUserStatusUpdated | date:'shortTime' }}</span>&nbsp;<span> {{StringIsNullOrEmpty(Task.OtherUserStatusUpdated)? '' : '(EST)' }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- DueDate ends -->

                                <!-- Notes starts -->
                                <div class="div-table-col seq-notes">
                                    Notes
                                </div>
                                <!-- Notes ends -->
                            </div>
                        </div>
                        <br />
                        <div>
                            <strong style="margin: 5px;">Important Interview Instruction</strong>
                            <div id="InterviewInstructions" class="employeeinstruction">
                            </div>

                        </div>
                        <%
                            if (Request.QueryString["PWT"] == "1")
                            {
                        %>
                        <div class="notes-section" tuid="<%=loggedInUserId %>" style="width: 98%;">
                            <div class="notes-popup">
                                <div class="heading">
                                    <div class="title">User Touch Point Logs</div>

                                    <input type="hidden" id="PageIndex" value="0" />
                                </div>
                                <div class="content">
                                    Loading Notes...
                                </div>
                                <div class="pagingWrapper">
                                    <div class="total-results">Total <span class="total-results-count"></span>Results</div>
                                    <div class="pager">
                                        <span class="first">« First</span> <span class="previous">Previous</span> <span class="numeric"></span><span class="next">Next</span> <span class="last">Last »</span>
                                    </div>
                                    <div class="pageInfo">
                                    </div>
                                </div>
                                <div class="add-notes-container">
                                    <input type="hidden" class="touchPointSource" value="<%=(int)JG_Prospect.Common.TouchPointSource.InterviewPopup %>" />
                                    <textarea id="note-text" class="note-text textbox"></textarea>
                                    <input type="button" class="GrdBtnAdd" value="Add Notes" onclick="addPopupNotes(this)" />
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <br />
                        Your default Interview Date & Time Deadline has been scheduled for & with below:
            <br />
                        <br />
                        <table>
                            <tr>
                                <td width="50%" align="left" style="vertical-align: top;"><span><strong><span class="bluetext">*</span>Interview Date & Time: </strong>
                                    <label id="InterviewDateTime"></label>
                                </span></td>
                                <td align="right" style="vertical-align: top;">
                                    <table>
                                        <tr>
                                            <td align="left" valign="top"><a href="#" style="color: blue;">REC-001</a><br />
                                                <asp:Literal ID="ltlManagerName" runat="server" Text="Default Recruiter"></asp:Literal></td>
                                            <td align="right" valign="top">
                                                <img width="100px" height="100px" src="../img/JG-Logo.gif" /></td>
                                        </tr>
                                    </table>


                                </td>
                            </tr>
                        </table>

                    </div>

                </div>
                <!-- Interview Date popup ends -->
                <%} %>
            </div>

            <h2></h2>

            <div class="notes-section" tuid="<%=loggedInUserId %>" style="width: 98%;">
                <div class="notes-popup">
                    <div class="heading">
                        <div class="title">User Touch Point Logs</div>

                        <input type="hidden" id="PageIndex" value="0" />
                    </div>
                    <div class="content">
                        Loading Notes...
                    </div>
                    <div class="pagingWrapper">
                        <div class="total-results">Total <span class="total-results-count"></span>Results</div>
                        <div class="pager">
                            <span class="first">« First</span> <span class="previous">Previous</span> <span class="numeric"></span><span class="next">Next</span> <span class="last">Last »</span>
                        </div>
                        <div class="pageInfo">
                        </div>
                    </div>
                    <div class="add-notes-container">
                        <input type="hidden" class="touchPointSource" value="<%=(int)JG_Prospect.Common.TouchPointSource.ITDashboard %>" />
                        <textarea id="note-text" class="note-text textbox"></textarea>
                        <input type="button" class="GrdBtnAdd" value="Add Notes" onclick="addPopupNotes(this)" />
                    </div>
                </div>
            </div>

            <asp:HiddenField ID="hdnUserId" runat="server" />
        </div>
        <div class="push popover__content">
            <div style="float: right; top: 0px; position: absolute; left: 160px;">
                <a href="#/" id="popoverCloseButton">x</a>
            </div>
            <div class="content"></div>
        </div>


        <div class="SeqApprovalPopup" style="display: none">
            <input type="hidden" id="hdnTaskId" />
            <div id="IntdivTaskAdmin" style="margin-bottom: 15px; font-size: x-small;">
                <div style="width: 10%;" class="display_inline">Admin: </div>
                <div style="width: 30%;" class="display_inline"></div>
                <div class="" id="AdminClass">
                    <a id="linkUser" class="bluetext" href="#" target="_blank"><span id="AdminDisplayName"></span>
                    </a>
                    <br />
                    <span id="AdminDate"></span>&nbsp;<span style="color: red" id="AdminTime"></span>&nbsp;<span id="AdminTimezone"></span>
                </div>
                <div id="AdminClass2">
                    <input type="password" style="width: 100px;" placeholder="Admin password" onchange="javascript:FreezeSeqTask(this, 'A');" data-id="txtngstaffAdminPassword" data-hours-id="txtngstaffAdminEstimatedHours" />
                </div>
            </div>
            <div id="IntdivTaskITLead" style="margin-bottom: 15px; font-size: x-small;">
                <div style="width: 10%;" class="display_inline">ITLead: </div>
                <!-- ITLead Hours section -->
                <div style="width: 30%;" id="LeadClass">
                    <span>
                        <label id="LeadHours"></label>
                        Hour(s)
                    </span>
                </div>
                <div style="width: 30%;" id="LeadClass2">
                    <input type="text" style="width: 55px;" placeholder="Est. Hours" id="txtITLeadHours" />
                </div>
                <div style="width: 50%; float: right; font-size: x-small;" id="LeadClass3">
                    <input type="password" style="width: 100px;" placeholder="ITLead Password" onchange="javascript:FreezeSeqTask(this, 'L');" />
                </div>
                <!-- ITLead password section -->
                <div style="width: 50%; float: right; font-size: x-small;" id="LeadClass4">
                    <a class="bluetext" href="#" id="linkLead" target="_blank"></a>
                    <br />
                    <span id="LeadDate"></span>&nbsp;<span style="color: red" id="LeadTime"></span>&nbsp;<span id="LeadTimezone"></span>
                </div>

            </div>
            <div id="IntdivUser" style="margin-bottom: 15px; font-size: x-small;">
                <div style="width: 10%;" class="display_inline">User: </div>
                <!-- UserHours section -->
                <div style="width: 30%;" id="UserClass">
                    <span>
                        <label id="UserHours"></label>
                        Hour(s)
                                                        Hour(s)</span>
                </div>
                <div style="width: 30%;" id="UserClass2">
                    <input type="text" style="width: 55px;" placeholder="Est. Hours" id="txtUserHours" />
                </div>
                <div style="width: 50%; float: right; font-size: x-small;" id="UserClass3">
                    <input type="password" style="width: 100px;" placeholder="User Password" onchange="javascript:FreezeSeqTask(this, 'U');" />
                </div>
                <!-- User password section -->
                <div style="width: 50%; float: right; font-size: x-small;" id="UserClass4">
                    <a class="bluetext" href="CreateSalesUser.aspx?id=" target="_blank" id="linkOtherUser"></a>
                    <br />
                    <span id="OtherUserStatusUpdatedDate"></span>&nbsp;<span style="color: red" id="OtherUserStatusUpdatedTime"></span>&nbsp;<span id="OtherUserStatusUpdatedTimezone"></span>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="<%=Page.ResolveUrl("~/js/chosen.jquery.js")%>"></script>

        <script src="../js/angular/scripts/jgapp.js"></script>
        <script src="../js/angular/scripts/TaskSequence.js"></script>
        <script src="../js/angular/scripts/FrozenTask.js"></script>
        <script src="../js/TaskSequencing.js"></script>
        <script src="../js/jquery.dd.min.js"></script>
        <script src="../js/angular/scripts/ClosedTasls.js"></script>

        <script type="text/javascript">
            function Paging(sender) {
                $('#PageIndex').val(paging.currentPage);
                ajaxExt({
                    url: '/Sr_App/edituser.aspx/GetUserTouchPointLogs',
                    type: 'POST',
                    data: '{ pageNumber: ' + $('#PageIndex').val() + ', pageSize: ' + paging.pageSize + ', userId: ' + <%=loggedInUserId%> + ' }',
                showThrobber: true,
                throbberPosition: { my: "left center", at: "right center", of: $(sender), offset: "5 0" },
                success: function (data, msg) {
                    if (data.Data.length > 0) {
                        PageNumbering(data.TotalResults);
                        var tbl = '<table cellspacing="0" cellpadding="0"><tr><th>Updated By<br/>Created On</th><th>Note</th></tr>';
                        $(data.Data).each(function (i) {
                            tbl += '<tr id="' + data.Data[i].UserTouchPointLogID + '">' +
                                '<td><a target="_blank" href="/Sr_App/ViewSalesUser.aspx?id=' + data.Data[i].UserID + '">' + data.Data[i].SourceUser + '<br/>' + data.Data[i].ChangeDateTimeFormatted + '</a></td>' +
                                '<td title="' + data.Data[i].LogDescription + '"><div class="note-desc">' + data.Data[i].LogDescription + '</div></td>' +
                                '</tr>';
                        });
                        tbl += '</table>';
                        $('.notes-popup .content').html(tbl);
                        var tuid = getUrlVars()["TUID"];
                        var nid = getUrlVars()["NID"];
                        if (tuid != undefined && nid != undefined) {
                            $('.notes-popup tr#' + nid).addClass('blink-notes');
                            $('html, body').animate({
                                scrollTop: $(".notes-popup").offset().top
                            }, 2000);
                        }
                        $('.pagingWrapper').show();
                        tribute.attach(document.querySelectorAll('.note-text'));
                    } else {
                        $('.notes-popup .content').html('Notes not found');
                        $('.pagingWrapper').hide();
                    }
                }
            });
            return false;
        }
        function addPopupNotes(sender) {
            var userId = '<%=loggedInUserId%>';
            addNotes(sender, userId);
        }
        function addNotes(sender, uid) {
            var note = $(sender).parent().find('.note-text').val();
            if (note != '')
                ajaxExt({
                    url: '/Sr_App/edituser.aspx/AddNotes',
                    type: 'POST',
                    data: '{ id: ' + uid + ', note: "' + note + '" }',
                    showThrobber: true,
                    throbberPosition: { my: "left center", at: "right center", of: $(sender), offset: "5 0" },
                    success: function (data, msg) {
                        $(sender).parent().find('.note-text').val('');
                        Paging(sender);
                    }
                });
        }
        var ddlDesigSeqClientIDFrozenTasks = "";
        var ddlDesigSeqClientID;
        function changeTaskStatusClosed(Task) {
            var StatusId = Task.value;
            var TaskId = Task.getAttribute('data-highlighter');
            var data = { intTaskId: TaskId, TaskStatus: StatusId };
            $.ajax({
                type: "POST",
                url: url + "SetTaskStatus",
                data: data,
                success: function (result) {
                    alert("Task Status Changed.");

                    var dids = ""; var uids = '';
                    if ($('.' + ddlDesigSeqClientID).val() != undefined)
                        dids = $('.' + ddlDesigSeqClientID).val().join();
                    if ($('.chosen-select-users').val() != undefined)
                        uids = $('.chosen-select-users').val().join();

                    var attrs = $('#pnlNewFrozenTask').attr('class').split(' ');
                    var cls = attrs[attrs.length - 1];

                    if (cls != 'hide') {
                        ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).val(), $("#ddlSelectFrozenTask").val().join());
                        ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), $("#ddlSelectFrozenTask").val().join());
                    }
                    else {
                        ShowTaskSequenceDashBoard(dids, uids, true);
                        ShowTaskSequenceDashBoard(dids, uids, false);
                        //ShowAllClosedTasksDashBoard(dids, uids, pageSize);
                    }
                },
                error: function (errorThrown) {
                    alert("Failed!!!");
                }
            });
        }

        function pageLoad(sender, args) {            
            ddlDesigSeqClientID = 'chosen-dropDown';
            ddlDesigSeqClientIDFrozenTasks = 'chosen-dropdown-FrozenTasks';
            ChosenDropDown();
        }
        var desIds = "";
        var pageSize = 20;

        function resetChosen(selector) {
            var val = $(selector).val();

            //
            if (val != undefined && val != '') {
                $(selector)
                    .find('option:first-child').prop('selected', false)
                    .end().trigger('chosen:updated');
            } else {
                $(selector)
                    .find('option:first-child').prop('selected', true)
                    .end().trigger('chosen:updated');
            }
        }

        function openSeqApprovalPopup(caller) {
            var taskid = $(caller).attr('data-taskid');
            $('#hdnTaskId').val(taskid);
            var taskinfo = $('#SeqApprovalDiv' + taskid);
            var AdminUpdatedDate = $(taskinfo).attr('data-AdminStatusUpdatedDate');
            var AdminUpdatedTime = $(taskinfo).attr('data-AdminStatusUpdatedTime');
            var AdminUpdatedTimezone = $(taskinfo).attr('data-AdminStatusUpdatedTimezone');
            var AdminStatusUpdated = $(taskinfo).attr('data-AdminStatusUpdated');
            var AdminDisplayName = $(taskinfo).attr('data-AdminDisplayName');
            var AdminUserId = $(taskinfo).attr('data-AdminStatusUserId');

            var LeadUpdatedDate = $(taskinfo).attr('data-LeadStatusUpdatedDate');
            var LeadUpdatedTime = $(taskinfo).attr('data-LeadStatusUpdatedTime');
            var LeadUpdatedTimezone = $(taskinfo).attr('data-LeadStatusUpdatedTimezone');
            var LeadStatusUpdated = $(taskinfo).attr('data-LeadStatusUpdated');
            var LeadDisplayName = $(taskinfo).attr('data-LeadDisplayName');
            var LeadHours = $(taskinfo).attr('data-LeadHours');
            var LeadUserId = $(taskinfo).attr('data-LeadUserId');

            var UserUpdatedDate = $(taskinfo).attr('data-UserStatusUpdatedDate');
            var UserUpdatedTime = $(taskinfo).attr('data-UserStatusUpdatedTime');
            var UserUpdatedTimezone = $(taskinfo).attr('data-UserStatusUpdatedTimezone');
            var UserStatusUpdated = $(taskinfo).attr('data-UserStatusUpdated');
            var UserDisplayName = $(taskinfo).attr('data-UserDisplayName');
            var UserHours = $(taskinfo).attr('data-UserHours');
            var UserId = $(taskinfo).attr('data-UserUserId');

            var approvaldialog = $('.SeqApprovalPopup');
            $(approvaldialog).find('#AdminClass').attr('class', AdminStatusUpdated==''?'hide':'display_inline');
            $(approvaldialog).find('#linkUser').attr('href', 'CreateSalesUser.aspx?id=' + AdminUserId);
            $(approvaldialog).find('#AdminDate').html(AdminUpdatedDate);
            $(approvaldialog).find('#AdminTime').html(AdminUpdatedTime);
            $(approvaldialog).find('#AdminTimezone').html(AdminUpdatedTimezone);
            $(approvaldialog).find('#AdminDisplayName').html(AdminDisplayName);
            $(approvaldialog).find('#AdminClass2').attr('class', AdminStatusUpdated!=''?'hide':'display_inline');

            //Lead
            $(approvaldialog).find('#LeadClass').attr('class', LeadStatusUpdated==''?'hide':'display_inline');
            $(approvaldialog).find('#linkLead').attr('href', 'CreateSalesUser.aspx?id=' + LeadUserId);
            $(approvaldialog).find('#linkLead').html(LeadDisplayName);
            $(approvaldialog).find('#LeadDate').html(LeadUpdatedDate);
            $(approvaldialog).find('#LeadTime').html(LeadUpdatedTime);
            $(approvaldialog).find('#LeadTimezone').html(LeadUpdatedTimezone);
            $(approvaldialog).find('#LeadDisplayName').html(LeadDisplayName);
            $(approvaldialog).find('#LeadHours').html(LeadHours);
            $(approvaldialog).find('#LeadClass2').attr('class', LeadStatusUpdated!=''?'hide':'display_inline');
            $(approvaldialog).find('#LeadClass3').attr('class', LeadStatusUpdated!=''?'hide':'display_inline');
            $(approvaldialog).find('#LeadClass4').attr('class', LeadStatusUpdated==''?'hide':'display_inline');

            //User
            $(approvaldialog).find('#UserClass').attr('class', UserUpdatedDate==''?'hide':'display_inline');
            $(approvaldialog).find('#linkOtherUser').attr('href', 'CreateSalesUser.aspx?id=' + UserId);
            $(approvaldialog).find('#OtherUserStatusUpdatedDate').html(UserUpdatedDate);
            $(approvaldialog).find('#OtherUserStatusUpdatedTime').html(UserUpdatedTime);
            $(approvaldialog).find('#OtherUserStatusUpdatedTimezone').html(UserUpdatedTimezone);
            $(approvaldialog).find('#linkOtherUser').html(UserDisplayName);
            $(approvaldialog).find('#UserHours').html(UserHours);
            $(approvaldialog).find('#UserClass2').attr('class', UserStatusUpdated!=''?'hide':'display_inline');
            $(approvaldialog).find('#UserClass3').attr('class', UserStatusUpdated!=''?'hide':'display_inline');
            $(approvaldialog).find('#UserClass4').attr('class', UserStatusUpdated==''?'hide':'display_inline');

            approvaldialog.dialog({
                width: 400,
                show: 'slide',
                hide: 'slide',
                autoOpen: false
            });

            approvaldialog.removeClass("hide");
            approvaldialog.dialog('open');
        }

        $(document).ready(function () {
            Paging($(this));
            $(".chosen-select-multi").chosen();
            $('.chosen-dropDown').chosen();
            $('.chosen-dropDownStatus').chosen();
            $('.chosen-dropdown-FrozenTasks').chosen();
            $(".chosen-select-users").chosen({ no_results_text: "No users found!" });
            $("#ddlSelectUserClosedTask").chosen({ no_results_text: "No users found!" });
            $("#ddlSelectFrozenTask").chosen();

            //InProAssigned
            $(".chosen-select-users").change(function () {
                resetChosen(".chosen-select-users");
                ShowTaskSequenceDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(),true);
                ShowTaskSequenceDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(),false);
                //ShowAllClosedTasksDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(), pageSize);
            });

            //Frozen/NonFrozen
            $("#ddlSelectFrozenTask").change(function () {
                resetChosen("#ddlSelectFrozenTask");
                ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).val(), $("#ddlSelectFrozenTask").val().join());
                ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), $("#ddlSelectFrozenTask").val().join());
            });

            //set page size
            $('#drpPageSizeClosedTasks').change(function () {
                desIds = $(".chosen-select-multi").val();
                if (desIds == undefined) { desIds = ''; }
                pageSize = $('#drpPageSizeClosedTasks').val();
                //ShowAllClosedTasksDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(), pageSize)
            });

            //fill users
            if ($('#' + '<%=tableFilter.ClientID%>').length > 0) {
                $('#ddlUserStatus').find('option:first-child').prop('selected', false);
                $('#ddlUserStatus option[value="U1"]').attr("selected", "selected");
                $('#ddlUserStatus option[value="T3"]').attr("selected", "selected");
                $('#ddlUserStatus option[value="T4"]').attr("selected", "selected");
                $('#ddlUserStatus').trigger('chosen:updated');
                //Get Designation for LoggedIn User
                var des = <%=UserDesignationId%>;
            
                var DesToSelectITLead = ['8', '9', '10', '11', '12', '13', '24', '25', '26', '27', '28', '29'];
                var DesToSelectForeman = ['14', '15', '16', '17', '18', '19', '20'];
                var DesToSelectSalesManager = ['2', '3', '6', '7'];
                var DesToSelectOfficeManager = ['1', '4', '5', '22', '23'];

                //Set pre-selected options
                switch (des) {
                    case 21: {
                        $('#ddlDesignationSeq').find('option:first-child').prop('selected', false).end().trigger('chosen:updated');
                        $.each(DesToSelectITLead, function (index, value) {
                            //Select Designation
                            $("#ddlDesignationSeq option[value=" + value + "]").attr("selected", "selected");
                        });
                        break;
                    }
                    case 18: {
                        $('#ddlDesignationSeq').find('option:first-child').prop('selected', false).end().trigger('chosen:updated');
                        $.each(DesToSelectForeman, function (index, value) {
                            //Select Designation
                            $("#ddlDesignationSeq option[value=" + value + "]").attr("selected", "selected");
                        });
                        break;
                    }
                    case 6: {
                        $('#ddlDesignationSeq').find('option:first-child').prop('selected', false).end().trigger('chosen:updated');
                        $.each(DesToSelectSalesManager, function (index, value) {
                            //Select Designation
                            $("#ddlDesignationSeq option[value=" + value + "]").attr("selected", "selected");
                        });
                        break;
                    }
                    case 4: {
                        $('#ddlDesignationSeq').find('option:first-child').prop('selected', false).end().trigger('chosen:updated');
                        $.each(DesToSelectOfficeManager, function (index, value) {
                            //Select Designation
                            $("#ddlDesignationSeq option[value=" + value + "]").attr("selected", "selected");
                        });
                        break;
                    }
                }

                //Refresh Choosen
                $("#ddlDesignationSeq").trigger("chosen:updated");

                fillUsers(ddlDesigSeqClientID, 'ddlSelectUserInProTask', 'lblLoading');
                fillUsers(ddlDesigSeqClientIDFrozenTasks, 'ddlSelectFrozenTask', 'lblLoadingFrozen');
            }
        });



        $(window).load(function () {
            checkNShowTaskPopup();
            sequenceScope.ForDashboard = true;
            var desId = "";
            var userids = "";
            desId = $('.' + ddlDesigSeqClientID).val();
            userids = $(".chosen-select-users").val();

            if (desId != undefined) {
                desId = desId.join();
            }
            else {
                desId = "";
            }

            if (userids != undefined) {
                userids = userids.join();
            }
            else {
                userids = "";
            }

            $('#refreshClosedTask').on('click', function () {                
                ShowTaskSequenceDashBoard('', '', false);
                //ShowAllClosedTasksDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(), pageSize);
            });

            $('#refreshInProgTasks').on('click', function () {
                ShowTaskSequenceDashBoard('', '', true);
            });


            //Set Date Filters
            $('.chkAllDates').attr("checked", true);
            //Set Date
            $('.dateFrom').val("All");
            var EndDate = new Date();
            EndDate = (EndDate.getMonth() + 1) + '/' + EndDate.getDate() + '/' + EndDate.getFullYear();
            $('.dateTo').val(EndDate);


            //for StartDate and EndDate trigger
            $('.dateFrom').change(function () {
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.dateTo').change(function () {
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.chkAllDates').change(function () {
                $('.dateFrom').val("All");
                var EndDate = new Date();
                EndDate = (EndDate.getMonth() + 1) + '/' + EndDate.getDate() + '/' + EndDate.getFullYear();
                $('.dateTo').val(EndDate);
                $('.chkOneYear').attr("checked", false); $('.chkThreeMonth').attr("checked", false); $('.chkOneMonth').attr("checked", false); $('.chkTwoWks').attr("checked", false);
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.chkOneYear').change(function () {
                addMonthsToDate(12);
                $('.dateFrom').val(StartDate);
                $('.dateTo').val(EndDate);
                $('.chkThreeMonth').attr("checked", false); $('.chkOneMonth').attr("checked", false); $('.chkTwoWks').attr("checked", false); $('.chkAllDates').attr("checked", false);
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.chkThreeMonth').change(function () {
                addMonthsToDate(3);
                $('.dateFrom').val(StartDate);
                $('.dateTo').val(EndDate);
                $('#chkOneYear').attr("checked", false); $('.chkOneMonth').attr("checked", false); $('.chkTwoWks').attr("checked", false); $('.chkAllDates').attr("checked", false);
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.chkOneMonth').change(function () {
                addMonthsToDate(1);
                $('.dateFrom').val(StartDate);
                $('.dateTo').val(EndDate);
                $('#chkOneYear').attr("checked", false); $('.chkThreeMonth').attr("checked", false); $('.chkTwoWks').attr("checked", false); $('.chkAllDates').attr("checked", false);
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            $('.chkTwoWks').change(function () {
                addDaysToDate(13);
                $('.dateFrom').val(StartDate);
                $('.dateTo').val(EndDate);
                $('#chkOneYear').attr("checked", false); $('.chkThreeMonth').attr("checked", false); $('.chkOneMonth').attr("checked", false); $('.chkAllDates').attr("checked", false);
                ShowTaskSequenceDashBoard(desId, userids, true);
                ShowTaskSequenceDashBoard(desId, userids, false);
            });

            if ($('#' + '<%=tableFilter.ClientID%>').length > 0) {
                

                $('.' + ddlDesigSeqClientID).change(function (e) {
                    resetChosen('#ddlDesignationSeq');
                    ShowTaskSequenceDashBoard($('.' + ddlDesigSeqClientID).val().join(), '', true);
                    ShowTaskSequenceDashBoard($('.' + ddlDesigSeqClientID).val().join(), '', false);
                    //ShowAllClosedTasksDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(), pageSize)
                    fillUsers(ddlDesigSeqClientID, 'ddlSelectUserInProTask', 'lblLoading');
                });

                $('#ddlUserStatus').change(function () {
                    //resetChosen("#ddlUserStatus");
                    $('.' + ddlDesigSeqClientID).trigger('change');
                });

                // And now fire change event when the DOM is ready
                $('#' + ddlDesigSeqClientID).trigger('change');

                



                sequenceScope.IsTechTask = false;



                //Get Selected Designations
                desIds = $(".chosen-select-multi").val();
                if (desIds == undefined) { desIds = ''; }

                // Load initial tasks for user.
                desId = $('.' + ddlDesigSeqClientID).val().join();
                ShowTaskSequenceDashBoard(desId, '', true);
                ShowTaskSequenceDashBoard(desId, '', false);
                //Load Closed Tasks            
                //ShowAllClosedTasksDashBoard("", 0, pageSize);

                //load Frozen/Non Tasks
                //ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
                //ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);

                $('.' + ddlDesigSeqClientIDFrozenTasks).change(function (e) {
                    resetChosen('#ddlFrozenTasksDesignations');
                    fillUsers(ddlDesigSeqClientIDFrozenTasks, 'ddlSelectFrozenTask', 'lblLoadingFrozen');
                    ShowFrozenTaskSequenceDashBoard($('.' + ddlDesigSeqClientIDFrozenTasks).val(), 0);
                    ShowNonFrozenTaskSequenceDashBoard($('.' + ddlDesigSeqClientIDFrozenTasks).val(), 0);
                });
            }
            else {
                //For User
                ShowTaskSequenceDashBoard('', '', true);
                ShowTaskSequenceDashBoard('', '', false);
            }
            checkNShowTaskPopup();


        });

        //Date Filter
        var StartDate = new Date();
        var EndDate = new Date();

        function addMonthsToDate(Number) {
            StartDate = new Date();
            EndDate = new Date();

            StartDate.setMonth(StartDate.getMonth() - Number);
            StartDate.setDate(StartDate.getDate() - 1);
            StartDate = (StartDate.getMonth() + 1) + '/' + StartDate.getDate() + '/' + StartDate.getFullYear();

            EndDate = (EndDate.getMonth() + 1) + '/' + EndDate.getDate() + '/' + EndDate.getFullYear();
        }
        function addDaysToDate(Number) {
            StartDate = new Date();
            EndDate = new Date();

            StartDate.setDate(StartDate.getDate() - 13);
            StartDate = (StartDate.getMonth() + 1) + '/' + StartDate.getDate() + '/' + StartDate.getFullYear();

            EndDate = (EndDate.getMonth() + 1) + '/' + EndDate.getDate() + '/' + EndDate.getFullYear();
        }

        function fillUsers(selector, fillDDL, loader) {
            // 
            var did = '';
            if (($('.' + selector).val() != undefined)) {
                did = $('.' + selector).val().join();
            }

            var ustatus = $('#ddlUserStatus').val();
            var TaskStatus = '';
            var UserStatus = '';

            //Extract User Status from MultiStatusType DropDown
            $.each(ustatus, function (key, element){
                if (element.substr(0, 1) == 'T') {
                    TaskStatus += element.replace('T', '') + ',';
                }
                else if (element.substr(0, 1) == 'U') {
                    UserStatus += element.replace('U', '') + ',';
                }
            });
            TaskStatus = TaskStatus.slice(0, TaskStatus.length - 1);
            UserStatus = UserStatus.slice(0, UserStatus.length - 1);
            ustatus = UserStatus;

            var options = $('#' + fillDDL);
            $('#ddlSelectFrozenTask_chosen').css({ "width": "300px" });
            $('#ddlFrozenTasksDesignations_chosen').css({ "width": "300px" });

            $('.chzn-drop').css({ "width": "300px" });

            //$("#" + fillDDL).prop('disabled', true);
            $('#' + loader).show();
            $.ajax({
                type: "POST",
                url: "ajaxcalls.aspx/GetUsersByDesignationIdWithUserStatus",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ designationId: did, userStatus: ustatus }),
                success: function (data) {
                    options.empty();
                    options.append($("<option selected='selected' />").val('0').text('All'));
                    // Handle 'no match' indicated by [ "" ] response
                    if (data.d) {

                        var result = [];
                        result = JSON.parse(data.d);
                        $.each(result, function () {
                            var names = this.FristName.split(' - ');
                            var Class = 'activeUser';
                            if (this.Status == '5')
                                Class = 'IOUser';

                            var name = names[0] + '&nbsp;-&nbsp;';
                            var link = names[1] != null && names[1] != '' ? '<a style="color:blue;" href="javascript:;" onclick=redir("/Sr_App/ViewSalesUser.aspx?id=' + this.Id + '")>' + names[1] + '</a>' : '';
                            options.append($('<option class="' + Class + '" />').val(this.Id).html(name + link));
                        });
                        //$("#" + fillDDL).prop('disabled', false);
                    }
                    options.trigger("chosen:updated");
                    $('#' + loader).hide();
                    $('#ddlSelectFrozenTask_chosen').css({ "width": "300px" });

                    //Create Links
                    //$('#ddlSelectUserInProTask_chosen .chosen-drop ul.chosen-results li').each(function (i) {
                    //    console.log($(this).html());
                    //    $(this).bind("click", "a", function () {                            
                    //        window.open($(this).find("a").attr("href"), "_blank", "", false);
                    //    });
                    //});
                    // remove loading spinner image.
                }
            });
        }

        function redir(url) {
            window.open(url, '_blank');
        }

        function updateTaskStatus(id, value) {
            ShowAjaxLoader();
            var postData = {
                intTaskId: id,
                TaskStatus: value
            };

            $.ajax
                (
                {
                    url: '../WebServices/JGWebService.asmx/SetTaskStatus',
                    contentType: 'application/json; charset=utf-8;',
                    type: 'POST',
                    dataType: 'json',
                    data: JSON.stringify(postData),
                    asynch: false,
                    success: function (data) {
                        HideAjaxLoader();
                        alert('Task Status Updated successfully.');
                    },
                    error: function (a, b, c) {
                        HideAjaxLoader();
                    }
                }
                );
        }

       <%-- function checkFrozenDesignations(oSrc, args) {
            args.IsValid = ($("#<%= ddlFrozenUserDesignation.ClientID%> input:checked").length > 0);
        }--%>

            var prmTaskGenerator = Sys.WebForms.PageRequestManager.getInstance();

            prmTaskGenerator.add_endRequest(function () {
                Initialize();
            });

            function _updateQStringParam(uri, key, value, Mainkey, MainValue) {
                var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
                var separator = uri.indexOf('?') !== -1 ? "&" : "?";

                if (uri.match(re)) {
                    return uri.replace(re, '$1' + key + "=" + value + '$2');
                }
                else {
                    uri = uri.replace("ITDashboard", "TaskGenerator");
                    return uri + separator + Mainkey + "=" + MainValue + '&' + key + "=" + value;
                }
            }

            function _updateQStringParam(uri, key, value, Mainkey, MainValue, InstallKey, InstallValue) {
                var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
                var separator = uri.indexOf('?') !== -1 ? "&" : "?";

                if (uri.match(re)) {
                    return uri.replace(re, '$1' + key + "=" + value + '$2');
                }
                else {
                    uri = uri.replace("ITDashboard", "TaskGenerator");
                    return uri + separator + Mainkey + "=" + MainValue + '&' + key + "=" + value + '&' + InstallKey + '=' + InstallValue;
                }
            }

            $(document).ready(function () {

                Initialize();
            });

            //$(document).on('click', '#ddlSelectUserInProTask_chosen', function () {
            //    
            //    var href = $(this).find('li.search-choice a').attr('href');
            //    window.open(href, "_blank");
            //});


            function Initialize() {
                SetAccordingContent();
                SetInProTaskAutoSuggestion();
                SetInProTaskAutoSuggestionUI();

                SetFrozenTaskAutoSuggestionUI();

                SetFrozenTaskAutoSuggestion();

                SetApprovalUI();
                SetTaskCounterPopup();
                checkDropdown();

                ChosenDropDown();
                setSelectedUsersLink();

                $(".context-menu").bind("contextmenu", function () {
                    var urltoCopy = _updateQStringParam(window.location.href, "hstid", $(this).attr('data-highlighter'), "TaskId", $(this).attr('parentdata-highlighter'));
                    copyToClipboard(urltoCopy);
                    return false;
                });
            }
            function openCopyBox(obj) {
                // 
                var urltoCopy = _updateQStringParam(window.location.href, "hstid", $(obj).attr('data-highlighter'), "TaskId", $(obj).attr('parentdata-highlighter'), "InstallId", $(obj).attr('data-installid'));
                copyToClipboard(urltoCopy);
                return false;
            }

            function SetAccordingContent() {
                $("#accordion" ).accordion({
                    collapsible: true
                });
            }

            //$(".context-menu").bind("contextmenu", function () {
            //    // 
            //    var urltoCopy = updateQueryStringParameter(window.location.href, "hstid", $(this).attr('data-highlighter'), "TaskId", $(this).attr('parentdata-highlighter'));
            //    copyToClipboard(urltoCopy);
            //    return false;
            //});
            function checkNShowTaskPopup() {
                var TaskId = getUrlVars()["TaskId"];
                var PopupWithoutTask = getUrlVars()["PWT"];

                if (TaskId) {
                    showInterviewPopup();
                }
                else if (PopupWithoutTask) {// If no task available hide task div.
                    showInterviewPopup();
                    $('#tblIntTechSeq').hide();
                }
            }

            function showInterviewPopup() {
                GetEmployeeInterviewDetails();
                $('#HighLightedTask').removeClass('hide');
                var $dialog = $('#HighLightedTask').dialog({
                    autoOpen: true,
                    modal: false,
                    height: 500,
                    width: 1100,
                    title: 'Important Interview Information'
                });

            }

            // Read a page's GET URL variables and return them as an associative array.
            function getUrlVars() {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            }

            function setSelectedUsersLink() {
                //debugger; 
                $('.chosen-dropDown').each(function () {
                    var itemIndex = $(this).children('.search-choice-close').attr('data-option-array-index');
                    //console.log(itemIndex);
                    if (itemIndex) {
                        //console.log($(this).parent('.chosen-choices').parent('.chosen-container'));
                        var selectoptionid = '#' + $(this).parent('.chosen-choices').parent('.chosen-container').attr('id').replace("_chosen", "") + ' option';
                        var chspan = $(this).children('span');
                        if (chspan) {
                            chspan.html('<a style="color:blue;" href="/Sr_App/ViewSalesUser.aspx?id=' + $(selectoptionid)[itemIndex].value + '">' + chspan.text() + '</a>');
                            chspan.bind("click", "a", function () {
                                window.open($(this).children("a").attr("href"), "_blank", "", false);
                            });
                        }
                    }
                });

                $('.chosen-select').bind('change', function (evt, params) {
                    console.log(evt);
                    console.log(params);


                });
            }

            function SetSeqApprovalUI() {
                //alert("called");
                $('.seqapprovalBoxes').each(function () {
                    var approvaldialog = $($(this).next('div.seqapprovepopup'));

                    //console.log(approvaldialog);

                    approvaldialog.addClass("hide");

                    approvaldialog.dialog({
                        width: 400,
                        show: 'slide',
                        hide: 'slide',
                        autoOpen: false
                    });

                    $(this).click(function () {
                        approvaldialog.removeClass("hide");
                        approvaldialog.dialog('open');
                    });
                });
            }

            function SetApprovalUI() {
                //// 
                $('.approvalBoxes').each(function () {
                    var approvaldialog = $($(this).next('.approvepopup'));
                    approvaldialog.dialog({
                        width: 400,
                        show: 'slide',
                        hide: 'slide',
                        autoOpen: false
                    });

                    $(this).click(function () {
                        approvaldialog.dialog('open');
                    });
                });
            }

            function SetFrozenTaskAutoSuggestionUI() {
                //// 
                //console.log("SetFrozenTaskAutoSuggestionUI called");
                $.widget("custom.catcomplete", $.ui.autocomplete, {
                    _create: function () {
                        this._super();
                        this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
                    },
                    _renderMenu: function (ul, items) {
                        var that = this,
                            currentCategory = "";
                        $.each(items, function (index, item) {
                            var li;
                            if (item.Category != currentCategory) {
                                ul.append("<li class='ui-autocomplete-category'> Search " + item.Category + "</li>");
                                currentCategory = item.Category;
                            }
                            li = that._renderItemData(ul, item);
                            if (item.Category) {
                                li.attr("aria-label", item.Category + " : " + item.label);
                            }
                        });

                    }
                });
            }






            function SetFrozenTaskAutoSuggestion() {

                $("#txtSearchUserFrozen").catcomplete({
                    delay: 500,
                    source: function (request, response) {

                        if (request.term == "") {
                            ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
                            ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
                            $("#txtSearchUserFrozen").removeClass("ui-autocomplete-loading");
                            return false;
                        }

                        $.ajax({
                            type: "POST",
                            url: "ajaxcalls.aspx/GetTaskUsersForDashBoard",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ searchterm: request.term }),
                            success: function (data) {
                                // Handle 'no match' indicated by [ "" ] response
                                if (data.d) {
                                    ////
                                    response(data.length === 1 && data[0].length === 0 ? [] : JSON.parse(data.d));
                                }
                                // remove loading spinner image.                                
                                $("#txtSearchUserFrozen").removeClass("ui-autocomplete-loading");
                            }
                        });
                    },
                    minLength: 0,
                    select: function (event, ui) {
                        //
                        //alert(ui.item.value);
                        //alert(ui.item.id);
                        $("#txtSearchUserFrozen").val(ui.item.value);
                        //TriggerSearch();
                        ShowFrozenTaskSequenceDashBoard(0, ui.item.id);
                        ShowNonFrozenTaskSequenceDashBoard(0, ui.item.id);
                    }
                });
            }

            function SetInProTaskAutoSuggestion() {

                $("#txtSearchUser").catcomplete({
                    delay: 500,
                    source: function (request, response) {

                        if (request.term == "") {
                            var did = $('.' + ddlDesigSeqClientID).val();
                            if (did != undefined)
                                did = $('.' + ddlDesigSeqClientID).val().join();
                            else did = '';

                            ShowTaskSequenceDashBoard(did, '', true);
                            ShowTaskSequenceDashBoard(did, '', false);
                            //ShowAllClosedTasksDashBoard($('.' + ddlDesigSeqClientID).val().join(), $(".chosen-select-users").val().join(), pageSize);
                            $("#txtSearchUser").removeClass("ui-autocomplete-loading");
                            return false;
                        }

                        $.ajax({
                            type: "POST",
                            url: "ajaxcalls.aspx/GetTaskUsersForDashBoard",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ searchterm: request.term }),
                            success: function (data) {
                                // Handle 'no match' indicated by [ "" ] response
                                if (data.d) {
                                    ////;
                                    response(data.length === 1 && data[0].length === 0 ? [] : JSON.parse(data.d));
                                }
                                // remove loading spinner image.                                
                                $("#txtSearchUser").removeClass("ui-autocomplete-loading");
                            }
                        });
                    },
                    minLength: 0,
                    select: function (event, ui) {
                        //;
                        //alert(ui.item.value);
                        //alert(ui.item.id);
                        $("#txtSearchUser").val(ui.item.value);
                        //TriggerSearch();
                        ShowTaskSequenceDashBoard(0, ui.item.id, true);
                        ShowTaskSequenceDashBoard(0, ui.item.id, false);
                        //ShowAllClosedTasksDashBoard(0, ui.item.id, pageSize);
                    }
                });
            }

            function SetInProTaskAutoSuggestionUI() {
                //
                //console.log("SetInProTaskAutoSuggestionUI called");
                $.widget("custom.catcomplete", $.ui.autocomplete, {
                    _create: function () {
                        this._super();
                        this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
                    },
                    _renderMenu: function (ul, items) {
                        var that = this,
                            currentCategory = "";
                        $.each(items, function (index, item) {
                            //
                            var li;
                            if (item.Category != currentCategory) {
                                ul.append("<li class='ui-autocomplete-category'> Search " + item.Category + "</li>");
                                currentCategory = item.Category;
                            }
                            li = that._renderItemData(ul, item);
                            if (item.Category) {
                                li.attr("aria-label", item.Category + " : " + item.label);
                            }
                        });
                    }
                });
            }

            function SetTaskCounterPopup() {

                $('#' +'<%=lblNonFrozenTaskCounter.ClientID%>').click(function () {
                // 
                ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
                ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
            });
            $('#' + '<%=lblFrozenTaskCounter.ClientID%>').click(function () {

                ShowFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
                ShowNonFrozenTaskSequenceDashBoard($('#' + ddlDesigSeqClientIDFrozenTasks).find('option:selected').val(), 0);
            });
        }

        function checkDropdown() {
         <%--   $('#<%=ddlDesigFrozen.ClientID %> [type="checkbox"]').each(function () {
                $(this).click(function () { console.log($(this).prop('checked')); })
            });--%>
        }

            function FreezeTask(sender) {

                var $sender = $(sender);

                var adminCheckBox = $sender.attr('data-id');

                var strTaskId = $sender.attr('data-taskid');
                var strHoursId = $sender.attr('data-hours-id');
                var strPasswordId = $sender.attr('data-id');

                var $tr = $('div.approvepopup[data-taskid="' + strTaskId + '"]');
                var postData;
                var MethodToCall;

                if (adminCheckBox && adminCheckBox.includes("txtAdminPassword")) {
                    postData = {
                        strTaskApprovalId: $tr.find('input[id*="hdnTaskApprovalId"]').val(),
                        strTaskId: strTaskId,
                        strPassword: $tr.find('input[data-id="' + strPasswordId + '"]').val()
                    };
                    MethodToCall = "AdminFreezeTask";
                }
                else {
                    postData = {
                        strEstimatedHours: $tr.find('input[data-id="' + strHoursId + '"]').val(),
                        strTaskApprovalId: $tr.find('input[id*="hdnTaskApprovalId"]').val(),
                        strTaskId: strTaskId,
                        strPassword: $tr.find('input[data-id="' + strPasswordId + '"]').val()
                    };
                    MethodToCall = "FreezeTask";
                }


                CallJGWebService(MethodToCall, postData, OnFreezeTaskSuccess);

                function OnFreezeTaskSuccess(data) {
                    if (data.d.Success) {
                        alert(data.d.Message);
                        HidePopup('.approvepopup')
                    }
                    else {
                        alert(data.d.Message);
                    }
                }
            }

            function FreezeSeqTask(sender) {

                var $sender = $(sender);
                console.log(sender);
                var adminCheckBox = $sender.attr('data-id');
                console.log(adminCheckBox);
                var strTaskId = $sender.attr('data-taskid');
                var strHoursId = $sender.attr('data-hours-id');
                var strPasswordId = $sender.attr('data-id');

                var $tr = $('div.seqapprovepopup[data-taskid="' + strTaskId + '"]');
                var postData;
                var MethodToCall;

                if (adminCheckBox && adminCheckBox.includes("txtngstaffAdminPassword")) {
                    alert('AdminFreezeTask');
                    postData = {
                        strTaskApprovalId: '',
                        strTaskId: strTaskId,
                        strPassword: $tr.find('input[data-id="' + strPasswordId + '"]').val()
                    };
                    MethodToCall = "AdminFreezeTask";
                }
                else {
                    postData = {
                        strEstimatedHours: $tr.find('input[data-id="' + strHoursId + '"]').val(),
                        strTaskApprovalId: '',
                        strTaskId: strTaskId,
                        strPassword: $tr.find('input[data-id="' + strPasswordId + '"]').val()
                    };
                    MethodToCall = "FreezeTask";
                }


                CallJGWebService(MethodToCall, postData, OnFreezeTaskSuccess);

                function OnFreezeTaskSuccess(data) {
                    if (data.d.Success) {
                        alert(data.d.Message);
                        HidePopup('.seqapprovepopup');
                        sequenceScope.refreshTasks();
                    }
                    else {
                        alert(data.d.Message);
                    }
                }
            }

            function FreezeSeqTask(sender, role) {

                var strTaskId = $('#hdnTaskId').val();
                var strHours = '';
                var strPassword = $(sender).val();
                var postData;
                var MethodToCall;

                if (role == 'L') {
                    strHours = $('#txtITLeadHours').val();
                    postData = {
                        strEstimatedHours: strHours,
                        strTaskApprovalId: '',
                        strTaskId: strTaskId,
                        strPassword: strPassword
                    };
                    MethodToCall = "FreezeTask";
                }
                else if (role == 'U') {
                    strHours = $('#txtUserHours').val();
                    postData = {
                        strEstimatedHours: strHours,
                        strTaskApprovalId: '',
                        strTaskId: strTaskId,
                        strPassword: strPassword
                    };
                    MethodToCall = "FreezeTask";
                }
                else {
                    postData = {
                        strTaskApprovalId: '',
                        strTaskId: strTaskId,
                        strPassword: strPassword
                    };
                    MethodToCall = "AdminFreezeTask";
                }             


                CallJGWebService(MethodToCall, postData, OnFreezeTaskSuccess);

                function OnFreezeTaskSuccess(data) {
                    if (data.d.Success) {
                        alert(data.d.Message);
                        HidePopup('.SeqApprovalPopup');
                        sequenceScope.refreshTasks();
                    }
                    else {
                        alert(data.d.Message);
                    }
                }
            }

            function SetInterviewDatePopupEmployeeInstructions(DesigId) {

                var postData;
                var MethodToCall = "GetEmployeeInstructionByDesignationId";
                postData = {
                    DesignationId: DesigId,
                    UsedFor: 1 //constant used for InterviewDate popup from EmployeeInstructionUsedFor in JGConstant.cs file.                   
                };


                CallJGWebService(MethodToCall, postData, OnInterviewDatePopupEmployeeInstructionsSuccess);

                function OnInterviewDatePopupEmployeeInstructionsSuccess(data) {
                    if (data.d) {
                        //console.log(data.d);
                        //var responseObj = JSON.parse(data.d);
                        // if (responseObj) {
                        $('#InterviewInstructions').html(data.d);
                        //}
                    }
                }
            }

            function GetEmployeeInterviewDetails() {

                var EmployeeId = $('#<%=hdnUserId.ClientID%>').val();
            // alert(EmployeeId);
            var postData;
            var MethodToCall = "GetEmployeeInterviewDetails";
            postData = {
                UserId: EmployeeId
            };


            CallJGWebService(MethodToCall, postData, OnEmployeeInterviewDetailsSuccess);

            function OnEmployeeInterviewDetailsSuccess(data) {
                if (data.d) {
                    var responseObj = JSON.parse(data.d);

                    if (responseObj) {
                        $('#ltlApplicantName').html(responseObj[0].FristName + " " + responseObj[0].LastName);
                        $('#ltlApplicantId').html(responseObj[0].UserInstallId);
                        $('#ltlDesignation').html(responseObj[0].Designation);
                        $('#InterviewDateTime').html(responseObj[0].RejectionDate + " " + responseObj[0].RejectionTime);

                        SetInterviewDatePopupEmployeeInstructions(responseObj[0].DesignationId);
                    }
                }
            }
        }

        </script>

        <script type="text/javascript">
            function Paging(sender) {
                $('#PageIndex').val(paging.currentPage);
                ajaxExt({
                    url: '/Sr_App/edituser.aspx/GetUserTouchPointLogs',
                    type: 'POST',
                    data: '{ pageNumber: ' + $('#PageIndex').val() + ', pageSize: ' + paging.pageSize + ', userId: ' + <%=loggedInUserId%> + ' }',
                showThrobber: true,
                throbberPosition: { my: "left center", at: "right center", of: $(sender), offset: "5 0" },
                success: function (data, msg) {
                    if (data.Data.length > 0) {
                        PageNumbering(data.TotalResults);
                        var tbl = '<table cellspacing="0" cellpadding="0"><tr><th>Updated By<br/>Created On</th><th>Note</th></tr>';
                        $(data.Data).each(function (i) {
                            tbl += '<tr id="' + data.Data[i].UserTouchPointLogID + '">' +
                                        '<td><a target="_blank" href="/Sr_App/ViewSalesUser.aspx?id=' + data.Data[i].UpdatedByUserID + '">' + data.Data[i].SourceUser + '<br/>' + data.Data[i].ChangeDateTimeFormatted + '</a></td>' +
                                        '<td title="' + data.Data[i].LogDescription + '"><div class="note-desc">' + data.Data[i].LogDescription + '</div></td>' +
                                    '</tr>';
                        });
                        tbl += '</table>';
                        $('.notes-popup .content').html(tbl);
                        var tuid = getUrlVars()["TUID"];
                        var nid = getUrlVars()["NID"];
                        if (tuid != undefined && nid != undefined) {
                            $('.notes-popup tr#' + nid).addClass('blink-notes');
                            $('html, body').animate({
                                scrollTop: $(".notes-popup").offset().top
                            }, 2000);
                        }
                        $('.pagingWrapper').show();
                        tribute.attach(document.querySelectorAll('.note-text'));
                    } else {
                        $('.notes-popup .content').html('Notes not found');
                        $('.pagingWrapper').hide();
                    }
                }
            });
            return false;
        }
        function addPopupNotes(sender) {
            var userId = '<%=loggedInUserId%>';
            addNotes(sender, userId);
        }
        function addNotes(sender, uid) {
            var note = $(sender).parent().find('.note-text').val();
            var touchPointSource = $(sender).parent().find('.touchPointSource').val();
            if (note != '')
                ajaxExt({
                    url: '/Sr_App/edituser.aspx/AddNotes',
                    type: 'POST',
                    data: '{ id: ' + uid + ', note: "' + note + '", touchPointSource: ' + touchPointSource + ' }',
                    showThrobber: true,
                    throbberPosition: { my: "left center", at: "right center", of: $(sender), offset: "5 0" },
                    success: function (data, msg) {
                        $(sender).parent().find('.note-text').val('');
                        Paging(sender);
                    }
                });
        }
        var pageSize = 20;
        $(document).ready(function () {
            Paging($(this));
        });
        </script>
</asp:Content>
