/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.Binh_DBContext;
import DB.Linh_DBContext;
import Entity.Category;
import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ProductDAO extends Binh_DBContext {

    Connection connection = DB.Binh_DBContext.CreateConnection();

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .product_id(rs.getInt(1))
                        .title(rs.getString(2))
                        .price(rs.getFloat(3))
                        .sale_price(rs.getFloat(4))
                        .quantity(rs.getInt(5))
                        .description(rs.getString(6))
                        .img(rs.getString(7))
                        .category_id(rs.getInt(8))
                        .create_date(rs.getDate(9))
                        .build();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
          ProductDAO dao = new ProductDAO();
            List<Product> list = dao.getAllProducts();
            for (Product prod : list) {
                System.out.println(prod.toString());
    }
}
}
