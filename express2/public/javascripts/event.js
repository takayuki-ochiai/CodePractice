angular.module('myApp', [])
  .controller('MyController', ['$scope', function($scope) {
    $scope.greeting = 'こんにちは、落合さん！';

    $scope.onclick = function() {
      $scope.greeting = 'こんにちは、' + $scope.myName + 'さん！';
    }
  }]);
