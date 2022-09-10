/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.demoShop;
import DB.DBConnection;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Admin
 */
public class UserDAO {

    public List<UserModel> listAllUser(Connection conn) {

        List<UserModel> list = new ArrayList<UserModel>();
        String sql = "SELECT * FROM demoshop.user";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while (rs.next()) {
                UserModel user = new UserModel();
                String id = rs.getString("user_id");
                String name = rs.getString("user_name");
                String email = rs.getString("user_email");
                String address = rs.getString("user_address");
                String phone = rs.getString("user_phone");
                list.add(new UserModel(id, name, email, address, phone));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void deleteUser(Connection conn,String id) {
        String sql="DELETE FROM `demoshop`.`user` WHERE (`user_id` = ?)";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, id);
            ptmt.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
        }  
    }
    
    public void addUser(Connection conn, String name, String email, String address, String phone){
        String sql = "INSERT INTO `demoshop`.`user` (`user_name`, `user_email`, `user_address`, `user_phone`) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, name);
            ptmt.setString(2, email);
            ptmt.setString(3, address);
            ptmt.setString(4, phone);
            ptmt.executeUpdate();   
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
      public void editUser(Connection conn, String name, String email, String address, String phone, String uid){
        String sql = "UPDATE `demoshop`.`user` SET `user_name` = ?, `user_email` = ?, `user_address` = ?, `user_phone` = ? WHERE (`user_id` =  ?);";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, name);
            ptmt.setString(2, email);
            ptmt.setString(3, address);
            ptmt.setString(4, phone);
            ptmt.setString(5, uid);
            ptmt.executeUpdate();   
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public UserModel getUserByID(Connection conn, String uid){
   
        String sql = "SELECT * FROM demoshop.user where (user_id = ?)";
         UserModel user = new UserModel();
        try {
          
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, uid);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                String id = rs.getString("user_id");
                String name = rs.getString("user_name");
                String email = rs.getString("user_email");
                String address = rs.getString("user_address");
                String phone = rs.getString("user_phone");
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setAddress(address);
                user.setPhone(phone);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }

   
}
