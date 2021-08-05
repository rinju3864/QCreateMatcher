package com.amity.project.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.amity.project.entities.Category;
import com.amity.project.entities.Post;
import com.amity.project.entities.User;

@SuppressWarnings("unused")
public class PostDao {
	Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid,name,description);
                list.add(c);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        try{
            String q="insert into posts(pTitle,pContent,pPic,catId,userId) values(?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpPic());
            pstmt.setInt(4,p.getCatId());
            pstmt.setInt(5,p.getUserId());
            pstmt.executeUpdate();
            f=true;
            
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get all the posts
    public List<Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        //fetch all the posts
        try{
            PreparedStatement p=con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pid, pTitle,pContent, pPic, date, catId, userId);
                list.add(post);
                
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    public List<Post> getPostByCatId(int catId){
        List<Post> list = new ArrayList<>();
        //fetch all the posts by id
        try{
            PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
            p.setInt(1,catId);
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                Post post=new Post(pid, pTitle,pContent, pPic, date, catId, userId);
                list.add(post);
                
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    public Post getPostByPostId(int postId){
        Post post = null;
        String q = "select * from posts where pid=?";
        try{
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1,postId);
            ResultSet set = p.executeQuery();
            if(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int cid= set.getInt("catId");
                int userId=set.getInt("userId");
                post=new Post(pid, pTitle,pContent, pPic, date, cid, userId);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
    
    
    
}
