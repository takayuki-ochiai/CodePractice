angular.module('myApp', [])
  .controller('MyController', ['$scope', function($scope) {
    $scope.myName = 'oti';
    $scope.greeting = 'こんにちは';
    $scope.placeholder = 'hogehoge';
  }]);
