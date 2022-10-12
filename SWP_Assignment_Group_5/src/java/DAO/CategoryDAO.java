/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.Binh_DBContext;
import DB.Linh_DBContext;
import DB.Nhat_DBContext;
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
public class CategoryDAO extends Nhat_DBContext<Category> {

    //Connection connection = DB.Linh_DBContext.CreateConnection();

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from category";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = Category.builder()
                        .cate_id(rs.getInt(1))
                        .cate_name(rs.getString(2)).build();
                list.add(category);
                System.out.println("1");
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
            CategoryDAO dao = new CategoryDAO();
            List<Category> list = dao.getAllCategories();
            for (Category category : list) {
                System.out.println(category.toString());
        }
    }
}
