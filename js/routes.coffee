`// @ngInject`
module.exports = ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/state1"
  $stateProvider.state("state1",
    url: "/state1"
    templateUrl: "templates/page1.html"
    controller: 'Page1Ctrl'
  ).state("state2",
    url: "/state2"
    templateUrl: "templates/page2.html"
    controller: 'Page2Ctrl'
  )
