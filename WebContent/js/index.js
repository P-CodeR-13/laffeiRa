$(document).ready(function(){
	$("a").bind("mouseover", function(){
		$("a").css("cursor", "pointer");
	});
	
	$(".title").bind('click', function(){
		window.location.assign(contextPath);
	});
	
	$(".title").bind('mouseover', function(){
		$(".title").css("cursor", "pointer");
	});
	
});