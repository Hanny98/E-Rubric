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
public class Lecturer implements User {
    private String name;
    private String lectID;
    private JdbcUtility jdbcUtility;

    public Lecturer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLectID() {
        return lectID;
    }

    public void setLectID(String lectID) {
        this.lectID = lectID;
    }
    

    @Override
    public String login(String lectID, String password) {
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
                             
                if(acidID.equals(lectID)&& passcode.equals(password)){
                    return "Login Successfully (Lecturer) ";
                }                   
                
          }  
         return "Failed to Login";
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return "Something goes wrong";
    }
    
    @Override
    public User getUserDetails(String acidID) {
        Lecturer lect = new Lecturer();
        String sqlSelectStudentById = "SELECT *" + 
                                      " FROM lecturer" +
                                      " WHERE LecturerID = ?";
        jdbcUtility = new JdbcUtility();
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectStudentById);
          psSelectStudentById.setString(1, acidID);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          while(rs.next()){
                String name = rs.getString("Lecturername");
                String lectID = rs.getString("LecturerID");
                System.out.println(name);
                System.out.println(lectID);
                //Set the details for the lecturer
                lect.setLectID(lectID);
                lect.setName(name);                                    
          }  
         return lect;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
