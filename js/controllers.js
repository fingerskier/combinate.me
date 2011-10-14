var itemService = new itemServiceProxy();

function BootstrapCtrl() {
}

function EditListCtrl() {
}

function MyCtrl($route) {
	$route.when('/itemList', {
			controller: EditListCtrl,
			template: "/view/itemList.html"
	});

	$route.when('/account', {
		controller: BootstrapCtrl,
		template: '/view/account.html'
	});
};
MyCtrl.$inject = ["$route"];

function ItemCtrl($xhr, $route) {
	var scope = this;
		
	scope.loadItems = function() {
		scope.items = [];
		
		itemService.setCallbackHandler(function(response) {
			scope.items = response;
		});
		itemService.read();
	};

	scope.addItem = function() {
		var thisItem = {Note:scope.noteText, URL:scope.URLtext, Active:false},
			thisURL = fw.service("item", "create");

		$xhr("GET", thisURL + "&argumentCollection=" + angular.toJson(thisItem), {argumentCollection: thisItem}, function() {
			scope.items.push(thisItem);
			scope.noteText = '';
			scope.URLtext = '';
		});

/*
		itemService.setCallbackHandler(function() {
			scope.items.push(thisItem);
			scope.noteText = '';
			scope.URLtext = '';
		});
		itemService.create(scope.noteText, scope.URLtext, false);
 */
	};

	scope.remaining = function(){
		return angular.Array.count(scope.items, function(item) {
			return !item.Active;
		});
	};

	scope.removeActive = function() {
		var inactiveIDs = [],
			oldItems = scope.items,
			thisURL = fw.service("item", "hideInactives");

		scope.items = [];
		
		angular.forEach(oldItems, function(item) {
			if (!item.Active) scope.items.push(item);
			else inactiveIDs.push(item.ID);
		});
		
		jQuery.ajax({
			data: {
				inactiveIDs: inactiveIDs.join()
			},
			type: "POST",
			url: thisURL
		});
	};

	scope.loadItems();
}
ItemCtrl.$inject = ["$xhr", "$route"];
