/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Order;
import Entity.OrderDetail;
import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minht
 */
public class AdminDAO {
    Connection conn = DB.Binh_DBContext.CreateConnection();
    public float GetOrderByMonth1(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 1 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    
    
    public float GetOrderByMonth2(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 2 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth3(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 3 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth4(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 4 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth5(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 5 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth6(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 6 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth7(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 7 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth8(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 8 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth9(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 9 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth10(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 10 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth11(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 11 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
    public float GetOrderByMonth12(){
        List<OrderDetail> orderdetails = new ArrayList<>();
        float revenue1 = 0;
        String sql = "select P.product_id,P.price, D.quantity, D.order_id \n"
                + "from [order] O, order_detail D  , product P\n"
                + "where O.order_id = D.order_id and D.product_id = P.product_id \n"
                + "and MONTH(O.date_created) = 12 and YEAR(O.date_created) = 2022 and O.status = 2";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ResultSet rs = ptmt.executeQuery();
            while(rs.next()){
                Product pro = Product.builder()
                        .product_id(rs.getInt("product_id"))
                        .price(rs.getFloat("price")).build();
                OrderDetail orderdetail = OrderDetail.builder()
                        .ord_id(rs.getInt("order_id"))
                        .product(pro)
                        .quantity(rs.getInt("quantity")).build();
                orderdetails.add(orderdetail);             
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        for (OrderDetail orderdetail : orderdetails) {
            revenue1 += orderdetail.getProduct().getPrice()*orderdetail.getQuantity();
        }
        return revenue1;
    }
    
   public int CountOrder(){
       List<OrderDetail> orderdetails = new ArrayList<>();
       String sql = "select O.order_id\n" +
                    "from [order] O, order_detail D  , product P\n" +
                    "where O.order_id = D.order_id and D.product_id = P.product_id \n" +
                    "and YEAR(O.date_created) = 2022";
       int count = 0;
       try {
           PreparedStatement ptmt = conn.prepareStatement(sql);
           ResultSet rs = ptmt.executeQuery();
           while(rs.next()){
               count++;
           }
       } catch (Exception ex) {
           ex.printStackTrace();
       }
       return count;
   }
   
   public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        int count = dao.CountOrder();
        System.out.println(count);
    }
}
