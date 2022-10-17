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
            if (rs.next()) {
                acc.setAcc_id(rs.getInt("acc_id"));
                acc.setAcc_name(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setPhone(rs.getInt("phone"));
                acc.setAddress(rs.getString("address"));
                acc.setRole_id(rs.getInt("role_id"));
                acc.setAvatar(rs.getString("avatar"));
                return acc;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<Account> list() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select acc_id, fullname, email, gender, phone, address, role_id from account";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setAcc_id(rs.getInt("acc_id"));
                acc.setAcc_name(rs.getString("fullname"));
                acc.setEmail(rs.getString("email"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setPhone(rs.getInt("phone"));
                acc.setAddress(rs.getString("address"));
                acc.setRole_id(rs.getInt("role_id"));
                accounts.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public void DeleteAccountById(int acc_id) {
        try {
            String sql = "DELETE FROM [account]\n"
                    + "WHERE acc_id =?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, acc_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateRoleAccountById(String acc_id, String role) {
        try {
            String sql = "UPDATE [account] \n"
                    + "   SET [role_id] = ?\n"
                    + " WHERE acc_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, role);
            stm.setString(2, acc_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void RegisterNewAccount(String email, String password , String fullname) {
        try {
            String sql = "INSERT INTO [account]\n"
                    + "           ([email]\n"
                    + "           ,[password],[role_id],[fullname]\n"
                    + ")\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?,?,?)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, "3");
            stm.setString(4, fullname);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Account> ListRoleId() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select distinct [role_id] from account";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setRole_id(rs.getInt("role_id"));
                accounts.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        dao.UpdateRoleAccountById("3", "3");
        ArrayList<Account> accounts = dao.list();
        for (Account account : accounts) {
            System.out.println(account);
        }
    }
}
