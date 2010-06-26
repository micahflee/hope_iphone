var JSInterface = {
	returnValue : null,
	runCommand : function(command) {
		window.location = command;
	},
	getScheduleJSON : function(forceDownload) {
		JSInterface.runCommand('hope://getScheduleJSON');
		return JSInterface.returnValue;
	},
	getNoticeJSON : function(forceDownload) {
		JSInterface.runCommand('hope://getScheduleJSON');
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
	},
	addToCalendar : function(eventJson) {
		JSInterface.runCommand('hope://addToCalendar/'+eventJson);
	},
	haveCalendar : function() {
		JSInterface.runCommand('hope://haveCalendar');
		return JSInterface.returnValue;
	}
}
