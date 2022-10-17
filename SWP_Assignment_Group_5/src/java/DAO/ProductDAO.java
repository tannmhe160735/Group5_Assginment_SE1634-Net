/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.Linh_DBContext;
import Entity.Category;
import Entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
            String sql = "select * from product";
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
        List<Product> list = dao.getRelatedProductById(2);
        for (Product prod : list) {
            System.out.println(prod.toString());
        }
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from product where product.category_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
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

    public Product getProductById(int pro_id) {
        try {
            String sql = "select * from product where [product_id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pro_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                return product;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void EditProduct(int pro_id, String title, String price, String sale_price, String quantity, String description, String img, String category_id, String create_date) {
        String sql = "UPDATE [product]\n"
                + "                SET [title] = ?\n"
                + "                 ,[price] = ?\n"
                + "                   ,[sale_price] = ?\n"
                + "                  ,[quantity] = ?\n"
                + "                 ,[description] = ?\n"
                + "                 ,[img] = ?\n"
                + "                 ,[category_id] = ?\n"
                + "                    ,[create_date] = ?\n"
                + "                WHERE product_id = ?";

        try {
            PreparedStatement ptmt = connection.prepareStatement(sql);
            ptmt.setString(1, title);
            ptmt.setString(2, price);
            ptmt.setString(3, sale_price);
            ptmt.setString(4, quantity);
            ptmt.setString(5, description);
            ptmt.setString(6, img);
            ptmt.setString(7, category_id);
            ptmt.setString(8, create_date);
            ptmt.setInt(9, pro_id);
            ptmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void AddProduct(String title, String price, String sale_price, String quantity, String description, String img, String category_id, String create_date) {
        String sql = "INSERT INTO [product]\n"
                + "           ([title]\n"
                + "           ,[price]\n"
                + "           ,[sale_price]\n"
                + "           ,[quantity]\n"
                + "           ,[description]\n"
                + "           ,[img]\n"
                + "           ,[category_id]\n"
                + "           ,[create_date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement ptmt = connection.prepareStatement(sql);
            ptmt.setString(1, title);
            ptmt.setString(2, price);
            ptmt.setString(3, sale_price);
            ptmt.setString(4, quantity);
            ptmt.setString(5, description);
            ptmt.setString(6, img);
            ptmt.setString(7, category_id);
            ptmt.setString(8, create_date);
            ptmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void DeleteProductById(int pro_id) {
        try {
            String sql = "DELETE FROM [product]\n"
                    + "WHERE product_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pro_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getRelatedProductById(int productId) {
        List<Product> list = new ArrayList<>();
        Product p = getProductById(productId);
        try {
            String sql = "SELECT top 4 [product_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[sale_price]\n"
                    + "      ,[quantity]\n"
                    + "      ,[description]\n"
                    + "      ,[img]\n"
                    + "      ,[category_id]\n"
                    + "      ,[create_date]\n"
                    + "  FROM [dbo].[product]\n"
                    + "  where category_id = ? and product_id != ? order by price desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getCategory_id());
            ps.setInt(2, productId);
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
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
