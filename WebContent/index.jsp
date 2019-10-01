<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Laffera Online Store</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexDesign.css">
    
</head>
<body onload="visitorViewProduct()">
 <jsp:include page="pages/header.jsp"/>
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
            <div class="footer-logo"><img src="http://hassandesigns.top/html/classified/images/footer-logo.png" alt=""></div>
            <p style=" text-align: justify;
           text-justify: inter-word;">Laffera is the leading e-commerce platform in the Philippines. It is a platform tailored for the region, providing both buyers and sellers with an easy, secure and fast online shopping experience through strong payment and logistical support. With a wide selection of product categories ranging from consumer electronics to home & living, health & beauty, baby & toys, fashion and fitness equipment, Shopee aims to continually enhance its platform and become the region’s e-commerce destination of choice.</p>
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
		<div align="center"><small>Follow us on Twitter Facebook</small></div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script> var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
