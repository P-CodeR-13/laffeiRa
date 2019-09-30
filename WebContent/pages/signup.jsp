<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
 <script> var contextPath = "${pageContext.request.contextPath}";</script>
</head>
<jsp:include page="header.jsp"/>
<body style="background-image: url(${pageContext.request.contextPath}/images/shopping2.jpeg); background-repeat: no-repeat;">
<form action="home" method="POST">
	<div class="container-fluid">
		<div class="card-text-left" style="text-align: center; width: 52%">
			<div class="card-body" style="background-color:white;">
				<h5 class="card-title">Sign Up</h5>
					<div class="container-fluid">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="userName">User Name</label> 
								<input type="text" class="form-control" name="userName"id="userName" placeholder="Username">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Password</label> 
								<input type="password" class="form-control" name="password"id="password" placeholder="Password">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="inputName">First Name</label> <input type="text"
									class="form-control" name="firstName"id="firstName" placeholder="First Name">
							</div>
							<div class="form-group col-md-4">
								<label for="inputZip">Middle Name</label> <input type="text"
									class="form-control"name="middleName" id="middleName" placeholder="Middle Name">
							</div>
							<div class="form-group col-md-4">
								<label for="inputZip">Last Name</label> <input type="text"
									class="form-control" name="lastName"id="lastName" placeholder="Last Name">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="inputAddress">Email</label> <input type="email"
									class="form-control"name="email" id="email" placeholder="Email Address">
							</div>
							<div class="form-group col-md-4">
								<label for="inputContactNo">Contact No.</label> <input
									type="text" class="form-control" name="contactNumber"id="contactNumber"
									placeholder="Contact No.">
							</div>
							<div class="form-group col-md-4">
								<label for="inputContactNo">Birth Date</label> <input type="date"
									class="form-control" name="birthDate"id="birthDate">
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">Address </label> <input type="text"
								class="form-control" name="address"id="address"
								placeholder="Unit, Bldg ,Street ">
						</div>
	
						<div class="form-check form-check-inline">
							<label class="form-check-label"><input
								class="form-check-input" type="radio" name="gender" id="male"
								value="M">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"><input
								class="form-check-input" type="radio" name="gender" id="female"
								value="F">Female</label>
	
						</div>
						<div style="padding-top: 15px;" align="center">
						</div>
					</div>
					<input type="hidden" name="action" value="insertUser">
					<button class="btn btn-secondary btn-lg"
							type="submit">SignUp</button>
			
			</div>
		</div>
		<div id="alert" class="alert alert-success" role="alert" style="display: none">Registration Successful!!!</div>
	</div>
</form>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/index.js"></script> 
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
<script>
var errorMessageUserName='${errorMessageUserName}'
	var errorMessageEmail='${errorMessageEmail}'
	if(errorMessageUserName!=''){
		alert(errorMessageUserName);
	}
	if(errorMessageEmail!=''){
		alert(errorMessageEmail);
	}
	
	
	var contextPath = "${pageContext.request.contextPath}";
	$(document).ready(function() {
	
			
	});

	function onClickSignUp() {

		var userName = $('#userName').val();
		var password = $('#password').val();
		var firstName = $('#firstName').val();
		var middleName = $('#middleName').val();
		var lastName = $('#lastName').val();
		var email = $('#email').val();
		var birthDate = $('#birthDate').val();
		var address = $('#address').val();
		var userType = "ORDINARY";
		var contactNumber = $('#contactNumber').val();
		var gender = $("input[name='gender']:checked").val();
		var isNull = false
		var notNum = false
		var isNum = false
		if (userName == "" || password == "" || firstName == ""
				|| middleName == "" || lastName == "" || email == ""
				|| address == "" || contactNumber == "" || gender == "" || birthDate == "") {
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
		console.log("I enter after ifs");
		if (isNull == false && isNum == false && notNum == false) {
			console.log("I enter before ajax");
			$.ajax({
				url : contextPath + "/home",
				method : "POST",
				data : {
					action : "insertUser",
					userName : userName,
					password : password,
					firstName : firstName,
					middleName : middleName,
					lastName : lastName,
					address : address,
					contactNumber : contactNumber,
					email : email,
					userType : userType,
					birthDate : birthDate,
					gender : gender

				},
				success : function(response) {console.log("I enter here");
					$("#alert").fadeIn(1500);
					$("#alert").fadeOut(2500);
					/* $.ajax({
						url : "",
						method : "POST",
						data : {
							action:"loginUser",
							userName : userName,
							password : password
						},
						success
					}); */
				}
			});
		}

	}
</script>
</html>
