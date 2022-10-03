/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Voucher;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
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
                Voucher vc = new Voucher();
                vc.setVoucher_code(rs.getString("voucher_code"));
                vc.setVoucher_create(DateFor.format(rs.getDate("voucher_create")));
                vc.setVoucher_experience(DateFor.format(rs.getDate("voucher_experience")));
                vc.setVoucher_discount(rs.getDouble("voucher_discount"));
                voucher.add(vc);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return voucher;

    }
    public static void main(String[] args) {
            VoucherDAO dao = new VoucherDAO();
            List<Voucher> voucher = dao.GetAllVoucher();
            for (Voucher vc : voucher) {
                System.out.println(vc);
        }
    }
}
