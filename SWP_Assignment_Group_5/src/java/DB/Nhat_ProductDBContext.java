/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import Entity.Feedback;
import Entity.Post;
import Entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class Nhat_ProductDBContext extends Nhat_DBContext<Product> {

    public ArrayList<Product> listAllIdAndTitleOfProduct() {
        try {
            ArrayList<Product> listOfProduct = new ArrayList<Product>();
            String sql = "select product_id,title from product";
            PreparedStatement prstm = connection.prepareStatement(sql);
            ResultSet rs = prstm.executeQuery();
            while (rs.next()) {
                Product a = new Product(rs.getInt("product_id"), rs.getString("title"), 0, 0, 1, null, null, 1, null);
                listOfProduct.add(a);
            }
            return listOfProduct;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getIdAndTitleAndPriceAndImgOfProduct(int productID) {
        try {
            String sql = "select product_id,title,price,img from product where product_id=?";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, productID);
            ResultSet rs = prstm.executeQuery();
            if (rs.next()) {
                Product a = new Product(rs.getInt("product_id"), rs.getString("title"), rs.getFloat("price"), 0, 1, null, rs.getString("img"), 1, null);
                return a;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getIdAndTitleAndPriceAndImgOfProductByFeedbackId(int feedbackID) {
        try {
            String sql = "select dbo.product.product_id as productID, dbo.product.title as productTitle\n"
                    + "from dbo.feedback, dbo.product\n"
                    + "where dbo.feedback.product_id= dbo.product.product_id and dbo.feedback.feedback_id= ?";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, feedbackID);
            ResultSet rs = prstm.executeQuery();
            if (rs.next()) {
                Product a = new Product(rs.getInt("productID"), rs.getString("productTitle"), 0, 0, 1, null, "", 1, null);
                return a;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getSumOfStarsOfProductByFeedbackId(int feedbackID) {
        try {
            String sql = "select dbo.feedback.number_of_star as starOfAfeedback\n"
                    + "from dbo.feedback\n"
                    + "where dbo.feedback.product_id=\n"
                    + "(\n"
                    + "select dbo.product.product_id as productID\n"
                    + "from dbo.feedback, dbo.product\n"
                    + "where dbo.feedback.product_id= dbo.product.product_id and dbo.feedback.feedback_id= ?)";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, feedbackID);
            ResultSet rs = prstm.executeQuery();
            int count = 0;
            int sum = 0;
            while (rs.next()) {
                count++;
                sum += rs.getInt("starOfAfeedback");
            }
            double a= (double)sum/(double)count;
            a= (double)Math.ceil(a*100)/100;
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
