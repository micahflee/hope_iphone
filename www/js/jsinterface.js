var window.JSInterface = {
	returnValue : '',
	doAjaxCall : function(url) {
		$.ajax({
			   url : url,
			   type : 'GET',
			   dataType : 'jsonp'
		});
	},
	getScheduleJSON : function(forceDownload) {
		window.JSInterface.doAjaxCall('hope://getScheduleJSON');
		return window.JSInterface.returnValue;
	},
	getFavorites : function() {
		window.JSInterface.doAjaxCall('hope://getFavorites');
		return window.JSInterface.returnValue;
	},
	saveFavorites : function(favorites) {
		window.JSInterface.doAjaxCall('hope://saveFavorites/'+favorites);
	},
	getFilter : function() {
		window.JSInterface.doAjaxCall('hope://getFilter');
		return window.JSInterface.returnValue;
	},
	saveFilter : function(filter) {
		window.JSInterface.doAjaxCall('hope://saveFilter/'+filter);
	}
}
