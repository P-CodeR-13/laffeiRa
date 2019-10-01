
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Products</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/mdb.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/datatables.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/adminSelect.css"
	rel="stylesheet">
</head>
<body>
	<div id="mainContent">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-light "
			style="background-color: #0d0d0d; width: 100%">
			<a class="navbar-brand" href="#"> <img
				style="border-radius: 50%;"
				src="${pageContext.request.contextPath}/images/cartlogo.png"
				width="45" height="45" class="d-inline-block align-top"
				alt="cartlogo"> <font face="Segoe Script" color="white"
				size="6px">Laffeira</font>
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link active"
						onClick="viewOrdinary();" ><font
						face="arial" color="White" size="4px">View Products</font> <span
						class="sr-only">(current)</span></a>
						<a class="nav-item nav-link"
						href="${pageContext.request.contextPath}/AddProduct.jsp"><font face="arial" color="White" size="4px">Add
							Products</font></a>
						 <a class="nav-item nav-link"
						href="${pageContext.request.contextPath}/updateProduct.jsp"><font face="arial" color="White" size="4px">Update
							Products</font></a>
						 <a class="nav-item nav-link"
						href="${pageContext.request.contextPath}/adminPageAddUser.jsp"><font
						face="arial" color="White" size="4px">Add UserAdmin</font></a> <a
						class="nav-item nav-link"
						href="${pageContext.request.contextPath}/adminPageUpdateUser.jsp"><font
						face="arial" color="White" size="4px">Update User</font></a>
				</div>
			</div>
			<ul class="nav justify-content-end">
				<li class="nav-item">
					<form action="login" method="POST" name="form2">
						<a onClick="document.form2.submit()" class="nav-link">
							<font face="verdana" color="White" size="4px">
							Log Out<input type="hidden" name="action" value="logOut">
							</font>
						</a>
       				 </form> 
				</li>
			</ul>
		</nav>

		<div id="subContent">
			<div id="alert" class="alert alert-success" role="alert"
				style="display: none">New Product Successfully Added!
			</div>
			<div id="alertDanger" class="alert alert-danger" role="alert"
				style="display: none">Adding new product failed!
			</div>
			<div class="row" style="padding-top: 30px;">
					<div class="col-lg-4">
						<div class="card text-center" style="width: 100%;">
							<img src="${pageContext.request.contextPath}/images/adminLogo.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Admin Add Product Page</h5>
								<p class="card-text">Hi!Admin</p>
								<p class="card-text">Add product in this page</p>
								<p class="card-text">click Add product!</p>
								<button id="btnAdd" class="btn btn-primary">
									<span id="loading" style="display: none"
										class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> <span class="sr-only">Loading...</span>Add
									Product
								</button>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="form-row" style="padding-bottom: 20px;">
							<div class="col">
								<label for="inputUsername" style="padding: 5px;">Product
									Id</label> <input type="number" class="form-control"
									placeholder="Product Id" id="productId">
							</div>
							<div class="col">
								<label for="inputpassword" style="padding: 5px;">Product
									Name</label> <input type="text" class="form-control"
									placeholder="Product Name" id="productName">
							</div>
						</div>
						<div class="form-row" style="padding-bottom: 20px;">
							<div class="form-group col-sm-6">
								<label for="inputName" style="padding: 5px;"> Quantity</label> <input
									type="number" class="form-control" id="quantity"
									placeholder="Quantity">
							</div>
							<div class="form-group col-sm-6">
								<label for="inputZip" style="padding: 5px;">Kinds</label> <input
									type="text" class="form-control" id="kinds" placeholder="Kinds">
							</div>
	
						</div>
						<div class="form-row" style="padding-bottom: 20px;">
							<div class="form-group col-sm-6">
								<label for="inputName" style="padding: 5px;"> Price</label> <input
									type="number" step="0.01" class="form-control" id="price"
									placeholder="Price">
							</div>
							
							<div class="form-group col-sm-6">
								<label for="inputZip" style="padding: 5px;">Image Path </label> <input
									type="file" class="form-control" id="image"
									placeholder="Image Path">
							</div>
	
						</div>
						<div class="form-row" style="padding-bottom: 20px;">
							<div class="form-group col-lg-4">
								<label for="inputAddress">Description</label>
								<textarea rows="4" cols="50" id="description" name="field5" class="textarea-field"
									placeholder="Description"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>



<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
<script src="${pageContext.request.contextPath}/js/datatables.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/js/viewOrdinary.js"></script>
<script>
$(document).ready(function() {
	$('#btnAdd').click(function() {
		onClickAddProduct();
		

	});
	clearFields();
});

function clearFields() {
	var productId = $('#productId').val();
	var productName = $('#productName').val();
	var quantity = $('#quantity').val();
	var description = $('#description').val();
	var image = $('#image').val();
	var price = $('#price').val();
	var kinds = $('#kinds').val();
	
	productId = ""
	productName = ""
	firstName = ""
	quantity = ""
	description = ""
	image = ""
	kinds = ""

}

function onClickAddProduct() {
	var contextPath = "${pageContext.request.contextPath}";
	var productId = $('#productId').val();
	var productName = $('#productName').val();
	var quantity = $('#quantity').val();
	var description = $('#description').val();
	var image = $('#image').val();
	var price = $('#price').val();
	var kinds = $('#kinds').val();
	var isNull = false
	var notNum = false
	var isNum = false
	if (productId == "" || productName == "" || quantity == "" || description == "") {
		isNull = true;
		alert("Please Enter Required Fields");
	}  else if (isNaN(productId) || isNaN(quantity) || isNaN(price)) {
		notNum = true
		alert("Please input valid Product Id");
	}
	if( document.getElementById("image").files.length == 0 ){
		isNull = true;
		alert("Please enter file path");
	}
	
	
	if (isNull == false && notNum == false ) {
		$.ajax({
			url : contextPath + "/insertProduct",
			method : "POST",
			data : {
				action : "insertProduct",
				productId : productId,
				productName : productName,
				quantity : quantity,
				description : description,
				image : image,
				price : price,
				kinds : kinds
			},
			success : function(response) {
				$("#alert").fadeIn(1000);
				$("#alert").fadeOut(2000);
				$("#loading").fadeIn(1000);
				setTimeout((function() {
					window.location.reload();
				}), 3000);
				
			}

		});

	}
}
</script>
</html>