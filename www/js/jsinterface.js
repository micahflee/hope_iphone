var JSInterface = {
	returnValue : null,
	runCommand : function(command) {
		$("#jsinterface").html('<iframe src="'+command+'"></iframe>');
	},
	getScheduleJson : function(forceDownload) {
		if(forceDownload)
			JSInterface.runCommand('hope://getScheduleJson/true');
		else
			JSInterface.runCommand('hope://getScheduleJson/false');
		return JSInterface.returnValue;
	},
	getNoticeJson : function() {
		JSInterface.runCommand('hope://getNoticeJson');
		return JSInterface.returnValue;
	},
	getFavorites : function() {
		JSInterface.runCommand('hope://getFavorites');
		return JSInterface.returnValue;
	},
	saveFavorites : function(favorites) {
		JSInterface.runCommand('hope://saveFavorites/'+favorites);
	},
	getFilter : function() {
		JSInterface.runCommand('hope://getFilter');
		return JSInterface.returnValue;
	},
	saveFilter : function(filter) {
		JSInterface.runCommand('hope://saveFilter/'+filter);
	}
}