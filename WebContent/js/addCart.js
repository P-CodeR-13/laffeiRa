function getCategoryIndex(productId) {
		$.ajax({
			url : contextPath + "/addToCart",
			method : "POST",
			data : {
				action : "addToCart",
				productId : productId
			},
			success : function(response){
				$("div#productDiv").html(response);
			}
		});
	}