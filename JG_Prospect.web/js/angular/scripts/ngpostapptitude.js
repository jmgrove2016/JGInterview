app.controller('PostApptitude', function ($scope, $compile, $http, $timeout, $filter) {
    _applyFunctions($scope, $compile, $http, $timeout, $filter);
});
app.filter('trustAsHtml', function ($sce) { return $sce.trustAsHtml; });

function callWebServiceMethod($http, methodName, filters) {
    return $http.post(url + methodName, filters);
};

function _applyFunctions($scope, $compile, $http, $timeout, $filter) {

    //Create a Scope
    sequenceScopePA = $scope;
    $scope.Romans = [];
    $scope.Task = [];
    /* Task related methods starts */
    $scope.expandTask = function (TaskId) {

        $('#LoadingRomansDiv' + TaskId).show();
        callWebServiceMethod($http, "GetMultiLevelList", { ParentTaskId: TaskId, chatSourceId: 2 }).then(function (data) {
            $('#LoadingRomansDiv' + TaskId).hide();
            var resultArray = JSON.parse(data.data.d);
            var results = resultArray.Results;
            $scope.Romans = $scope.Romans.concat($scope.correctDataforAngular(results));
            console.log($scope.Romans);
            if ($scope.Romans.length < 1) {
                $('#LoadingRomans' + TaskId).html('No data found.');
                $('#LoadingRomansDiv' + TaskId).show(500);
            }
        });
    }
    /* Task related methods ends */

    /* Resources methods starts */

    $scope.getFilesByDesignation = function (locationId, designationId) {
        getFilesByDesignation($scope, $http, locationId, designationId);
    }

    /* Resources methods ends */

    //Helper Functionss
    $scope.correctDataforAngular = function (ary) {
        var arr = null;
        if (ary) {
            if (!(ary instanceof Array)) {
                arr = [ary];
            }
            else {
                arr = ary;
            }
        }
        return arr;
    }
}

function getFilesByDesignation($scope, $http, locationId, designationId) {
    callWebServiceMethod($http, "GetFilesByDesignationId", { locationId: locationId, DesignationId: designationId })
        .then(function (data) {
            var resourceTypes = getResponse(data);
            $scope.DesignationResources = resourceTypes;
        });

}

function getResponse(data) {
    try {
        if (data && data.data && data.data.d && data.data.d != '')
            return jsonResult = JSON.parse(data.data.d);
        else
            return [];
    }
    catch (e) {
        return [];
    };
};