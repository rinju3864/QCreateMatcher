<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
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
    <body>
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
                            <a class="nav-link disabled" href="login_page.jsp" style="color: white;"><span class="fa fa-user-circle"></span>  Login</a>
                        </li>
                      </ul>
                      <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                      </form>
                    </div>
        </nav>
        <main class="jumbotron banner-background" style="padding-bottom:100px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-white text-center" style="font-weight:bold;background-color:#252527">
                            <span class="fa fa-user fa-3x"></span>
                            <br>
                            Sign Up
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                  <label for="user_name">Username</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">
                                  
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                  <label for="contact">Contact Number</label>
                                  <input name="user_contact" type="contact" class="form-control" id="contact" placeholder="Contact Number">
                                </div>
                                 <div class="form-group">
                                  <label for="gender">Select Gender</label>
                                  <br>
                                  <input type="radio" id="gender" name="gender" value="male"> Male
                                  <input type="radio" id="gender" name="gender" value="female"> Female
                                </div>
                                
                                <div class="form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div><br>
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait</h4>
                                </div>
                                
                                    
                                <button id="submit-btn" type="submit" class="btn btn-dark btn-block">Sign Up</button>
                              </form>
                            
                        </div>
                        
                        
                    </div>
                    
                    
                </div>
             </div>
            
        </main>
        
        
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
            
        </script>
        <script>
            $(document).ready(function(){
                console.log("loaded...")
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form= new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    //send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            if(data.trim()==='done')
                            {
                            swal("Sign Up Successfully ! We are redirectiong to login page")
                            .then((value) => {
                              window.location="login_page.jsp"
                            });
                        }else{
                            swal(data);
                        }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong....Try again")
                            
                            
                        },
                        processData: false,
                        contentType: false
                        
                    });
                });
            });
        </script>
    </body>
</html>

