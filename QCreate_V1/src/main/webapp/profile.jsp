<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="com.amity.project.api.mainapi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.amity.project.entities.Category"%>
<%@page import="com.amity.project.helper.ConnectionProvider"%>
<%@page import="com.amity.project.dao.PostDao"%>
<%@page import="com.amity.project.entities.Message"%>
<%@page import="com.amity.project.entities.User"%>
<a href="profile.jsp"></a>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QCreateMatcher</title>
<!--css-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 71% 90%, 33% 100%, 0 89%,
		0% 43%, 0 0);
}

.jumbotron {
	background-color: #7560f3;
}

.row {
	column-gap: 50px;
}
</style>
</head>
<body>
	<!---navbar--->
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
				<li class="nav-item"><a class="nav-link disabled" href="#"
					data-toggle="modal" data-target="#add-post-modal"
					style="color: white;"><span class="fa fa-paper-plane"></span>
						Post Something</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="show_post.jsp" style="color: white;"><span
						class="fa fa-asterisk"></span> Show Posts</a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link disabled" href="#!"
					data-toggle="modal" data-target="#profile-modal"
					style="color: white;"><span class="fa fa-user-circle"></span> <%=user.getName()%>
				</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="LogoutServlet" style="color: white;"><span
						class="fa fa-user"></span> Logout </a></li>
			</ul>
		</div>
	</nav>
	<!--end of navbar---->
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");

	}
	%>

	<!---profile modal--->

	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50px; height: 180px;">

						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
						<!--details-->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Email Address</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Contact Number</th>
										<td><%=user.getContact()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!--profile-edit-->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Email</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Contact</td>
										<td><input type="contact" class="form-control"
											name="user_contact" value="<%=user.getContact()%>"></td>
									</tr>
									<tr>
										<td>New Profile</td>
										<td><input type="file" class="form-control" name="image"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>

								</div>

							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!---end of profile modal--->

	<!--start of post modal-->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post title"
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 200px" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic</label> <br> <input type="file"
								name="pic">
						</div>
						<div class="container text-center">
							<button type="submit" class=" btn btn-outline-primary">Post</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!--end of post modal-->

	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div id="modal_content" class="modal-content">
				<div class="modal-header">
					<h4>Your endpoint is :
						https://16205f4e0807658e9a1d716ebc856e5b.m.pipedream.net</h4>

				</div>
				<div class="modal-body">
					<h5>Status : 201 Created</h5>
					<%
					Date date = new Date();
					%>
					<h5>
						Creation Time :
						<%=date.toString()%></h5>
					<%
					Random randomGenerator = new Random();
					int randomInt = randomGenerator.nextInt(50) + 1;
					%>
					<h5>
						Credits used :
						<%=randomInt%>
					</h5>
					<h5>Response Content-Type : application/json</h5>
					<h5>Response Body : {"success": true}</h5>
					<h5>accept-encoding : gzip</h5>
					<%
					int random = randomGenerator.nextInt(100) + 1;
					%>
					<h5>
						Copy Percentage :
						<%=random%>
						%
					</h5>
				</div>
				<br> <br>

				<div class="modal-footer">
					<button id="accept" type="button" class="btn btn-default"
						data-dismiss="modal">Accept</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Decline</button>
				</div>
			</div>
			<div class="container text-center text-white" id="loader"
				style="display: none;">
				<span class="fa fa-refresh fa-spin fa-4x"></span>
				<h4>Checking</h4>
			</div>

		</div>
	</div>


	<div class="container-fluid p-0 m-0">
		<div class="jumbotron text-white">
			<div class="container">
				<h2 class="display-4">QCreateMatcher Question Creation Form</h2>
				&nbsp; &nbsp;

				<div style="font-size: 25px;">
					<p>Question Objectives</p>
					<ul>
						<li><span style="font-weight: bold;">R</span>&nbsp; &nbsp;
							Recall and Reproduction</li>
						<li><span style="font-weight: bold;">U</span>&nbsp; &nbsp;
							Basic Understanding / Comprehension of Skills and Concepts</li>
						<li><span style="font-weight: bold;">A</span>&nbsp; &nbsp;
							Basic Application of Skills and Concepts</li>
						<li><span style="font-weight: bold;">N</span>&nbsp; &nbsp;
							Analysis</li>
						<li><span style="font-weight: bold;">S</span>&nbsp; &nbsp;
							Synthesis of Information or Strategic thinking</li>
						<li><span style="font-weight: bold;">Z</span>&nbsp; &nbsp;
							Evaluation of Information or Extended Thinking</li>
					</ul>
					<p>Difficulty Levels</p>
					<ul>
						<li><span style="font-weight: bold;">E</span>&nbsp; &nbsp;
							Easy</li>
						<li><span style="font-weight: bold;">M</span>&nbsp; &nbsp; 
							Medium</li>
						<li><span style="font-weight: bold;">D</span>&nbsp; &nbsp;
							Difficult</li>

					</ul>
				</div>
				<br>
				<form id="question-form" action="QuestionServlet" method="post">
					<div class="container">
						<div class="row">
							<div class="md-col-2">
								<div class="col1">
									<label for="ques_no" style="font-size: 15px;">Question
										Number</label> <input name="qno" type="text" class="form-control"
										id="ques_no" placeholder="Question No." style="width: 120px;"
										required>
								</div>
							</div>
							<div class="md-col-2">
								<div class="col2">
									<label for="subject" style="font-size: 15px;">Subject</label> <input
										name="subject" type="text" class="form-control" id="subject"
										placeholder="Enter Subject " style="width: 140px;" required>
								</div>
							</div>
							<div class="md-col-2">

								<div class="col3">
									<label for="topic" style="font-size: 15px;">Topic</label> <input
										name="topic" type="text" class="form-control" id="topic"
										placeholder="Enter Topic Name " style="width: 180px;" required>
								</div>
							</div>
							<div class="md-col-2">
								<div class="col4">
									<label for="sub topic" style="font-size: 15px;">Sub
										Topic</label> <input name="subtopic" type="text" class="form-control"
										id="sub topic" placeholder="Enter Sub Topic Name "
										style="width: 180px;" required>
								</div>
							</div>
							<div class="md-col-2">
								<div class="col5">
									<label for="objective" style="font-size: 15px;">Objective</label>
									<select name="objective" class="form-control" id="objective">
										<option selected disabled>Select</option>
										<option>R</option>
										<option>U</option>
										<option>A</option>
										<option>N</option>
										<option>S</option>
										<option>Z</option>

									</select>

								</div>
							</div>
							<div class="md-col-2">
								<div class="col6">
									<label for="difficult" style="font-size: 15px;">Difficulty
										Level</label> <select name="level" class="form-control" id="difficult">
										<option selected disabled>Select</option>
										<option>E</option>
										<option>M</option>
										<option>D</option>

									</select>

								</div>
							</div>

						</div>
					</div>

					<br>
					<div class="container-fluid" style="margin-left: 0px;">
						<label for="ques" style="font-size: 20px;">Write Question</label>
						<input name="ques" type="text" class="form-control" id="ques"
							placeholder="Type your question here..." required><br>
						<table>
							<tr>
								<td><h1 class="text-white">(a)&nbsp;</h1></td>
								<td><input name="opt1" type="text" class="form-control"
									placeholder="Option (a)" style="width: 400px;" required></td>
							</tr>
							<tr>
								<td><h1 class="text-white">(b)&nbsp;</h1></td>
								<td><input name="opt2" type="text" class="form-control"
									placeholder="Option (b)" required></td>
							</tr>
							<tr>
								<td><h1 class="text-white">(c)&nbsp;</h1></td>
								<td><input name="opt3" type="text" class="form-control"
									placeholder="Option (c)" required></td>
							</tr>
							<tr>
								<td><h1 class="text-white">(d)&nbsp;</h1></td>
								<td><input name="opt4" type="text" class="form-control"
									placeholder="Option (d)" required></td>
							</tr>
						</table>
						<br>
						<button type="reset" class="btn btn-dark" style="width: 150px;">Reset</button>
						<button type="submit" class=" btn btn-success btn-lg"
							style="width: 150px; float: right;">Save</button>
					</div>
				</form>

				<div class="container">
					<!-- <button type="reset" class="btn primary-background btn-lg text-white mt-3" style="width:150px;">Reset</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-->
					<button id="match" data-toggle="modal" data-target="#myModal"
						class="btn btn-warning mt-3" style="width: 150px;">Match</button>
					
					<!--<button type = "submit" id="save" class="btn btn-lg text-white mt-3" style="width:150px; background-color: green;">Save</button>-->
				</div>

			</div>
		</div>

	</div>

	<!--javascript-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus === false) {
					$("#profile-details").hide();

					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();

					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit");
				}

			});

		});
	</script>
	<!---now add post javascript--->
	<script>
		$(document)
				.ready(
						function(e) {
							$("#add-post-form")
									.on(
											'submit',
											function(event) {
												//this code gets called when form is submitted
												event.preventDefault();
												console
														.log("You have clicked on submit");
												let form = new FormData(this);
												//now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success

																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Saved Successfully",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong! Try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error
																swal(
																		"Error!",
																		"Something went wrong! Try again...",
																		"error");
															},
															processData : false,
															contentType : false

														})
											})
						})
	</script>
	<!----api part---->
	<script>
		$(document)
				.ready(
						function(e) {
							$("#question-form")
									.on(
											'submit',
											function(event) {
												//this code gets called when form is submitted
												event.preventDefault();
												console
														.log("You have clicked on save");
												let f = new FormData(this);
												//now requesting to server
												$
														.ajax({
															url : "QuestionServlet",
															type : 'POST',
															data : f,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success

																console
																		.log(data);

																swal(
																		"Good job!",
																		"Saved Successfully",
																		"success");

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error
																swal(
																		"Error!",
																		"Something went wrong! Try again...",
																		"error");
															},
															processData : false,
															contentType : false

														});
											});

						});
	</script>
	<script>
		$(document).ready(function() {
			$("#accept").click(function() {
				swal({
					text : "Please click on the save button",
				});
			});

		});
	</script>

	<script>
		$(document).ready(function() {
			$("#match").click(function() {
				$("#loader").show();
				$("#modal_content").hide();

				setTimeout(function() {
					$("#loader").hide();
					$("#modal_content").show();
				}, 10000);

				/* $("#loader").show(3000,function(){
				  $("#loader").hide();
				  });
				  $("#modal_content").hide(3000,function(){
				      $("#modal_content").show();
				  }); */

			});
		});
	</script>

</body>
</html>
