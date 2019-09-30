<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title> Laffeira Log In </title>
    <link rel="shortcut icon" href="../favicon.ico"> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/modernizr.custom.86080.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/LoginStyle.css">   
    <script> var contextPath = "${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script> 
</head>
	<jsp:include page="header.jsp"/>
    <body id="page">
        <ul type="none" class="cb-slideshow">
            <li><span>Image 01</span><div><h3>Laffera</h3></div></li>
            <li><span>Image 02</span><div><h3>Online</h3></div></li>
            <li><span>Image 03</span><div><h3>Shopping</h3></div></li>
            <li><span>Image 04</span><div><h3></h3></div></li>
            <li><span>Image 05</span><div><h3></h3></div></li>
            <li><span>Image 06</span><div><h3></h3></div></li>
        </ul>
    <div class="login-box">
	    <img src="${pageContext.request.contextPath}/images/avatar.png" class="avatar">
	        <h1>Login Here</h1>
	            <form action="home" method="POST">
		            <p>Username</p>
		            <input type="text" id="userName" name="userName" placeholder="Enter Username">
		            <p>Password</p>
		            <input type="password" id="password" name="password" placeholder="Enter Password">
		            <input type="submit" id="btnLogin" name="submit" value="Login">
		            <input type="hidden" name="action" value="loginUser">
		            <c:if test="${errorMessageLogin != ''}">
		           		 <p style="color:red;">${errorMessageLogin}</p>
		            </c:if>
		            
	            </form>
    </div>
</body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
</html>