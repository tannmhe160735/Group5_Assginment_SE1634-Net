/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import Entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class Nhat_AccountDBContext extends Nhat_DBContext<Account> {

    public Account getAccountByFeedbackID(int feedbackID) {
        try {
            String sql = "select dbo.account.acc_id as accID,  dbo.account.fullname as fullname\n"
                    + "from dbo.feedback, dbo.account\n"
                    + "where dbo.account.acc_id= dbo.feedback.user_id and dbo.feedback.feedback_id= ?";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, feedbackID);
            ResultSet rs = prstm.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAcc_id(rs.getInt("accID"));
                a.setAcc_name(rs.getString("fullname"));
                System.out.println("9999999"+a.getAcc_name());
                return a;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
