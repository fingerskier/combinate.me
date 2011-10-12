function BootstrapCtrl() {
}

function EditListCtrl() {
}

function MyCtrl($route) {
	$route.when('/editList', {
			controller: EditListCtrl,
			template: "/view/itemList.html"
	});

	$route.when('/bootstrap', {
		controller: BootstrapCtrl,
		template: 'guide/dev_guide.bootstrap.auto_bootstrap.html'
	});
};
MyCtrl.$inject = ["$route"];

function ItemCtrl($xhr) {
	var scope = this,
		dataURL = fw.service("item", "read");

	scope.loadItems = function() {
		scope.items = [];
		$xhr("GET", dataURL, function(code, response) {
			scope.items = response;
		});
	};

/*
	scope.items = [
		{note:'learn angular', URL:"http://docs.angularjs.org", Active:true},
		{note:'build an angular app', URL:"http://docs.angularjs.org/#!/tutorial", Active:false}
	];
*/

	scope.addItem = function() {
		var thisItem = {Note:scope.noteText, URL:scope.URLtext, Active:false},
			thisURL = fw.service("item", "create");

/*			
		$xhr("POST", thisURL, thisItem, function() {
			scope.items.push(thisItem);
			scope.noteText = '';
			scope.URLtext = '';
		});
*/

		jQuery.ajax({
			data: thisItem,
			success: function() {
				scope.items.push(thisItem);
				scope.noteText = '';
				scope.URLtext = '';
				scope.loadItems();
			},
			type: "POST",
			url: thisURL
		});
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
ItemCtrl.$inject = ["$xhr"];
