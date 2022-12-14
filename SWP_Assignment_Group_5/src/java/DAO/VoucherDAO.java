/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Voucher;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class VoucherDAO {

    Connection conn = DB.Binh_DBContext.CreateConnection();

    public List<Voucher> GetAllVoucher() {
        List<Voucher> voucher = new ArrayList<Voucher>();
        String sql = "select * from voucher_new";
        SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();

            while (rs.next()) {
                try {
                    Voucher vc = new Voucher();
                    vc.setVoucher_code(rs.getString("voucher_code"));
                    vc.setVoucher_create(DateFor.format(rs.getDate("voucher_create")));
                    vc.setVoucher_experience(DateFor.format(rs.getDate("voucher_experience")));
                    vc.setVoucher_discount(rs.getDouble("voucher_discount"));
                    voucher.add(vc);
                } catch (Exception e) {

                }

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return voucher;

    }

    public void AddNewVoucher(String code, String create, String experience, double discount) {
        String sql = " INSERT INTO [dbo].[voucher_new] VALUES (?,?,?,?)";

        PreparedStatement ptmt;
        try {
            ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, code);
            ptmt.setString(2, create);
            ptmt.setString(3, experience);
            ptmt.setDouble(4, discount);
            ptmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public boolean CheckVoucherCode(String code) {
        boolean rs = false;
        List<Voucher> voucher = new ArrayList<Voucher>();
        String sql = "select * from voucher_new where voucher_code = ? ";

        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, code);
            ResultSet rss = ptmt.executeQuery();

            if (rss.next()) {
                rs = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public void DeleteVoucher(String code) {
        String sql = "DELETE FROM [dbo].[voucher_new] WHERE voucher_code = ?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, code);
            ptmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void EditVoucher(String old_code, String new_code, String experience, double discount) {
        String sql = "UPDATE [dbo].[voucher_new] SET "
                + "[voucher_code] = ?,"
                + "[voucher_experience] = ?,"
                + "[voucher_discount] = ? WHERE voucher_code =? ";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, new_code);
            ptmt.setString(2, experience);
            ptmt.setDouble(3, discount);
            ptmt.setString(4, old_code);
            ptmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        VoucherDAO dao = new VoucherDAO();

        System.out.println(dao.getDiscountPercentById("SALETHANG10"));

    }

    public float getDiscountPercentById(String voucher_code) {
        String sql = "SELECT  [voucher_discount]\n"
                + ",[voucher_experience]\n"
                + "  FROM [data].[dbo].[voucher_new]\n"
                + "  where voucher_code=?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setString(1, voucher_code);
            ResultSet rs = ptmt.executeQuery();
            while (rs.next()) {
                try {
                    Date expired = rs.getDate("voucher_experience");
                    Date today = new Date(System.currentTimeMillis());
//                    System.out.println(today.before(expired));
                    if (today.before(expired)) {
                        return rs.getFloat("voucher_discount");
                    }
                } catch (Exception e) {    
                    System.out.println(e.getMessage());
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

}
