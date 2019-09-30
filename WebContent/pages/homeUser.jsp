<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Laffera Online Shopping</title>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style3.css" type="text/css">

</head>
<body>
	<div style="float:left;">
		<nav class="navbar navbar-expand-xl bg-dark navbar-dark fixed-top" style="padding-left: 50px;">
 			<label class="text-white">Hello, ${user.firstName} ${user.middleName} ${user.lastName} !!!</label>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
   				 <span class="navbar-toggler-icon"></span>
 			</button>
			  <div class="collapse navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav">
			      <li class="nav-item">
			      	<form action="updateInfo" method="POST" name="form1">
			        	<a onClick="document.form1.submit()" onmouseover="cursor:pointer" class="nav-link">Update Information</a>
			        	<input type="hidden" name="action" value="getUser">
			        </form> 
			      </li>    
			      <li class="nav-item">
			      	 <form action="login" method="POST" name="form2">
			        	<a onClick="document.form2.submit()" class="nav-link">Log Out</a>
			        	 <input type="hidden" name="action" value="logOut">
			        </form> 
			      </li> 
			    </ul>
			  </div>  
		</nav>
	</div>
	<br>
 	<img src="images/greeen.jpg" class="img-fluid" alt="header image">
	<div class="container-fluid">  <!-- start ng main container -->
		<div class="row"> <!-- start ng row -->

			<div class="col-lg-2">  
			</div>  

	<div class="col-lg-8" align="center"> 
			<div class="card"> 
			 	 <h5 class="card-header"></h5>
				<hr>
	<div class="row"> 
			 <c:forEach var="prod" items="${prodList}" varStatus="loop">
			 	<div class="col-sm-4">
				<div class="card" style="width: 10rem;">
  					<img src="${pageContext.request.contextPath}/images/${prod.image}"  alt="image" class="card-img-top"/>
  					<div class="card-body">
    					<h5 id="cart-name" class="card-title"> ${prod.productName} </h5>
    					<p  id="cart-description" style="font-size: 8px;"> ${prod.description}</p>
    					<p id="cart-price" class="card-text"> P${prod.price}</p>
    					<button onclick="getCategoryIndex('${prod.productId}');"  class="btn btn-primary">Add to Cart</button>
  					</div>
				</div>
				</div>
			</c:forEach>	 
		</div><br>
		<div id="productDiv">
			<jsp:include page="product.jsp"></jsp:include>
		</div>
		</div> <!-- end main content -->
		</div> <!-- end middle container -->

		<div class="col-lg-4">   <!-- last container -->
		</div> <!-- end last container -->
		
	</div> <!-- end ng class container -->

<!--footer start-->
		<div class="footer-wrap">
				<div class="container-fluid">
				<div class="row">
				  <div class="col-md-6 col-sm-6">
				    <h3>ABOUT Laffera</h3>
				    <div class="footer-logo"><img src="http://hassandesigns.top/html/classified/images/footer-logo.png" alt=""></div>
				    <p style=" text-align: justify;
 					 text-justify: inter-word;">Laffera is the leading e-commerce platform in San Juan Philippines. It is a platform tailored for the region, providing both buyers and sellers with an easy, secure and fast online shopping experience through strong payment and logistical support. With a wide selection of product categories ranging from consumer electronics to home & living, health & beauty, baby & toys, fashion and fitness equipment, Shopee aims to continually enhance its platform and become the region’s e-commerce destination of choice.</p>
				  </div>
		
				 
				  <div class="col-md-3 col-sm-7">
				    <h3>MAIN CATEGORIES</h3>
				    <div class="address">Laffera Online Shopping </div>
				    <div class="address">80 Ortigas Ave, San Juan, 1500 Metro Manila </div>
				    <div class="info"><i class="fa fa-phone" aria-hidden="true"></i> <a href="#.">(777) 123 4567</a></div>
				    <div class="info"><i class="fa fa-fax" aria-hidden="true"></i> <a href="#.">(123) 456 7890</a></div>
				    <h3> Follow Us </h3>
				  
				     <a href="https://www.youtube.com" target="_blank">
                            <img src="Images/YouTube Logo.png"> </a>

				       <a href="https://www.spotify.com" target="_blank">
                            <img src="Images/Spotify Logo.png">
                        </a> 
				     <a href="https://www.facebook.com" target="_blank">
                            <img src="Images/Facebook Logo.png">
                        </a>
				  </div>
				</div>
			<div class="copyright">Copyright © 2019 Laffera - All Rights Reserved.</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/addCart.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	
</html>

