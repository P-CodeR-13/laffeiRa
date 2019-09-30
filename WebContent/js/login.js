$(document).ready(function(){
	$("#btnLogin").click(function(){
		var userName = $("#userName").val();
		var password = $("#password").val();
		$.ajax({
			url : contextPath + "/loginUser",
			method : "POST",
			data : {
				action : "loginUser",
				userName : userName,
				password : password
				},
			success : function(response){
				window.location.reload();
			}
		});
	});
	
$("#btnSignUp").click(function(){
		window.location.assign(contextPath+"/signup.jsp");
	});
});