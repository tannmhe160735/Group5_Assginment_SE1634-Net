/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Account;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    Connection conn = DB.Binh_DBContext.CreateConnection();

    public Account getAccountByLogin(String email, String pass) {
        Account acc = new Account();
        String sql = "select * from account where email = ? and [password] = ?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, email);
            ptmt.setString(2, pass);
            ResultSet rs = ptmt.executeQuery();
            if(rs.next()){
                acc.setAcc_id(rs.getInt("acc_id"));
                acc.setAcc_name(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setPhone(rs.getInt("phone"));
                acc.setAddress(rs.getString("address"));
                acc.setRole_id(rs.getInt("role_id"));
                acc.setAvatar(rs.getString("avatar"));
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return acc;
    }
    
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account acc = dao.getAccountByLogin("ngocchubedan@gmail.com", "ngocngungo");
        System.out.println(acc);
    }
}
