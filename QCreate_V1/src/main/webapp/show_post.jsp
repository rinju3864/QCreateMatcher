<%@page import="java.util.ArrayList"%>
<%@page import="com.amity.project.entities.Category"%>
<%@page import="com.amity.project.helper.ConnectionProvider"%>
<%@page import="com.amity.project.dao.PostDao"%>
<%@page import="com.amity.project.entities.Message"%>
<%@page import="com.amity.project.entities.User"%>
<%@page errorPage="error_page.jsp"  %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login_page.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 71% 90%, 33% 100%, 0 89%, 0% 43%, 0 0);
            }
            .jumbotron{
                background-color:#071f4c;
            }
            .row{
                column-gap: 50px;
            }
            body{
                background:url(img/Spiral.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!---navbar--->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
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
                            <a class="nav-link disabled" href="#" data-toggle="modal" data-target="#add-post-modal" style="color: white;"><span class="fa fa-paper-plane"></span>  Do Post</a>
                        </li>
                        
                        
                            
                      </ul>
                        <ul class="navbar-nav mr-right">
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#!" data-toggle="modal" data-target="#profile-modal" style="color: white;"><span class="fa fa-user-circle"></span>  <%= user.getName() %> </a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link disabled" href="LogoutServlet" style="color: white;"><span class="fa fa-user"></span>  Logout </a>
                        </li>
                        </ul>
                    </div>
        </nav>
        <!--end of navbar---->
        <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null){
                                    %>
                                    <div class="alert <%= m.getCssClass()%>" role="alert">
                                        <%= m.getContent() %>
                                    </div>
                                    <%
                                        session.removeAttribute("msg");
                                    
                                }
                            %>
                            
        <!--main body of the page-->
        <main>
            <div class="container ">
                <div class="row mt-5">
                    <!---first col--->
                    <div class="col-md-3">
                     <!--categories-->  
                     <div class="list-group">
                         <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">
                          All Posts
                        </a>
                         
                         <%
                          PostDao d = new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list1=d.getAllCategories();
                          for(Category cc : list1){
                          %>
                          <a href="#" onclick ="getPosts(<%= cc.getCid() %>,this)"  class = "c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                          <%
                          }
                         %>
                        
                        
                      </div>
                     
                    </div>
                    <!---second col--->
                    <div class="col-md-8">
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                            
                        </div> 
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                        
                    </div>   
                </div>
            </div>
        </main>
        
        
        
        
        
        <!--end of the page-->
        
        <!---profile modal--->
        
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50px; height:180px;">
                          
                          <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                          <!--details-->
                          <div id="profile-details">
                            <table class="table">

                              <tbody>
                                <tr>
                                  <th scope="row">Email Address</th>
                                  <td><%= user.getEmail()%></td>

                                </tr>
                                <tr>
                                  <th scope="row">Status</th>
                                  <td><%= user.getGender() %></td>

                                </tr>
                                <tr>
                                  <th scope="row">Contact Number</th>
                                  <td><%= user.getContact() %></td>

                                </tr>
                                <tr>
                                  <th scope="row">Registered on</th>
                                  <td><%= user.getDateTime().toString()%></td>

                                </tr>
                              </tbody>
                            </table>
                          </div>
                          <!--profile-edit-->
                          <div id="profile-edit" style="display:none;">
                              <h3 class="mt-2">Please Edit Carefully</h3>
                              <form action="EditServlet" method="post" enctype="multipart/form-data">
                                  <table class="table">
                                      <tr>
                                          <td>Email</td>
                                          <td><input type="email" class="form-control" name="user_email" values="<%=user.getEmail()%>"></td>
                                      </tr>
                                      <tr>
                                          <td>Name</td>
                                          <td><input type="text" class="form-control" name="user_name" values="<%=user.getName()%>"></td>
                                      </tr>
                                      <tr>
                                          <td>Password</td>
                                          <td><input type="password" class="form-control" name="user_password" values="<%=user.getPassword()%>"></td>
                                      </tr>
                                      <tr>
                                          <td>Gender</td>
                                          <td><%= user.getGender().toUpperCase() %></td>
                                      </tr>
                                      <tr>
                                          <td>Contact</td>
                                          <td><input type="contact" class="form-control" name="user_contact" values="<%=user.getContact()%>"></td>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                  </div>
                </div>
              </div>
            </div>
            <!---end of profile modal--->
            
            <!--start of post modal-->
            
                <!-- Modal -->
                <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <form id="add-post-form" action="AddPostServlet" method="post">
                              <div class="form-group">
                                  <select class="form-control" name="cid">
                                      <option selected disabled>---Select Category---</option>
                                      <%
                                      PostDao postd =new PostDao(ConnectionProvider.getConnection());
                                      ArrayList<Category> list=postd.getAllCategories();
                                      for(Category c:list){
                                      
                                      %>
                                      <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                      
                                      <%
                                       }
                                      %>
                                  </select>
                              </div>
                              
                              <div class="form-group">
                                  <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>    
                              </div>
                              <div class="form-group">
                                  <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter your content"></textarea>
                              </div>
                              <div class="form-group">
                                  <label>Select your pic</label>
                                  <br>
                                  <input type="file" name="pic">
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
        
       <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                let editStatus=false;
                $('#edit-profile-button').click(function(){
                    if(editStatus===false){
                      $("#profile-details").hide();
                    
                      $("#profile-edit").show(); 
                      editStatus=true;
                      $(this).text("Back");
                    }
                    else{
                        $("#profile-details").show();
                    
                        $("#profile-edit").hide();
                        editStatus=false;
                        $(this).text("Edit");
                    }
                    
                });
                
            });
           
        </script>
        <!---now add post javascript--->
        <script>
            $(document).ready(function(e){
                $("#add-post-form").on('submit',function(event){
                    //this code gets called when form is submitted
                    event.preventDefault();
                    console.log("You have clicked on submit");
                    let form=new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                        //success
                        console.log(data);
                        if(data.trim() =='done'){
                            swal("Good job!", "Saved Successfully", "success");
                        }
                        else{
                            swal("Error!", "Something went wrong! Try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                        swal("Error!", "Something went wrong! Try again...", "error");
                    },
                     processData : false,
                     contentType : false
                        
                    })
                })
            })
            
        </script>
        <!--loading post using ajax-->
        <script>
            function getPosts(catId,temp){
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active')
                $.ajax({
                    url : "load_page.jsp",
                    data : {cid : catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function(e){
                let allPostRef = $('.c-link')[0]
                getPosts(0,allPostRef)
            })
        </script>
   
    </body>
</html>
