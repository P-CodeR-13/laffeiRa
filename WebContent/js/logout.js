
$(document).ready(function(){
	$("#logout").click(function(){
		$.ajax({
			url : contextPath + "/logout",
			method : "POST",
			data : {action : "logOut"},
			success : function(response){
				window.location.assign(contextPath + "/login");
			}
		});
	});
});
