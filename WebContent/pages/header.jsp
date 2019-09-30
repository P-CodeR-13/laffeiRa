<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center sticky-top">
	<ul class="navbar-nav ">
	  <li>
	  	<img class="title" src="${pageContext.request.contextPath}/images/cartlogo.png" alt="" style="width:50px; height: 50px;"/>
	  	<h1 class="navbar-brand title" >Laffera Online Store</h1>
  	  </li>
  	  <li style="width:550px;float:left;"></li>
      <li class="nav-item"style="float:right;">
    	 <form action="login" method="POST" name="form1">
    	    <a onClick="document.form1.submit()" class="nav-link">Login</a>
    		<input type="hidden" name="action" value="login">
    	</form>
     </li>
      <li class="nav-item"style="float:right;">
     	<form action="signup" method="POST" name="form2">
    		<a onClick="document.form2.submit()" class="nav-link">Sign Up</a>
    		<input type="hidden" name="action" value="signUp">
    	</form>
      </li>
  </ul>
</nav>