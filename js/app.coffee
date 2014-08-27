require '../bower_components/angular/angular.min.js'
require '../bower_components/angular-ui-router/release/angular-ui-router.min.js'
require './templates.js'
angular.module("MyApp", ['ui.router', 'templates-prepare']).config require './routes.js'
angular.module('MyApp').controller('Page1Ctrl', require './controllers/Page1Ctrl.js')
angular.module('MyApp').controller('Page2Ctrl', require './controllers/Page2Ctrl.js')
