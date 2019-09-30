
<form action="home" method="POST" name="form1">
	<button id="btnLogin" onClick="document.form1.submit()"></button>
	<input type="hidden" name="action" value="loginUser"/>
</form>
<script>
	document.getElementById("btnLogin").click();
</script>