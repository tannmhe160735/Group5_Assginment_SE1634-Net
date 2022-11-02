/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Order;
import Entity.OrderDetail;
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
 * @author Admin
 */
public class OrderDAO {

    Connection conn = DB.Binh_DBContext.CreateConnection();

    public List<OrderDetail> GetAllOrder() {
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        String sql = "select * from [order]";
        String listOrder = "select * from order_detail where order_id = ?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while (rs.next()) {
                List<Order> orders = new ArrayList<Order>();
                OrderDetail order = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .user_id(rs.getInt("user_id"))
                        .address(rs.getString("address"))
                        .phone(rs.getString("phone"))
                        .email(rs.getString("email"))
                        .payment(rs.getString("payment"))
                        .status(rs.getBoolean("status")).build();

                PreparedStatement ptmtOrder = conn.prepareStatement(listOrder);
                ptmtOrder.setInt(1, order.getOrd_id());
                ResultSet rsOrders = ptmtOrder.executeQuery();
                while (rsOrders.next()) {
                    orders.add(Order.builder()
                            .ord_id(rsOrders.getInt("order_id"))
                            .prod_id(rsOrders.getInt("product_id"))
                            .quantity(rsOrders.getInt("quantity"))
                            .build());
                }
                order.setListOrders(orders);
                list.add(order);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public List<OrderDetail> GetOrderByMonth() {
        List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
        try {
            String sql = "select P.product_id, D.quantity, O.order_id "
                    + "from [order] O, order_detail D  , product P\n"
                    + "where O.order_id = D.order_id and D.product_id = P.product_id and MONTH(O.date_created) = 11 and YEAR(O.date_created) = 2022";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail order = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .user_id(rs.getInt("user_id"))
                        .address(rs.getString("address"))
                        .phone(rs.getString("phone"))
                        .email(rs.getString("email"))
                        .payment(rs.getString("payment"))
                        .status(rs.getBoolean("status")).build();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<OrderDetail> list = dao.GetAllOrder();
        for (OrderDetail order : list) {
            System.out.println("OrderID: " + order.getOrd_id());
            System.out.println("UserID: " + order.getUser_id());
            System.out.println("Email: " + order.getEmail());
            System.out.println("Adress: " + order.getAddress());
            System.out.println("Phone: " + order.getPhone());
            System.out.println("Payment Method:" + order.getPayment());
            System.out.println("Order Status: " + order.isStatus());
            System.out.println("List Order Product:");
            for (Order orderDetail : order.getListOrders()) {
                System.out.println(orderDetail.getProd_id() + ": " + orderDetail.getQuantity());
            }
            System.out.println("");
        }
    }
}
