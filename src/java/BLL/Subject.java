/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import DLL.JdbcUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Acer
 */
public class Subject {
    private String subjectCode;
    private String subjectName;
    private JdbcUtility jdbcUtility;

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    public ArrayList<Subject> getSubjectList(){
         String sqlSelectStudent = "SELECT *" + 
                                  "FROM subject" ;
        jdbcUtility = new JdbcUtility();
        ArrayList<Subject> subList = new ArrayList<Subject>();
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectStudent);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          while(rs.next()){
                String subName = rs.getString("Subjectname");
                String subCode = rs.getString("Subjectcode");
                Subject sub = new Subject();
                sub.setSubjectCode(subCode);
                sub.setSubjectName(subName);              
                subList.add(sub);
          }  
          return subList;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
}
