<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> -->
<!DOCTYPE html>
<html>
<head>
<title>Admin Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexDesign.css">
</head>
<body onload="visitorViewProduct()">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-light "
			style="background-color: #0d0d0d; width: 100%">
			<a class="navbar-brand" > <img
				style="border-radius: 50%;"
				src="${pageContext.request.contextPath}/images/cartlogo.png"
				width="45" height="45" class="d-inline-block align-top"
				alt="cartlogo"> <font face="Segoe Script" color="white"
				size="6px">Laffera</font>
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link"
						onClick="viewOrdinary();"><font
						face="arial" color="White" size="4px">View Products</font> <span
						class="sr-only">(current)</span></a>
						<a class="nav-item nav-link"
						href="${pageContext.request.contextPath}/AddProduct.jsp"><font face="arial" color="White" size="4px">Add
							Products</font></a>
						 <a class="nav-item nav-link"
						href="${pageContext.request.contextPath}/updateProduct.jsp"><font face="arial" color="White" size="4px">Update
							Products</font></a> <a class="nav-item nav-link"
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
	</div>
	<div id="subContent">
		     <div class="container">
		<header>
		  <div class="overlay">
			<h1>Laffera</h1>
			<h3>Reasons for Choosing US</h3>
			<p>We are the leading e-commerce platform in the Philippines. It is a platform tailored for the region, providing both buyers and sellers with an easy, secure and fast online shopping experience through strong payment and logistical support. May you enjoy shopping with different items of different kinds in our online store in an easy way.</p>
		  <br>
		    </div>
		</header>
          <div class="row">
                      <div class="col-lg-2">  
                      </div>  
                  <div class="col-lg-8" align="center">
                    <div class="card"> 
                        <div class="row" id="productListVisitor"> 
                        </div> 
					</div> 
                </div>
				 <div class="col-lg-4"> 
              </div> 
          </div>
        </div>

			<div class="footer-wrap">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<h3>ABOUT Laffera</h3>
							<div class="footer-logo">
								<img
									src="http://hassandesigns.top/html/classified/images/footer-logo.png"
									alt="">
							</div>
							<p style="text-align: justify; text-justify: inter-word;">Laffera
								is the leading e-commerce platform in the Philippines. It is a
								platform tailored for the region, providing both buyers and
								sellers with an easy, secure and fast online shopping experience
								through strong payment and logistical support. With a wide
								selection of product categories ranging from consumer electronics
								to home & living, health & beauty, baby & toys, fashion and
								fitness equipment, Shopee aims to continually enhance its
								platform and become the region’s e-commerce destination of
								choice.</p>
						</div>
	
	
						<div class="col-md-3 col-sm-7">
							<h3>MAIN CATEGORIES</h3>
							<div class="address">Laffera Online Shopping</div>
							<div class="address">80 Ortigas Ave, San Juan, 1500 Metro
								Manila</div>
							<div class="info">
								<i class="fa fa-phone" aria-hidden="true"></i> <a href="#.">(777)
									123 4567</a>
							</div>
							<div class="info">
								<i class="fa fa-fax" aria-hidden="true"></i> <a href="#.">(123)
									456 7890</a>
							</div>
							<h3>Follow Us</h3>
	
							<a href="https://www.youtube.com" target="_blank"> <img
								src="Images/YouTube Logo.png">
							</a> <a href="https://www.spotify.com" target="_blank"> <img
								src="Images/Spotify Logo.png">
							</a> <a href="https://www.facebook.com" target="_blank"> <img
								src="Images/Facebook Logo.png">
							</a>
						</div>
					</div>
					<div class="copyright">Copyright © 2019 Laffera - All Rights
						Reserved.</div>
				</div>
			</div>
		<div align="center"><small>Follow us on Twitter Facebook</small></div>
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

<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/js/viewOrdinary.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script>
function visitorViewProduct(){
	var contextPath = "${pageContext.request.contextPath}";
	$.ajax({
		url : contextPath + "/index",
		method : "POST",
		data : {
			action : "productVisitor",

		},
		success : function(response) {
			$('#productListVisitor').html(response)

		}

	});
}
</script> 
</html>