// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
(function(){

	var app = angular.module('newsApp', []);
	app.controller('dataCtrl', function($scope, $http, $timeout) {
		
		$scope.menu = [
			{"title": "Home", "link": "http://localhost:8888/json"},
			{"title": "Trouw", "link": "http://localhost:8888/trouw"},
			{"title": "Volkskrant", "link": "http://localhost:8888/volkskrant"},
			{"title": "Ad", "link": "http://localhost:8888/ad"}
		];

		$scope.url = "http://localhost:8888/json";
		$scope.getData = function(url){
		    $http.get(url)
		    .success(function(response) {

		    	$scope.list = response;
		    	console.log($scope.url);
		    });
		};
		$scope.getData($scope.url);
	    	$scope.intervalFunction = function(url){
		    $timeout(function() {
		      $scope.getData(url);
		      $scope.intervalFunction();
		    }, 60000)
		  };

		$scope.intervalFunction($scope.url);
	});

})();
