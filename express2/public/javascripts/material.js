angular.module('myApp', ["ngMaterial"])
  .controller('MyController', ['$scope', function($scope) {
    $scope.users = [
      { id: 1, name: '東京都' },
      { id: 2, name: '埼玉県' },
      { id: 3, name: '神奈川県' }
    ];
    $scope.selectedUser = { id: 1, name: '東京都' };
  }]);
