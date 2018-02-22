<%@ Page Language="C#" MasterPageFile="~/Sr_App/SR_app.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ITDashboardCalendar.aspx.cs" Inherits="JG_Prospect.Sr_App.ITDashboardCalendar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #calendar{
            margin-top: 44px;
            background-color: #fff;
            padding: 10px;
        }
        .refresh{
                height: 20px;
                cursor: pointer;
                box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
                padding: 5px;
                background-color: #fff;
            }
        .eventRow{
            padding: 6px !important;
            font-size: 12px !important;
        }
        .fc-content{
            line-height: 26px;
        }
        .fc-content div{
            margin-left:8px;
        }
        .InstallId{
            margin-left: 12px;
            background-color: #fff;
            padding: 5px;
            border-radius: 8px;            
        }
        .UserInstallId{
            margin-left: 0px;
            background-color: #fff;
            padding: 5px;
            border-radius: 8px;            
        }
        #hidden{
            display:none;
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
        
    </style>
    
    <link rel="stylesheet" href="../js/fullcalendar/css/fullcalendar.css" />        
    <script type="text/javascript" src="../js/fullcalendar/js/moment.min.js"></script>    
    <script type="text/javascript" src="../js/fullcalendar/js/fullcalendar.min.js"></script>
    <script type="text/javascript" src="../js/angular/scripts/jgapp.js"></script>        
    <script src="../js/angular/scripts/TaskSequence.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ('<%=IsSuperUser.ToString().ToLower().Trim()%>' == 'true') {
                $.noConflict();
                $('#refreshInProgTasks').on('click', function () {                    
                    $('#calendar').fullCalendar('refetchEvents');
                });
            } else {
                $('#refreshInProgTasks').on('click', function () {
                    //$.noConflict();
                    $('#calendar').fullCalendar('refetchEvents');
                });
            }
            

            sequenceScope.LoadCalendarData();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_panel" ng-app="JGApp" ng-controller="TaskSequenceSearchController">
        <!-- appointment tabs section start -->
        <ul class="appointment_tab">
            <li><a href="home.aspx">Sales Calendar</a></li>
            <li><a href="GoogleCalendarView.aspx">Master  Calendar</a></li>
            <li><a href="ITDashboard.aspx">Operations Calendar</a></li>
            <li><a href="CallSheet.aspx">Call Sheet</a></li>
            <li id="li_AnnualCalender" visible="false" runat="server"><a href="#" runat="server">Annual Event Calendar</a> </li>
        </ul>
        <!-- appointment tabs section end -->

        <h1><b>IT Dashboard</b></h1>
        <h2 runat="server">
            All Tasks
        </h2>
        <div id="ViewTab">
            <ul class="appointment_tab" style="margin-top: -8px;margin-right: -6px;">
                <li><a href="ITDashboard.aspx">Tasklist View</a></li>
                <li><a href="ITDashboardCalendar.aspx" class="active">Calendar View</a></li>
            </ul>
        </div>
        <img src="/img/ajax-loader.gif" class="refresh" id="loading" style="display:none;position: absolute;">
        <img src="/img/refresh.png" class="refresh" id="refreshInProgTasks" style="float: right;">
        <div id="calendar">

        </div>
    </div>
</asp:Content>
