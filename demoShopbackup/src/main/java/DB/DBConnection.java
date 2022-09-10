/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBConnection {
   public static Connection CreateConnection(){
       Connection conn = null;
       String url="jdbc:mysql://localhost:3306/demoshop";
       String username="root";
       String password="123456";
       try {
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(url, username, password);
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }catch(SQLException e){
           e.printStackTrace();
       }
         
       
       return conn;
   }

  }