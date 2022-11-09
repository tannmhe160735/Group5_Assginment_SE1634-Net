/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Category;
import Entity.Product;
import Entity.Product_size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class ProductSizeDAO {

    Connection connection = DB.Binh_DBContext.CreateConnection();

    public ArrayList<Product_size> getSizeByProductId(int productId) {
        ArrayList<Product_size> list = new ArrayList<>();
        try {
            String sql = "SELECT [size]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product_size]\n"
                    + "  where product_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product_size prod = Product_size.builder()
                        .product_id(productId)
                        .size(rs.getInt(1))
                        .quantity(rs.getInt(2))
                        .build();
                list.add(prod);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int subtractSizeQuantity(int sub_quantity, int size_id) {

        String sql = "UPDATE [dbo].[product_size]\n"
                + "   SET \n"
                + "      [quantity] = quantity - ?\n"
                + " WHERE size_id = ?";
        int currentQuantity = getQuantityBySizeId(size_id);
        if (currentQuantity < sub_quantity) {
            return 0;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sub_quantity);
            ps.setInt(2, size_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getQuantityBySizeId(int size_id) {
        String sql = "SELECT [quantity]\n"
                + "  FROM [dbo].[product_size]\n"
                + "  where size_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, size_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
        }
        return 0;
    }

    public int getQuantityBySizeIdAndProductId(int size, int product_id) {
        String sql = "SELECT [quantity]\n"
                + "  FROM [dbo].[product_size]\n"
                + "  where size = ? and product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, size);
            ps.setInt(2, product_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
        }
        return 0;
    }

    public void AddProductSize(String product_id, String size, String quantity) {
        String sql = "INSERT INTO [product_size]\n"
                + "           ([product_id]\n"
                + "           ,[size]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ptmt = connection.prepareStatement(sql);
            ptmt.setString(1, product_id);
            ptmt.setString(2, size);
            ptmt.setString(3, quantity);
            ptmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        ProductSizeDAO dao = new ProductSizeDAO();

        System.out.println(dao.getQuantityBySizeIdAndProductId(40, 5));
    }
}
