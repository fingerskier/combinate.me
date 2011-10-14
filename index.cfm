<cfajaxproxy cfc="service.item" jsclassname="itemServiceProxy">

<!doctype html>
<html xmlns:ng="http://angularjs.org">
	<head>
		<title>combinate.me</title>

		<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/themes/sunny/jquery-ui.css" rel="stylesheet" type="text/css">
		<link href="/css/application.css" rel="stylesheet" type="text/css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
		<script src="http://code.angularjs.org/angular-0.9.19.min.js" ng:autobind></script>
		<script src="/js/framework.js" ng:autobind></script>
		<script src="/js/controllers.js" ng:autobind></script>
	</head>

	<body>
		<h1 align="center" class="ui-corner-all ui-widget-header">combinate.me</h1>
		<br>
		<div ng:controller="MyCtrl">
			<a href="#/itemList">My List</a> |
			<a href="#/account">My Account</a> |
			<a href="#/settings">Settings</a>
			<hr>
			<ng:view></ng:view>
		</div>
	</body>
</html>
