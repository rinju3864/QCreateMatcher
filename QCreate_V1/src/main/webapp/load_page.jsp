<%@page import="com.amity.project.entities.User"%>
<%@page import="com.amity.project.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.amity.project.entities.Post"%>
<%@page import="com.amity.project.dao.PostDao"%>
<%@page import="com.amity.project.helper.ConnectionProvider"%>
<div class="row">
<%
   User uuu= (User)session.getAttribute("currentUser");
   PostDao d = new PostDao(ConnectionProvider.getConnection());
   
   int cid=Integer.parseInt(request.getParameter("cid"));
   List<Post> posts = null;
   if(cid==0){
       posts = d.getAllPosts();
   }else{
       posts = d.getPostByCatId(cid);
   }
   if(posts.size()==0){
       out.println("<h3 class= 'display-3 text-center'>No posts in this category</h3>");
       return;
   }
   for(Post p:posts){
       %>
       <div class="col-md-6 mt-2">
           <div class="card">
               <img class="card-img-top" src="posts_pics/<%= p.getpPic() %>" alt="Card image cap">
               <div class="card-body">
                   <b><%= p.getpTitle() %></b>
                   <p><%= p.getpContent() %></p>
               </div>
               <div class="card-footer primary-background text-center">
                   <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    
                   %>
                   
                   <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= uuu.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                   
                   <a href="read_page.jsp?post_id=<%= p.getPid() %> " class="btn btn-outline-light btn-sm">Read More...</a>
                   
                   
               </div>
           </div>
       </div>
       
       <%
           
   }

%>
</div>