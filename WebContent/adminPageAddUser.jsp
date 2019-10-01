<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	<link href="${pageContext.request.contextPath}/css/datatables.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/adminSelect.css"
	rel="stylesheet">
</head>
<body onload="getUserList()">
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
			<table id="dataTable" class="table table-hover">
				<thead>
					<tr>
						<th scope="col">User Name</th>
						<th scope="col">Password</th>
						<th scope="col">First Name</th>
						<th scope="col">Middle Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Address</th>
						<th scope="col">Contact Number</th>
						<th scope="col">Email</th>
						<th scope="col">UserType</th>
						<th scope="col">Birth Date</th>
						<th scope="col">Gender</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.userName}</td>
							<td>${user.password}</td>
							<td>${user.firstName}</td>
							<td>${user.middleName}</td>
							<td>${user.lastName}</td>
							<td>${user.address}</td>
							<td>${user.contactNumber}</td>
							<td>${user.email}</td>
							<td>${user.userType}</td>
							<td>${user.birthDate}</td>
							<td>${user.gender}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		<div id="alert" class="alert alert-success" role="alert"
			style="display: none">User Information Successfully Added!</div>
		<div id="alertDanger" class="alert alert-danger" role="alert"
			style="display: none">User Information submitted failed!</div>

		<div class="row" style="padding-top: 30px;">
			<div class="col-lg-4">
				<!-- 		 ----	1st Column Here ---- -->
				<div class="card" style="width: 100%;">
					<img src="${pageContext.request.contextPath}/images/adminLogo.png"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Admin User Page</h5>
						<p class="card-text">Hi!Admin</p>
						<p class="card-text">Add user in this page</p>
						<p class="card-text">if you want add Admin click Add Admin!</p>


						<button id="addUserBtn" class="btn btn-primary">
							<span id="loading" style="display: none"
								class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> <span class="sr-only">Loading...</span>Add
							Admin
						</button>

					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="col">
						<label for="inputUsername" style="padding: 5px;">User Name</label>
						<input type="text" class="form-control" placeholder="User Name"
							id="userName">
					</div>
					<div class="col">
						<label for="inputpassword" style="padding: 5px;">Password</label>
						<input type="password" class="form-control" id="password">

					</div>
				</div>
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="form-group col-sm-4">
						<label for="inputName" style="padding: 5px;">First Name</label> <input
							type="text" class="form-control" id="firstName"
							placeholder="First Name">
					</div>
					<div class="form-group col-sm-4">
						<label for="inputZip" style="padding: 5px;">Middle Name</label> <input
							type="text" class="form-control" id="middleName"
							placeholder="Middle Name">
					</div>

					<div class="form-group col-sm-4">
						<label for="inputZip" style="padding: 5px;">Last Name</label> <input
							type="text" class="form-control" id="lastName"
							placeholder="Last Name">
					</div>
				</div>
				<div class="form-row" style="padding-bottom: 20px;">
					<div class="form-group col-md-4">
						<label for="inputAddress">Email</label> <input type="email"
							class="form-control" id="email" placeholder="Email Address">
					</div>
					<div class="form-group col-md-4">
						<label for="inputContactNo">Contact No.</label> <input type="text"
							class="form-control" id="contactNumber" placeholder="Contact No.">
					</div>
					<div class="form-group col-md-4">
						<label for="inputContactNo">Birth Date</label> <input type="date"
							class="form-control" id="birthDate">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 20px;">
					<label for="inputAddress">Address </label> <input type="text"
						class="form-control" id="address"
						placeholder="Unit, Bldg ,Street ">
				</div>
				<div align="center" style="padding-bottom: 20px;">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="male" value="M"> <label class="form-check-label"
							for="inlineRadio1">Male</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="female" value="F"> <label class="form-check-label"
							for="inlineRadio1">Female</label>
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
		$('#addUserBtn').click(function() {
			onClickAdminAddUser();

		});
		clearFields();
		$('#dataTable').DataTable({
			"pagingType" : "full_numbers",
				 "lengthChange": false,
		            "pageLength": 5
		});
		

		$('#dataTable tbody').on('click', 'tr', function() {
			var selected = $(this).hasClass("highlight");
			$("#dataTable tbody tr").removeClass("highlight");
			if (!selected) {
			
				
		
			}

		});
	
	});

	function clearFields() {
		var userName = $('#userName').val();
		var password = $('#password').val();
		var firstName = $('#firstName').val();
		var middleName = $('#middleName').val();
		var lastName = $('#lastName').val();
		var email = $('#email').val();
		var birthDate = $('#birthDate').val();
		var address = $('#address').val();
		var contactNumber = $('#contactNumber').val();

		userName = ""
		password = ""
		firstName = ""
		middleName = ""
		lastName = ""
		email = ""
		birthDate = ""

		contactNumber = ""

		if ($("input[name='userType']").is(':checked')) {
			$("input[name='userType']").prop("checked", false)
		} else if ($("input[name='gender']").is(':checked')) {
			$("input[name='gender']").prop("checked", false)
		}
	}

	function onClickAdminAddUser() {
		var contextPath = "${pageContext.request.contextPath}";
		var userName = $('#userName').val();
		var password = $('#password').val();
		var firstName = $('#firstName').val();
		var middleName = $('#middleName').val();
		var lastName = $('#lastName').val();
		var email = $('#email').val();
		var birthDate = $('#birthDate').val();
		var address = $('#address').val();
		var userType = "ADMIN"
		var contactNumber = $('#contactNumber').val();
		var gender = $("input[name='gender']:checked").val();
		var isNull = false
		var notNum = false
		var isNum = false
		var exist = false
		$('#dataTable tbody tr td:first-child').each(function() {
			
			 if ( $(this).text() == $('#userName').val() ) {
				 exist = true;
				 alert("UserName is already taken!")
			   }
			});
		
		$('#dataTable tbody tr td:nth-child(8)').each(function() {
			
			 if ( $(this).text()== $('#email').val()) {
				 exist = true;
				 alert("Email is already taken!")
			   }
			});
		
		

		
		if (userName == "" || password == "" || firstName == ""
				|| middleName == "" || lastName == "" || email == ""
				|| address == "" || contactNumber == "" || gender == ""
				|| userType == "" || birthDate == "") {
			isNull = true;
			alert("Please Input Fields");
		} else if (!(isNaN(firstName)) || !(isNaN(middleName))
				|| !(isNaN(lastName))) {
			isNum = true
			alert("Please input valid name");
		} else if (isNaN(contactNumber)) {
			notNum = true
			alert("Please input valid contactNumber");
		}
		if (isNull == false && isNum == false && notNum == false &&  exist == false) {
			$.ajax({
				url : contextPath + "/admin",
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
					gender : gender,
				},
				success : function(response) {
					$("#alert").fadeIn(1000);
					$("#alert").fadeOut(2000);
					$("#loading").fadeIn(1000);

					setTimeout((function() {
						window.location.reload();
					}), 3000);

				},
				fail : function(xhr, textStatus, errorThrown) {
					$("#alertDanger").fadeIn(1000);
					$("#alertDanger").fadeOut(2000);

					setTimeout((function() {
						window.location.reload();
					}), 3000);

				}

			});

		}
	}
	
	function getUserList() {
		var contextPath = "${pageContext.request.contextPath}";
		$.ajax({
			url : contextPath + "/updateInfo",
			method : "POST",
			data : {
				action : "getUserListInAdd"
			},
			success : function(response) {

				$("#mainContent").html(response);

			}
		});
	}
</script>
</html>