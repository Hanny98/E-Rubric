/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DLL;

/**
 *
 * @author Acer
 */
import BLL.Factory.User;
import BLL.Factory.UserFactory;
import java.sql.*;
import java.util.Vector;

public class JdbcUtility {
    
    Connection con = null;
    String driver;
    String url;
    String userName;
    String password;
    String dbName;

    public JdbcUtility() {}
        
    public Connection jdbcConnect(){
        this.driver = "com.mysql.jdbc.Driver";
        this.dbName = "e-rubric";
        this.url = "jdbc:mysql://localhost/" + dbName + "?";
        this.userName = "root";
        this.password = "";
        
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userName, password);
            DatabaseMetaData dma = con.getMetaData ();
            System.out.println("\nConnected to " + dma.getURL());
            System.out.println("Driver       " + dma.getDriverName());
            System.out.println("Version      " + dma.getDriverVersion());
            System.out.println("");
            return con;
            
	}
	catch (SQLException ex){
            
            while (ex != null){
		System.out.println ("SQLState: " + ex.getSQLState ());
                System.out.println ("Message:  " + ex.getMessage ());
		System.out.println ("Vendor:   " + ex.getErrorCode ());
                ex = ex.getNextException ();
		System.out.println ("");
            }

            System.out.println("Connection to the database error");
	}
	catch (java.lang.Exception ex){
            ex.printStackTrace ();
	}
        return null;
    }
    
    
    public void jdbcConClose(){
        
   	try {
         con.close();
   	}
   	catch (Exception ex){
            ex.printStackTrace ();
        }
        
    }

    
}
