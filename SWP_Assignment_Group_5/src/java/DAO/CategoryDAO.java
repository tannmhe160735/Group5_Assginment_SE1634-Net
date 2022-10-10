/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.Linh_DBContext;
import Entity.Category;
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
public class CategoryDAO extends Linh_DBContext {

    Connection connection = DB.Linh_DBContext.CreateConnection();

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
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
            CategoryDAO dao = new CategoryDAO();
            List<Category> category = dao.getAllCategories();
            for (Category cate : category) {
                System.out.println(cate);
        }
    }
}