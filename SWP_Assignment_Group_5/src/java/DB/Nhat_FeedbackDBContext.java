/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import Entity.Account;
import Entity.Feedback;
import Entity.Product;
import java.sql.Date;
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
public class Nhat_FeedbackDBContext extends Nhat_DBContext<Feedback>{
    public ArrayList<Feedback> listAllFeedbackStarAndContentByProductID(int productID){
        try {
            ArrayList<Feedback> listOfFeedback = new ArrayList<Feedback>();
            String sql = "select feedback_id, number_of_star,feedback_content from feedback where product_id = ? ORDER BY feedback_id desc";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, productID);
            ResultSet rs = prstm.executeQuery();
            while (rs.next()) {
                System.out.println("1");
                Feedback a = new Feedback(rs.getInt("feedback_id"), 
                        new Product(1/*rs.getInt("product_id")*/, null, 0, 0, 1, null, null, 1, null),
                        null,
                        rs.getInt("number_of_star"), 
                        rs.getString("feedback_content"), 
                        null/*rs.getDate("feedback_date")*/);
                listOfFeedback.add(a);
            }
            return listOfFeedback;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
