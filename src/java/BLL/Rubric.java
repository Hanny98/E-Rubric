/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import BLL.Factory.Lecturer;
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
public class Rubric {
    private String rubricCriteria0;
    private String rubricCriteria1;
    private String rubricCriteria2;
    private String rubricID;
    private String rubricName;
    private String rurbicPerformanceDesc0;
    private String rurbicPerformanceDesc1;
    private String rurbicPerformanceDesc2;
    private String rurbicPerformanceDesc3;
    private String rurbicPerformanceDesc4;
    private String rurbicPerformanceDesc5;
    private String rurbicPerformanceDesc6;
    private String rurbicPerformanceDesc7;
    private String rurbicPerformanceDesc8;
    private String rurbicPerformanceRating0;
    private String rurbicPerformanceRating1;
    private String rurbicPerformanceRating2;
    private String subjectCode;
     private JdbcUtility jdbcUtility;

    public Rubric() {
    }

    public String getRubricCriteria0() {
        return rubricCriteria0;
    }

    public void setRubricCriteria0(String rubricCriteria0) {
        this.rubricCriteria0 = rubricCriteria0;
    }

    public String getRubricCriteria1() {
        return rubricCriteria1;
    }

    public void setRubricCriteria1(String rubricCriteria1) {
        this.rubricCriteria1 = rubricCriteria1;
    }

    public String getRubricCriteria2() {
        return rubricCriteria2;
    }

    public void setRubricCriteria2(String rubricCriteria2) {
        this.rubricCriteria2 = rubricCriteria2;
    }

    public String getRubricID() {
        return rubricID;
    }

    public void setRubricID(String rubricID) {
        this.rubricID = rubricID;
    }

    public String getRubricName() {
        return rubricName;
    }

    public void setRubricName(String rubricName) {
        this.rubricName = rubricName;
    }

    public String getRurbicPerformanceDesc0() {
        return rurbicPerformanceDesc0;
    }

    public void setRurbicPerformanceDesc0(String rurbicPerformanceDesc0) {
        this.rurbicPerformanceDesc0 = rurbicPerformanceDesc0;
    }

    public String getRurbicPerformanceDesc1() {
        return rurbicPerformanceDesc1;
    }

    public void setRurbicPerformanceDesc1(String rurbicPerformanceDesc1) {
        this.rurbicPerformanceDesc1 = rurbicPerformanceDesc1;
    }

    public String getRurbicPerformanceDesc2() {
        return rurbicPerformanceDesc2;
    }

    public void setRurbicPerformanceDesc2(String rurbicPerformanceDesc2) {
        this.rurbicPerformanceDesc2 = rurbicPerformanceDesc2;
    }

    public String getRurbicPerformanceDesc3() {
        return rurbicPerformanceDesc3;
    }

    public void setRurbicPerformanceDesc3(String rurbicPerformanceDesc3) {
        this.rurbicPerformanceDesc3 = rurbicPerformanceDesc3;
    }

    public String getRurbicPerformanceDesc4() {
        return rurbicPerformanceDesc4;
    }

    public void setRurbicPerformanceDesc4(String rurbicPerformanceDesc4) {
        this.rurbicPerformanceDesc4 = rurbicPerformanceDesc4;
    }

    public String getRurbicPerformanceDesc5() {
        return rurbicPerformanceDesc5;
    }

    public void setRurbicPerformanceDesc5(String rurbicPerformanceDesc5) {
        this.rurbicPerformanceDesc5 = rurbicPerformanceDesc5;
    }

    public String getRurbicPerformanceDesc6() {
        return rurbicPerformanceDesc6;
    }

    public void setRurbicPerformanceDesc6(String rurbicPerformanceDesc6) {
        this.rurbicPerformanceDesc6 = rurbicPerformanceDesc6;
    }

    public String getRurbicPerformanceDesc7() {
        return rurbicPerformanceDesc7;
    }

    public void setRurbicPerformanceDesc7(String rurbicPerformanceDesc7) {
        this.rurbicPerformanceDesc7 = rurbicPerformanceDesc7;
    }

    public String getRurbicPerformanceDesc8() {
        return rurbicPerformanceDesc8;
    }

    public void setRurbicPerformanceDesc8(String rurbicPerformanceDesc8) {
        this.rurbicPerformanceDesc8 = rurbicPerformanceDesc8;
    }

    public String getRurbicPerformanceRating0() {
        return rurbicPerformanceRating0;
    }

    public void setRurbicPerformanceRating0(String rurbicPerformanceRating0) {
        this.rurbicPerformanceRating0 = rurbicPerformanceRating0;
    }

    public String getRurbicPerformanceRating1() {
        return rurbicPerformanceRating1;
    }

    public void setRurbicPerformanceRating1(String rurbicPerformanceRating1) {
        this.rurbicPerformanceRating1 = rurbicPerformanceRating1;
    }

