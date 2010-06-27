var data = {
    d : null, 
    load : function() {
		alert('data.load() - about to load schedule data');
		var json = JSInterface.getScheduleJSON(false);
		alert('data.load() - json data is: '+json);
		data.d = JSON.parse(json);
		alert('data.load() - schedule data loaded');
    },
    load_force : function() {
        data.d = JSON.parse(JSInterface.getScheduleJSON(true));
    },
    numberOfTalks : function() {
        return data.d.length;
    },
    talks : function() {
        return data.d;
    },
    talk_by_id : function(wanted) {
        var i, n = data.d.length;
        for(i = 0; i < n; ++i) {
          var talk = data.d[i];
          if (talk.id == wanted)
            return talk;
        }
        return undefined;
    }
};
