app.controller('SalesUserController', function ($scope, $compile, $http, $timeout, $filter) {
    _applyFunctions($scope, $compile, $http, $timeout, $filter);
});
function callWebServiceMethod($http, methodName, filters, sender) {
    return $http.post(url + methodName, filters);
};
function _applyFunctions($scope, $compile, $http, $timeout, $filter) {
    //var list = '[{"Id": 10},{"Id": 10},{"Id": 10},{"Id": 10},{"Id": 10},]';

    $scope.UserList = [];
    $scope.UserEmailList = [];
    $scope.UserPhoneList = [];
    $scope.Test = { 'Id': 100 };
    $scope.PhoneCallLogList = [];
    $scope.PhoneCallStatistics = {};
    $scope.ReminderEmailContent = {};

    $scope.GetPhoneCallLogList = function (sender) {
        ShowAjaxLoader();
        callWebServiceMethod($http, 'GetPhoneCallLog', { index: 1, pageSize: 20 }, sender)
            .then(function (data) {
                HideAjaxLoader();
                $scope.PhoneCallLogList = JSON.parse(data.data.d);
                RemoveThrobber();
            });
        callWebServiceMethod($http, 'GetPhoneCallStatistics', {}, sender)
            .then(function (data) {
                HideAjaxLoader();
                $scope.PhoneCallStatistics = JSON.parse(data.data.d).Object;
                RemoveThrobber();
            });
    }

    $scope.GetReminderEmailContent = function (sender) {
        var uid = $(sender).parents('tr').attr('userid');
        ShowAjaxLoader();
        callWebServiceMethod($http, 'GetReminderEmailContent', { userId: uid }, sender)
            .then(function (data) {
                HideAjaxLoader();
                $scope.ReminderEmailContent = JSON.parse(data.data.d);
                $('#reminerEmail').show();
                $('.overlay').show();
                $('#reminderEmailBody').val($scope.ReminderEmailContent.Object.Body);
                SetCKEditorForTaskPopup('reminderEmailBody');
                RemoveThrobber();
                setTimeout(function () {
                    var sW = $(window).width();
                    var pW = $('#reminerEmail').width();
                    $('#reminerEmail').css({ 'left': ((sW / 2) - (pW / 2)) + 'px' });
                }, 100);
            });
    }

    $scope.Paging = function (sender) {
        $('#PageIndex').val(paging.currentPage);
        paging.pageSize = $('.recordsPerPage').find('option:selected').val();
        var keyword = $('.userKeyword').val().trim();
        var status = $('div.user-status select').find('option:selected').val();
        var designationId = $('div.designationId select').find('option:selected').val();
        var source = $('div.source select').find('option:selected').val();
        var from = $('input.fromDate').val();
        var to = $('input.toDate').val();
        var addedBy = $('div.addedBy select').find('option:selected').val();
        var sortBY = 'LastLoginTimeStamp DESC';
        if (from == '' || from == null || from.toLowerCase() == 'all')
            from = '01/01/1999';
        if (to == '' || to == null)
            to = '01/01/2080';

        //JG Chat 06/14/2018 - make default .net designation and last added on.
        //if (typeof designationId == 'undefined' || designationId == "" || designationId == "0") {
            //designationId = 9;
        sortBY = $('#ddlSavedReports').val();
        //}

        ShowAjaxLoader();
        callWebServiceMethod($http, 'GetSalesUsers', { startIndex: $('#PageIndex').val(), pageSize: paging.pageSize, keyword: keyword, status: status, designationId: designationId, source: source, from: from, to: to, addedByUserId: addedBy, sortBY: sortBY }, sender)
            .then(function (data) {
                HideAjaxLoader();
                $('.play-stop').show();
                // Reset Auto-Dialer
                stopAutoDiualer(this);

                RemoveThrobber();
                $scope.UserList = JSON.parse(data.data.d);
                PageNumbering($scope.UserList.TotalResults);

                // Reset Phone Dialer list
                if (salesUsers != undefined && salesUsers != null) {
                    salesUsers.length = 0;
                }

                //userDesignations
                var str = '', options = '';
                setTimeout(function () {
                    options = $('.userlist-grid .header-table .user-designations').find('select').html();
                    str = '<select class="" onchange="ChangeDesignation(this)">' + options + '</select>';
                    $('#SalesUserGrid').find('.userDesignations').each(function (i) {
                        var did = $(this).attr('did');
                        $(this).html(str);
                        $(this).find('option:nth-child(1)').remove();
                        $(this).find('select').val(did);
                    });

                    options = $('.userlist-grid .header-table .user-status').find('select').html();
                    str = '<select class="" onchange="ChangeUserStatus(this)">' + options + '</select>';
                    $('#SalesUserGrid').find('.status').each(function (i) {
                        var stid = $(this).attr('stid');
                        $(this).html(str);
                        $(this).find('option:nth-child(1)').remove();
                        $(this).find('select').val(stid);
                    });

                    $('#SalesUserGrid').find('.secondary-status').each(function (i) {
                        var stid = $(this).attr('secid');
                        $(this).find('select').val(stid);
                    });

                    options = $('.userlist-grid .header-table .employmentTypes').find('select').html();
                    str = '<select class="" onchange="updateEmpType(this)">' + options + '</select>';
                    $('#SalesUserGrid').find('.employmentTypes').each(function (i) {
                        var empType = $(this).attr('empType');
                        $(this).html(str);
                        $(this).find('select').val(empType);
                    });

                    options = $('.userlist-grid .header-table .phoneTypes').find('select').html();
                    str = '<select class="" onchange="setWatermark(this)">' + options + '</select>';
                    $('#SalesUserGrid').find('.phoneTypes').each(function (i) {
                        // var empType = $(this).attr('empType');
                        $(this).html(str);
                        //$(this).find('select').val(empType);
                    });
                    $('#SalesUserGrid').find('select').find('option').removeAttr('data-ng-repeat');
                    $('#SalesUserGrid').find('select').find('option').removeAttr('class');
                    $('#SalesUserGrid').find('select').chosen({ width: '100%' });

                    $('.header-table .pageNumber').html(paging.currentPage + 1);
                    $('.header-table .pazeSize').html(paging.pageSize);
                    $('.header-table .totalRecords').html($scope.UserList.TotalResults);

                    // Loading Notes
                    ReLoadNotes();

                    //

                }, 100);
            });
    }

    sequenceScopePhone = $scope;
}