    public String getRurbicPerformanceRating2() {
        return rurbicPerformanceRating2;
    }

    public void setRurbicPerformanceRating2(String rurbicPerformanceRating2) {
        this.rurbicPerformanceRating2 = rurbicPerformanceRating2;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
    
    public ArrayList<Rubric> getListofRubricName() {
        String[] rubricListName;
        String sqlSelectRubricName = "SELECT *" + 
                                  "FROM rubric" ;
        jdbcUtility = new JdbcUtility();
        ArrayList <Rubric> rubricList = new ArrayList<Rubric>();
        
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectRubricName);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          int i = 0;
          while(rs.next()){
            Rubric rubric = new Rubric();
                        
            String id = rs.getString("RubricID");
            String name = rs.getString("Rubricname");
            String rubricCriteria0 = rs.getString("Rubriccriteria0");
            String rubricCriteria1 = rs.getString("Rubriccriteria1");
            String rubricCriteria2 = rs.getString("Rubriccriteria2");
            String Rubricperformancerating0 = rs.getString("Rubricperformancerating0");
            String Rubricperformancerating1 = rs.getString("Rubricperformancerating1");
            String Rubricperformancerating2 = rs.getString("Rubricperformancerating2");      
            String Rubricperformancedesc0 = rs.getString("Rubricperformancedesc0");
            String Rubricperformancedesc1 = rs.getString("Rubricperformancedesc1");
            String Rubricperformancedesc2 = rs.getString("Rubricperformancedesc2");
            String Rubricperformancedesc3 = rs.getString("Rubricperformancedesc3");
            String Rubricperformancedesc4 = rs.getString("Rubricperformancedesc4");
            String Rubricperformancedesc5 = rs.getString("Rubricperformancedesc5");
            String Rubricperformancedesc6 = rs.getString("Rubricperformancedesc6");
            String Rubricperformancedesc7 = rs.getString("Rubricperformancedesc7");
            String Rubricperformancedesc8 = rs.getString("Rubricperformancedesc8");
            String SubjectCode = rs.getString("Subjectcode");
  
            
            rubric.setRubricID(id);
            rubric.setRubricName(name);
            rubric.setRubricCriteria0(rubricCriteria0);
            rubric.setRubricCriteria1(rubricCriteria1);
            rubric.setRubricCriteria2(rubricCriteria2);
             rubric.setRurbicPerformanceRating0(Rubricperformancerating0);
             rubric.setRurbicPerformanceRating1(Rubricperformancerating1);
             rubric.setRurbicPerformanceRating2(Rubricperformancerating2);
             rubric.setRurbicPerformanceDesc0(Rubricperformancedesc0);
             rubric.setRurbicPerformanceDesc1(Rubricperformancedesc1);
             rubric.setRurbicPerformanceDesc2(Rubricperformancedesc2);
             rubric.setRurbicPerformanceDesc3(Rubricperformancedesc3);
             rubric.setRurbicPerformanceDesc4(Rubricperformancedesc4);
             rubric.setRurbicPerformanceDesc5(Rubricperformancedesc5);
             rubric.setRurbicPerformanceDesc6(Rubricperformancedesc6);
             rubric.setRurbicPerformanceDesc7(Rubricperformancedesc7);
             rubric.setRurbicPerformanceDesc8(Rubricperformancedesc8);
             rubric.setSubjectCode(SubjectCode);
                       
            //add the rubric to the list
            rubricList.add(i, rubric);
            ++i;                 
                
          }  
         return rubricList;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
        
    }
    public Rubric getRubricDetails(String rubricIDD){
        String sqlSelectRubricNameUsingID = "SELECT *" + 
                                            "FROM rubric"+
                                            " WHERE RubricID = ?";
        Rubric rubric = new Rubric();
        jdbcUtility = new JdbcUtility();
        try{
          Connection con = jdbcUtility.jdbcConnect();
          PreparedStatement psSelectStudentById = con.prepareStatement(sqlSelectRubricNameUsingID);
          psSelectStudentById.setString(1, rubricIDD);
          ResultSet rs = psSelectStudentById.executeQuery();
          
          while(rs.next()){
                String id = rs.getString("RubricID");
            String name = rs.getString("Rubricname");
            String rubricCriteria0 = rs.getString("Rubriccriteria0");
            String rubricCriteria1 = rs.getString("Rubriccriteria1");
            String rubricCriteria2 = rs.getString("Rubriccriteria2");
            String Rubricperformancerating0 = rs.getString("Rubricperformancerating0");
             String Rubricperformancerating1 = rs.getString("Rubricperformancerating1");
             String Rubricperformancerating2 = rs.getString("Rubricperformancerating2");      
             String Rubricperformancedesc0 = rs.getString("Rubricperformancedesc0");
             String Rubricperformancedesc1 = rs.getString("Rubricperformancedesc1");
             String Rubricperformancedesc2 = rs.getString("Rubricperformancedesc2");
             String Rubricperformancedesc3 = rs.getString("Rubricperformancedesc3");
             String Rubricperformancedesc4 = rs.getString("Rubricperformancedesc4");
             String Rubricperformancedesc5 = rs.getString("Rubricperformancedesc5");
             String Rubricperformancedesc6 = rs.getString("Rubricperformancedesc6");
             String Rubricperformancedesc7 = rs.getString("Rubricperformancedesc7");
             String Rubricperformancedesc8 = rs.getString("Rubricperformancedesc8");
  
            
            rubric.setRubricID(id);
            rubric.setRubricName(name);
            rubric.setRubricCriteria0(rubricCriteria0);
            rubric.setRubricCriteria1(rubricCriteria1);
            rubric.setRubricCriteria2(rubricCriteria2);
            rubric.setRurbicPerformanceRating0(Rubricperformancerating0);
            rubric.setRurbicPerformanceRating1(Rubricperformancerating1);
            rubric.setRurbicPerformanceRating2(Rubricperformancerating2);
            rubric.setRurbicPerformanceDesc0(Rubricperformancedesc0);
            rubric.setRurbicPerformanceDesc1(Rubricperformancedesc1);
            rubric.setRurbicPerformanceDesc2(Rubricperformancedesc2);
            rubric.setRurbicPerformanceDesc3(Rubricperformancedesc3);
            rubric.setRurbicPerformanceDesc4(Rubricperformancedesc4);
            rubric.setRurbicPerformanceDesc5(Rubricperformancedesc5);
            rubric.setRurbicPerformanceDesc6(Rubricperformancedesc6);
            rubric.setRurbicPerformanceDesc7(Rubricperformancedesc7);
            rubric.setRurbicPerformanceDesc8(Rubricperformancedesc8);                                    
          }  
         return rubric;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;  
    }
    
    public void uploadRubric(String c0,String c1,String c2,String rubricName,String pd0,String pd1,String pd2,String pd3,String pd4,String pd5,String pd6,String pd7,String pd8,String pr0,
            String pr1,String pr2,String subjectCode,String newRubricID) throws SQLException{
        
         String sqlInsertRubric = "INSERT INTO rubric"
                    + "(Rubriccriteria0, Rubriccriteria1, Rubriccriteria2, Rubricname, Rubricperformancedesc0, Rubricperformancedesc1, Rubricperformancedesc2,Rubricperformancedesc3, Rubricperformancedesc4, Rubricperformancedesc5,Rubricperformancedesc6, Rubricperformancedesc7, Rubricperformancedesc8,Rubricperformancerating0, Rubricperformancerating1, Rubricperformancerating2, Subjectcode, RubricID)"
                    //+ "Rubricperformancedesc3, Rubricperformancedesc4, Rubricperformancedesc5,Rubricperformancedesc6, Rubricperformancedesc7, Rubricperformancedesc8"
                    //+ "Rubricperformancerating0, Rubricperformancerating1, Rubricperformancerating2, Subjectcode, RubricID)" 
                    + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ? )";    
        
        //create prepared statement for insert using connection
        //and the SQL string above
        //then execute
        int insertStatus = 0;
        jdbcUtility = new JdbcUtility();
        try {
            Connection con = jdbcUtility.jdbcConnect();
            PreparedStatement ps = con.prepareStatement(sqlInsertRubric);
            
            ps.setString(1, c0);
            ps.setString(2, c1);
            ps.setString(3, c2);
            ps.setString(4, rubricName);
            ps.setString(5, pd0);
            ps.setString(6, pd1);
            ps.setString(7, pd2);
            ps.setString(8, pd3);
            ps.setString(9, pd4);
            ps.setString(10, pd5);
            ps.setString(11, pd6);
            ps.setString(12, pd7);
            ps.setString(13, pd8);
            ps.setString(14, pr0);
            ps.setString(15, pr1);
            ps.setString(16, pr2);
            ps.setString(17, subjectCode);
            ps.setString(18,newRubricID);
            
            insertStatus = ps.executeUpdate();            
        }
        catch (Exception ex) {    
            ex.printStackTrace ();
        } 
  
    }
    
    public void deleteRubric(String rubricIDD){
        String sqlDeleteRubricById = "DELETE FROM rubric" +
                                      " WHERE RubricID = ?";
        jdbcUtility = new JdbcUtility();
        
        try {
            Connection con = jdbcUtility.jdbcConnect();
            PreparedStatement psdDeleteRubric = con.prepareStatement(sqlDeleteRubricById);
            
            psdDeleteRubric.setString(1, rubricIDD);            
            psdDeleteRubric.executeUpdate();
           
        }
        catch (Exception ex) {    
            ex.printStackTrace ();
        } 
    }
    
    
    
    
    
    
}
