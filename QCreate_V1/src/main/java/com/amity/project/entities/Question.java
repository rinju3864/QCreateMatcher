package com.amity.project.entities;
import java.sql.*;

public class Question {
    private int Qid;
    private String Qno;
    private String Subject;
    private String Topic;
    private String Subtopic;
    private String Objective;
    private String Level;
    private String Ques;
    private String Opt1;
    private String Opt2;
    private String Opt3;
    private String Opt4;
    private Timestamp Qdate;


    public Question(int Qid, String Qno, String Subject, String Topic, String Subtopic, String Objective, String Level, String Ques, String Opt1, String Opt2, String Opt3, String Opt4, Timestamp Qdate) {
        this.Qid = Qid;
        this.Qno = Qno;
        this.Subject = Subject;
        this.Topic = Topic;
        this.Subtopic = Subtopic;
        this.Objective = Objective;
        this.Level = Level;
        this.Ques = Ques;
        this.Opt1 = Opt1;
        this.Opt2 = Opt2;
        this.Opt3 = Opt3;
        this.Opt4 = Opt4;
        this.Qdate = Qdate;
    }
    

    public Question() {
    }

    public Question(String Qno, String Subject, String Topic, String Subtopic, String Objective, String Level, String Ques, String Opt1, String Opt2, String Opt3, String Opt4) {
        this.Qno = Qno;
        this.Subject = Subject;
        this.Topic = Topic;
        this.Subtopic = Subtopic;
        this.Objective = Objective;
        this.Level = Level;
        this.Ques = Ques;
        this.Opt1 = Opt1;
        this.Opt2 = Opt2;
        this.Opt3 = Opt3;
        this.Opt4 = Opt4;
    }

    public Question(String Subject, String Topic, String Subtopic, String Objective, String Level, String Ques, String Opt1, String Opt2, String Opt3, String Opt4) {
        this.Subject = Subject;
        this.Topic = Topic;
        this.Subtopic = Subtopic;
        this.Objective = Objective;
        this.Level = Level;
        this.Ques = Ques;
        this.Opt1 = Opt1;
        this.Opt2 = Opt2;
        this.Opt3 = Opt3;
        this.Opt4 = Opt4;
    }
    
    


    public int getQid() {
        return Qid;
    }

    public void setQid(int Qid) {
        this.Qid = Qid;
    }

    public String getQno() {
        return Qno;
    }

    public void setQno(String Qno) {
        this.Qno = Qno;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public String getTopic() {
        return Topic;
    }

    public void setTopic(String Topic) {
        this.Topic = Topic;
    }

    public String getSubtopic() {
        return Subtopic;
    }

    public void setSubtopic(String Subtopic) {
        this.Subtopic = Subtopic;
    }

    public String getObjective() {
        return Objective;
    }

    public void setObjective(String Objective) {
        this.Objective = Objective;
    }

    public String getLevel() {
        return Level;
    }

    public void setLevel(String Level) {
        this.Level = Level;
    }

    public String getQues() {
        return Ques;
    }

    public void setQues(String Ques) {
        this.Ques = Ques;
    }

    public String getOpt1() {
        return Opt1;
    }

    public void setOpt1(String Opt1) {
        this.Opt1 = Opt1;
    }

    public String getOpt2() {
        return Opt2;
    }

    public void setOpt2(String Opt2) {
        this.Opt2 = Opt2;
    }

    public String getOpt3() {
        return Opt3;
    }

    public void setOpt3(String Opt3) {
        this.Opt3 = Opt3;
    }

    public String getOpt4() {
        return Opt4;
    }

    public void setOpt4(String Opt4) {
        this.Opt4 = Opt4;
    }

    public Timestamp getQdate() {
        return Qdate;
    }

    public void setQdate(Timestamp Qdate) {
        this.Qdate = Qdate;
    }
}
