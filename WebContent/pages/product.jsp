<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>

	function removeProduct(productId){
		$.ajax({
			url : contextPath + "/removeToCart",
			method : "POST",
			data : {
				action : "removeToCart",
				productId : productId
			},
			success : function(response){
				$("div#productDiv").html(response);
			}
		});
	}
	function updateCart(productId, element){
		try{
			
			console.log("this is " + $("#"+element).val());
			console.log("this is max" + $("#"+element).attr('max'));
			console.log("this is " + $("#"+element).attr('min'));
			if (parseInt($("#"+element).val())
					>parseInt($("#"+element).attr('max'))){
				$("#"+element).attr("value",parseInt($("#"+element).attr('max')));
				$("#"+element).val(""+parseInt($("#"+element).attr('max')));
				updateTableCart(productId, element);
				throw "Please make sure to order items not greater than the stock";
			}
			updateTableCart(productId, element);
		}catch(e){
			alert(e.toString());
		}
	}
	
	function updateTableCart(productId, element){
		$.ajax({
			url : contextPath + "/updateCart",
			method : "POST",
			data : {
				action : "updateCart",
				productId : productId,
				quantity : $("#"+element).val()
			},
			success : function(response){
				$("div#productDiv").html(response);
			}
		});  
	}
	
	 function checkout(){
	 	try {var grandTotal = ${grandTotal};
	 		var payment = $("#payment").val();
	 		if (isNaN(payment) || payment=='')
	 			throw "Please input numbers for payment!!!";
	 		if (!isNaN(payment)){
				if (payment<grandTotal)
					throw "Please pay the due amount!!!";
			}
		 $.ajax({ 
				url : contextPath + "/checkout",
				method : "POST",
				data : {
					action : "checkout",
					payment : payment
				},
				success : function(response){
					window.location.reload();
				}
		 });
	 	}catch (e){
	 		alert(e.toString());
	 	}
	} 
	function paymentProc(){
		var grandTotal = ${grandTotal};
		var payment = $("#payment").val();
		if (!isNaN(payment)){
			$("#change").val(payment-grandTotal);
		}
	}
</script>
<c:if test="${productCartSize != 0}">
	<div class="card"> 
		<h2 class="section-header"> CART </h2>
            	<div id="tableDiv" style="width:100%; margin:2px 0px 0px 2px; border: 1px">
		<table border="1" align="center">
			<thead>
				<tr>
					<th>Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th colspan="2">Number of items to order</th>
					<th>Total per item</th>
				</tr> 
			</thead>
			<tbody>
				<c:forEach var="cart" items="${productCartList}">
					<tr>
						<td><img style="width: 100px; height: 100px;" src="${pageContext.request.contextPath}/images/${cart.image}"></td>
						<td><c:out value="${cart.productName}"/></td>
						<td><c:out value="${cart.productPrice}"/></td>
						<td colspan="2">
							<input name="quantity" type="number" id="item${cart.productId}" min="1" max="${cart.stock}" value="${cart.quantity}" onchange="updateCart('${cart.productId}', 'item${cart.productId}');"/>
							<input name="productId" type="hidden" value="${cart.productId}"/>
							<button onclick="removeProduct('${cart.productId}')">Remove</button>
						</td>
						<td>${cart.productPrice * cart.quantity}</td>
					</tr>
				</c:forEach>
			</tbody> 
		</table>
	</div>
	<div class="cart-total">
		<table>
		<tr>
			<td><strong class="cart-total-title">Total</strong></td>
			<td><span class="cart-total-price">${grandTotal}</span></td>
		</tr>
         <tr>
         	<td><strong class="cart-total-title">Payment</strong></td>
         	<td><span class="cart-total-price"><input type="number" onkeyup="paymentProc()"name="payment" id="payment"/></span></td>
         </tr> 
          <tr>
         	<td><strong class="cart-total-title">Change</strong></td>
         	<td><span class="cart-total-price"><input type="text" name="change" id="change" readOnly/></span></td>
         </tr> 
          </table>
          </div>
    		 <button type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#exampleModalLong">Check
			Out</button>
          <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">Check Out</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        Are you sure you want to check out?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			        <button type="button" class="btn btn-primary" onclick="checkout()">Yes</button>
			      </div>
			    </div>
			  </div>
			</div>
	</div>
</c:if>
