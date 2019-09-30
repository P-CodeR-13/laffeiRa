<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="checkCss.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="js/jquery-3.4.1.min.js"></script>
<script> 
function checkout(){
	$.ajax({
		url : contextPath + "/checkout",
		method : "POST",
		data : {
			action : "checkout"
		},
		success : function(response){
			window.location.reload();
		}
	}); 
}
</script> 
</head>
<body background="images/cart.jpg" style="background-size: cover;">
	<div class="main-content">
		<div class="receipt-content">
			<div class="container bootstrap snippet">
				<div class="row">
					<div class="col-md-12">
						<div class="invoice-wrapper">
							<div class="intro">
								<small id="date"></small> <br> 
								<strong> User ID: user_id </strong><br>
								 Hi <strong> User Name </strong>
							</div>
							<div class="line-items">
								<table class="table table-hover table-dark">
									<thead>
										<tr>
											<th scope="col">Product ID</th>
											<th scope="col">Product Name</th>
											<th scope="col">Quantity</th>
											<th scope="col">Price</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cart" items="${productCartList}">
											<tr>
												<td scope="row">${cart.productId}</td>
												<td>${cart.productName}</td>
												<td>${cart.quantity}</td>
												<td>${cart.productPrice * cart.quantity}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="float:left;width:800px;height:200px;">
	</div>
	<div class="total text-right" style="background-color:white;">
		<table align="center" style="text-align:center;margin:20px;">
			<tr>
				<td><label>Total    :</label></td>
				<td><label>${grandTotal}</label></td>
			</tr>
			<tr>
				<td><label>Payment :</label></td>
				<td><input type="text" id="payment" style="width: 80px; border-color: white;"></td>
			</tr>
			<tr>
				<td></td>	
				<td>
					<button type="button" class="btn btn-primary justify-content-end"
						data-toggle="modal" data-target="#exampleModalLong">
						Check Out
					</button>
				</td>
			</tr>
		</table>
	</div>
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
	<script>
		document.getElementById("date").innerHTML = Date();
	</script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>