/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class CartDAO {

    Connection connection = DB.Binh_DBContext.CreateConnection();

    public List<Cart> GetCartByUser(int user_id) {
        String sql = "Select * from cart where user_id=?";
        List<Cart> carts = new ArrayList<>();
        try {
            PreparedStatement ptmt = connection.prepareStatement(sql);
            ptmt.setInt(1, user_id);
            ResultSet rs = ptmt.executeQuery();
            while (rs.next()) {
                ProductDAO dao = new ProductDAO();
                Cart cart = Cart.builder().product(dao.getProductById(rs.getInt("product_id")))
                        .quantity(rs.getInt("quantity"))
                        .size(rs.getInt("size"))
                        .build();
                carts.add(cart);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return carts;
    }

    public void AddToCart(int user_id, int product_id, int size, int quantity) {
        List<Cart> carts = new CartDAO().GetCartByUser(user_id);

        String sql_raw = "select * from cart where [user_id]= ? and [product_id]=? and size=?";
        try {
            PreparedStatement ptmt_raw = connection.prepareStatement(sql_raw);
            ptmt_raw.setInt(1, user_id);
            ptmt_raw.setInt(2, product_id);
            ptmt_raw.setInt(3, size);
            ResultSet rs_raw = ptmt_raw.executeQuery();
            if (rs_raw.next()) {
                String sql = "update cart set quantity = ? where product_id = ? and [user_id] = ? and size = ?";
                try {
                    PreparedStatement ptmt = connection.prepareStatement(sql);
                    ptmt.setInt(1, rs_raw.getInt("quantity") + quantity);
                    ptmt.setInt(2, product_id);
                    ptmt.setInt(3, user_id);
                    ptmt.setInt(4, size);
                    ptmt.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } else {
                String sql = "insert into cart([user_id],product_id,quantity,size) values(?,?,?,?);";
                try {
                    PreparedStatement ptmt = connection.prepareStatement(sql);
                    ptmt.setInt(1, user_id);
                    ptmt.setInt(2, product_id);
                    ptmt.setInt(3, quantity);
                    ptmt.setInt(4, size);
                    ptmt.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();;
        }

    }

    public void DeleteCart(int user_id, int prod_id, int size) {
        String sql = "DELETE FROM cart WHERE [user_id]= ? and [product_id]=? and size=?";
        try {
            PreparedStatement ptmt = connection.prepareStatement(sql);
            ptmt.setInt(1, user_id);
            ptmt.setInt(2, prod_id);
            ptmt.setInt(3,size);
            ptmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        List<Cart> carts = dao.GetCartByUser(3);
        for (Cart cart : carts) {
            System.out.println(cart);
        }
        dao.DeleteCart(3, 2, 41);

    }
}
