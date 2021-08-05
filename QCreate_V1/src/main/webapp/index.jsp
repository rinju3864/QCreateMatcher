
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QCreateMatcher</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 71% 90%, 33% 100%, 0 89%, 0% 43%, 0 0);
            }
            .jumbotron{
                background-color:#7560f3;
            }
            .row{
                column-gap: 50px;
            }
	
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <img src="img/a.jpg">  
            <a class="navbar-brand" href="#" style="font-weight:bold;">QCreateMatcher</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                        </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                          <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp" style="color: white;"><span class="fa fa-home" style="font-size:24px"></span> Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link disabled" href="contactus.jsp" style="color: white;"><span class="fa fa-address-card"></span>  Contact Us</a>
                        </li>
                        <li class="nav-item">
                                    <a class="nav-link disabled" href="register_page.jsp" style="color: white;"><span class="fa fa-user"></span>  Sign Up</a>
                        </li>
                        <li class="nav-item">
                                    <a class="nav-link disabled" href="login_page.jsp" style="color: white;"><span class="fa fa-user-circle"></span>  Login</a>
                        </li>
                      </ul>
                      <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                      </form>
                    </div>
        </nav>
        
        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to QCreateMatcher</h3>
                    &nbsp; &nbsp;
                    <p><span style="font-weight:bold;">QCreateMatcher</span> is a Question Creation Web Platform. Here Teachers can create question of multiple choices and can quickly match the plagarism of the question. This project is developed by Rinju as part of  MCA NTCC summer internship (2021-22) under guidance of Dr. Deepa Gupta & Mr. Nilesh Haridas.</p>
                    
                    <a href="register_page.jsp" class=" btn btn-outline-light"><span class="fa fa-user"></span>  Sign Up</a>&nbsp;
                    <a href="login_page.jsp" class=" btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span>  Login</a>
                </div>
            </div>
            
        </div> 
        <div class="container">
            <div class="row">
                <div class="md-col-4">
                    <div class="card" style="width: 20rem;">
                        <div class="card-body" style="background-color:#7560f3;">
                          <h5 class="card-title text-center text-white" style="font-size:30px;">GET...</h5>
                          <p class="card-text text-white">Write your question in the given fields that you want to create</p>
                          <button class="btn btn-dark" style="margin-left:30%; width:100px; font-size:15px;">Write</button>
                        </div>
                        </div>
                    
                </div>
                <div class="md-col-4">
                    <div class="card" style="width: 20rem;">
                        <div class="card-body" style="background-color:#7560f3;">
                          <h5 class="card-title text-white text-center" style="font-size:30px;">SET...</h5>
                          <p class="card-text text-white">Click the Match button to check the plagarism of the question</p>
                          <button class="btn btn-dark" style="margin-left:30%; width:100px; font-size:15px;">Match</button>
                        </div>
                      </div>
                    
                </div>
                <div class="md-col-4">
                    <div class="card" style="width: 20rem;">
                        <div class="card-body" style="background-color:#7560f3;">
                          <h5 class="card-title text-white text-center" style="font-size:30px;">GO...</h5>
                          <p class="card-text text-white">Click the Save button to store the question</p>
                          <button class="btn btn-dark" style="margin-left:30%; width:100px; font-size:15px;">Save</button>
                        </div>
                      </div>
                    
                </div>
            </div>           
        </div>
        
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>

