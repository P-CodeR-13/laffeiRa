<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Info</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	 <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
	  <script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
	<div class="container-fluid">
	<!-- Content here 	-->
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
		<form action="home" method="POST" name="form1">
        	<a onClick="document.form1.submit()" class="navbar-brand text-white">Go Back</a>
        	 <input type="hidden" name="action" value="loginUser">
        </form> 
		
	</nav>
	<div id="alert" class="alert alert-success" role="alert"
			style="display: none">User Information Successfully Updated!
	</div>
	<form action="home" method="post">
		<div class="row" style="padding-top: 30px;">
		
			<div class="col-lg-4">
			
				<!-- 		 ----	1st Column Here ---- -->
				<div class="card" style="width: 100%;">
					<img src="${pageContext.request.contextPath}/images/userlogo.png"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">User Information</h5>
						<p class="card-text">Hi! ${user.userName}</p>
						<p class="card-text">This is your Account Information</p>
						<p class="card-text">If you want to change info click update
							info!</p>
	
	
						<button id="updateBtn" class="btn btn-primary">
							<span id="loading" style="display: none"
								class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> <span class="sr-only">Loading...</span>Update
							Info
						</button>
	
					</div>
				</div>
	
			</div>
			<!-- 		 ----	2nd Column Here ---- -->
			<div class="col-lg-8">
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="col">
						<label for="inputUsername" style="padding: 5px;">User Name</label>
						<input type="text" class="form-control" placeholder="User Name"
							name="userName"id="userName" value="${user.userName}" readonly>
					</div>
					<div class="col">
						<label for="inputpassword" style="padding: 5px;">Password</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<input id="showPass" type="checkbox">
								</div>
							</div>
							<input type="password" class="form-control" name="password"id="password"
								value="${user.password}" readonly>
						</div>
					</div>
				</div>
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="form-group col-sm-4">
						<label for="inputName" style="padding: 5px;">First Name</label> <input
							type="text" class="form-control" name="firstName"id="firstName"
							placeholder="First Name" value="${user.firstName}">
					</div>
					<div class="form-group col-sm-4">
						<label for="inputZip" style="padding: 5px;">Middle Name</label> <input
							type="text" class="form-control" name="middleName"id="middleName"
							placeholder="Middle Name" value="${user.middleName}">
					</div>
	
					<div class="form-group col-sm-4">
						<label for="inputZip" style="padding: 5px;">Last Name</label> <input
							type="text" class="form-control" name="lastName"id="lastName"
							placeholder="Last Name" value="${user.lastName}">
					</div>
				</div>
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="form-group col-md-4">
						<label for="inputAddress">Email</label> <input type="email"
							class="form-control" name="email"id="email" placeholder="Email Address"
							value="${user.email}">
					</div>
					<div class="form-group col-md-4">
						<label for="inputContactNo">Contact No.</label> <input type="text"
							class="form-control" name="contactNumber"id="contactNumber" placeholder="Contact No."
							value="${user.contactNumber}">
					</div>
					<div class="form-group col-md-4">
						<label for="inputContactNo">Birth Date</label> <input type="date"
							class="form-control" name="birthDate"id="birthDate">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 20px;">
					<label for="inputAddress">Address </label> <input type="text"
						class="form-control" name="address"id="address" placeholder="Unit, Bldg ,Street "
						value="${user.address}">
				</div>
	
	
	
				<div align="center" style="padding-bottom: 20px;">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
						<input class="form-check-input" type="radio" name="gender"
							id="male" value="M"> Male</label>
					</div>
					<div class="form-check form-check-inline">
						<label class="form-check-label">
						<input class="form-check-input" type="radio" name="gender"
							id="female" value="F"> Female</label>
					</div>
				</div>
			</div>
			<input type="hidden" name="action" value="updateUser">
		</div>
	</form>
</div>
<script>
	$('#birthDate').val('${user.birthDate}');
</script>
<c:if test="${user.gender == 'M' || user.gender == 'm'}">
	<script>
		$("input[name='gender'][value='M']").prop('checked', true);
	</script>
</c:if>
<c:if test="${user.gender == 'F' || user.gender == 'f'}">
	<script>
		$("input[name='gender'][value='F']").prop('checked', true);
	</script>
</c:if>
</body>
<script>
	/* var jq = $.noConflict();

	jq(document).ready(function() {
		jq('#updateBtn').click(function() {
			updateInfoOnClick();

		});

		jq('#showPass').click(function() {
			showPass();

		});

	}); */

	$(document).ready(function() {
		$('#updateBtn').click(function() {
			updateInfoOnClick();

		});

		$('#showPass').click(function() {
			showPass();

		});

	});
	
	
	function showPass() {
		if ($('#showPass').is(":checked")) {

			$('#password').attr('type', 'text');
		} else {
			$('#password').attr('type', 'password');
		}
	}

	function updateInfoOnClick() {
		var contextPath = "${pageContext.request.contextPath}";

		var userName = $('#userName').val();
		var password = $('#password').val();
		var firstName = $('#firstName').val();
		var middleName = $('#middleName').val();
		var lastName = $('#lastName').val();
		var email = $('#email').val();
		var birthDate = $('#birthDate').val();
		var address = $('#address').val();
		var contactNumber = $('#contactNumber').val();
		var gender = $("input[name='gender']:checked").val();
		var isNull = false
		var notNum = false
		var isNum = false
		if (userName == "" || password == "" || firstName == ""
				|| middleName == "" || lastName == "" || email == ""
				|| address == "" || contactNumber == "") {
			isNull = true;
			alert("Please Input Fields");
		}

		else if (!(isNaN(firstName)) || !(isNaN(middleName))
				|| !(isNaN(lastName))) {
			isNum = true
			alert("Please input valid name");
		} else if (isNaN(contactNumber)) {
			notNum = true
			alert("Please input valid contactNumber");
		}

		if (isNull == false && isNum == false && notNum == false) {
			$.ajax({
				url : contextPath + "/home",
				method : "POST",
				data : {
					action : "updateUser",
					userName : userName,
					password : password,
					firstName : firstName,
					middleName : middleName,
					lastName : lastName,
					address : address,
					contactNumber : contactNumber,
					email : email,
					birthDate : birthDate,
					gender : gender,

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



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

