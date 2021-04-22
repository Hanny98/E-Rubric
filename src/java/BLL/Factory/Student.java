/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL.Factory;

import DLL.JdbcUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Acer
 */


public class Student implements User {
    private String name;
    private String studentID;
    private String course;
    private double carryMark;
    private JdbcUtility jdbcUtility;
    
    public Student() {}
    
    public Student(String name,String studentID, String course, double carryMark) {
        this.name = name;
        this.studentID = studentID;
        this.course = course;
        this.carryMark = carryMark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public double getCarryMark() {
        return carryMark;
    }

    public void setCarryMark(double carryMark) {
        this.carryMark = carryMark;
    }

    @Override
    public User getUserDetails(String acidID) {
        Student student = new Student();
        String sqlSelectStudentById = "SELECT *" + 
                                      " FROM student" +
                                      " WHERE StudentID = ?";
        jdbcUtility = new JdbcUtility();
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectStudentById);
          psSelectStudentById.setString(1, acidID);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          while(rs.next()){
                String name = rs.getString("Studentname");
                String studID = rs.getString("StudentID");
                String carryMark = rs.getString("Carrymark");
                String course = rs.getString("Course");
                System.out.println(name);
                System.out.println(studID);
                //Set the details for the lecturer
                student.setStudentID(studID);
                student.setName(name);          
                double mark = Double. valueOf(carryMark); 
                student.setCarryMark(mark);
                student.setCourse(course);
          }  
         return student;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
   @Override
    public String login(String studID, String password) {
        String sqlSelectStudent = "SELECT *" + 
                                  "FROM user" ;
        jdbcUtility = new JdbcUtility();
        
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectStudent);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          while(rs.next()){
                String acidID = rs.getString("AcidID");
                String passcode = rs.getString("Password");
                             
                if(acidID.equals(studID)&& passcode.equals(password)){
                    return "Login Successfully (Student) ";
                }                   
                
          }  
         return "Failed to Login";
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return "Something goes wrong";
    }
     
    
  

    
    
    
    
}
