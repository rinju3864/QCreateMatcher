package com.amity.project.dao;
import java.sql.*;

import com.amity.project.entities.Question;
public class QuesDao {
    private Connection con;

    public QuesDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveQues(Question question){
        boolean f=false;
        try{
            
            String query="insert into question(Qno,Subject,Topic,Subtopic,Objective,Level,Ques,Opt1,Opt2,Opt3,Opt4) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1, question.getQno());
            pstmt.setString(2, question.getSubject());
            pstmt.setString(3, question.getTopic());
            pstmt.setString(4, question.getSubtopic());
            pstmt.setString(5, question.getObjective());
            pstmt.setString(6, question.getLevel());
            pstmt.setString(7, question.getQues());
            pstmt.setString(8, question.getOpt1());
            pstmt.setString(9, question.getOpt2());
            pstmt.setString(10, question.getOpt3());
            pstmt.setString(11, question.getOpt4());
            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    

}
