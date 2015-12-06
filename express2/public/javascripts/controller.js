// amgularでは名前空間を使って管理する機能をangular.moduleとして提供している
// 新規のモジュールを作成するならばまずはモジュール名と空の配列を渡すと覚えること
angular.module('myApp', [])
  // コントローラーを作成する
  // $scopeはDOMとJSのモデルとを橋渡しするためのオブジェクト。テンプレートで利用する値や挙動はスコープを
  // 介して受け渡しするのが基本
  // angularJSの世界ではコントローラーはスコープをセットアップするためのコンポーネント
  .controller('MyController', function($scope) {
    $scope.msg = 'こんにちは、AngularJSたち!';

    // books用
    $scope.books = [
      {
        isbn: '978-4-7741-7078-7',
        title: 'サーブレット&JSPリファレンス',
        price: 2680,
        publish: '技術評論社',
        published: new Date(2015, 10, 8)
      },
      {
        isbn: '978-4-7741-6127-3',
        title: 'iphone/ipad開発ポケットリファレンス',
        price: 2780,
        publish: '技術評論社',
        published: new Date(2013, 10, 23)
      }
    ]
  })
