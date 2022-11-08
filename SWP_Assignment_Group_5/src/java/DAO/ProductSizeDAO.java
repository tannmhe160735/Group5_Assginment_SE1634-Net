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
    public static void main(String[] args){ 
            ProductSizeDAO dao = new ProductSizeDAO();
        System.out.println(dao.getSizeByProductId(2));
    }
}

