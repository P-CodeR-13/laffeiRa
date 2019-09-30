
function viewOrdinary(){
	console.log("fdsf");
	$.ajax({
		url : contextPath + "/home",
		method : "POST",
		data : {action : "viewOrdinary"},
		success : function(response){console.log("I enter viewOrdinary");
			$("#subContent").html(response);console.log("success");
		}
	});
}