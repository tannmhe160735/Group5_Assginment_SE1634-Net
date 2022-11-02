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
     public List<Order> GetAllOrder(){
         List<Order> list = new ArrayList<Order>();
         String sql = "select * from [order]";
         String listOrder = "select * from order_detail where order_id = ?";
         try {
             PreparedStatement ptmt = conn.prepareStatement(sql);
             ResultSet rs = ptmt.executeQuery();
             while(rs.next()){
                  AccountDAO acc_dao = new AccountDAO();
                 List<OrderDetail> orders = new ArrayList<OrderDetail>();
                 Order order = Order.builder()
                         .ord_id(rs.getInt("order_id"))
                         .acc(acc_dao.getAccountById(rs.getInt("user_id")))
                         .address(rs.getString("address"))
                         .phone(rs.getString("phone"))
                         .email(rs.getString("email"))
                         .payment(rs.getString("payment"))
                         .date_created(rs.getDate("date_created").toString())
                         .status(rs.getInt("status")).build()
                         ;

                 PreparedStatement ptmtOrder = conn.prepareStatement(listOrder);
                 ptmtOrder.setInt(1, order.getOrd_id());
                 ResultSet rsOrders = ptmtOrder.executeQuery();
                 while(rsOrders.next()){
                     ProductDAO prod_dao = new ProductDAO();
                     orders.add(OrderDetail.builder()
                             .ord_id(rsOrders.getInt("order_id"))
                             .product(prod_dao.getProductById(rsOrders.getInt("product_id")))
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
     
     public void ChangeStatus(int status, int id){
         String sql="UPDATE [dbo].[order] SET [status] = ? WHERE order_id=?";
         try {
             PreparedStatement ptmt = conn.prepareStatement(sql);
             ptmt.setInt(1, status);
             ptmt.setInt(2, id);
             ptmt.executeUpdate();
         } catch (SQLException ex) {
             ex.printStackTrace();
         }
         
     }
     public static void main(String[] args) {
         OrderDAO dao = new OrderDAO();
          List<Order> list = dao.GetAllOrder();
            for (Order order : list) {
                System.out.println("Date Created: "+order.getDate_created());
                System.out.println("OrderID: "+order.getOrd_id());
                System.out.println("UserName: "+order.getAcc().getAcc_name());
                System.out.println("Email: "+order.getEmail());
                System.out.println("Adress: "+order.getAddress());
                System.out.println("Phone: "+order.getPhone());
                System.out.println("Payment Method:"+order.getPayment());
                System.out.println("Order Status: "+order.getStatus());
                System.out.println("List Order Product:");
                for (OrderDetail orderDetail : order.getListOrders()) {
                    System.out.println(orderDetail.getProduct().getTitle()+": "+orderDetail.getQuantity());
                }
                order.setListOrders(orders);
                list.add(order);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    

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
}
