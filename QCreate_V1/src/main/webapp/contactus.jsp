<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Us</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	padding: 0;
	text-align: center;
	background-color: #7560f3;
	color: white;
}

form .submit {
	background-color: #ff5722;
	border-color: transparent;
	font-size: 20px;
	letter-spacing: 2px;
	height: 50px;
	margin-top: 20px;
	transition: 0.4s ease;
}

form .submit:hover {
	background-color: #f44336;
	cursor: pointer;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<img src="img/a.jpg"> <a class="navbar-brand" href="#"
			style="font-weight: bold;">QCreateMatcher</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="index.jsp"
					style="color: white;"><span class="fa fa-home"
						style="font-size: 24px"></span> Home</a></li>

				<li class="nav-item"><a class="nav-link disabled"
					href="contactus.jsp" style="color: white;"><span
						class="fa fa-address-card"></span> Contact Us</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="register_page.jsp" style="color: white;"><span
						class="fa fa-user"></span> Sign Up</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="login_page.jsp" style="color: white;"><span
						class="fa fa-user-circle"></span> Login</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div class="title">
		<h1  class="display-3">CONTACT US</h1>
		<h1  class="display-4">We are happy to help you!</h1>
	</div>
	<div class="col-md-6 offset-md-3">
		<form id="conForm" class="contact-form">
			<div class="form-group">
				<input type="name" name="name" class="form-control"
					placeholder="ENTER YOUR NAME"><br>
			</div>
			<div class="form-group">

				<input type="email" name="email" class="form-control"
					placeholder="ENTER YOUR EMAIL"><br>
			</div>
			<div class="form-group">
				<textarea name="message" class="form-control" placeholder="Message"
					rows="4" required></textarea>
			</div>
			<div class="form-group">
				<br> <input type="submit" name="" class="btn btn-danger btn-block"
					value="SEND MESSAGE">
			</div>
		</form>
	</div>
	
</body>
</html>
