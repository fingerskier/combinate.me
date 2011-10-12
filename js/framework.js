var fw = {
	root: "http://localhost:8050/",
	buildURL: function(action) {
		var action = "index.cfm?action=" + action;
		
		return fw.root + action;
	},
	service: function(CFC, method) {
		return fw.root + "service/" + CFC + ".cfc?method=" + method;
	}
};
