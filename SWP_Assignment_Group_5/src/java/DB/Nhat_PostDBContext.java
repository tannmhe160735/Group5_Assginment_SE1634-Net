/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Entity.Post;

/**
 *
 * @author Thinkpad
 */
public class Nhat_PostDBContext extends Nhat_DBContext<Post>{
    public ArrayList<Post> listAllPost() {
        try {
            ArrayList<Post> listOfPost = new ArrayList<Post>();
            String sql = "select * from post";
            PreparedStatement prstm = connection.prepareStatement(sql);
            ResultSet rs = prstm.executeQuery();
            while (rs.next()) {
                Post a = new Post(rs.getInt("ID"), rs.getString("post_title"), rs.getString("content1"),rs.getString("content2"), rs.getString("img"), rs.getDate("post_date"));
                listOfPost.add(a);
            }
            return listOfPost;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Post getAPostByID(int post_id) {
        try {
            String sql = "select * from post where post.post_id = ?";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, post_id);
            ResultSet rs = prstm.executeQuery();
            if (rs.next()) {
                Post a = new Post(rs.getInt("post_id"), rs.getString("post_title"), rs.getString("content1"),rs.getString("content2"), rs.getString("img"), rs.getDate("post_date"));
                return a;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
