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
public class Nhat_PostDBContext extends Nhat_DBContext<Post> {

    public ArrayList<Post> listAllPost() {
        try {
            ArrayList<Post> listOfPost = new ArrayList<Post>();
            String sql = "select * from post";
            PreparedStatement prstm = connection.prepareStatement(sql);
            ResultSet rs = prstm.executeQuery();
            while (rs.next()) {
                Post a = new Post(rs.getInt("ID"),1, rs.getString("post_title"), rs.getString("content1"), rs.getString("content2"), rs.getString("img"), rs.getDate("post_date"));
                listOfPost.add(a);
            }
            return listOfPost;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Post> listAllPostPaginaged(int noPage) {
        try {
            ArrayList<Post> listOfPost = new ArrayList<Post>();
            String sql = "SELECT post_id,post_title,content1,img,post_date FROM post ORDER BY post_date desc\n"
                    + "OFFSET (?-1)*5 ROWS \n"
                    + "FETCH NEXT 5 ROWS ONLY;";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, noPage);
            ResultSet rs = prstm.executeQuery();
            while (rs.next()) {
                Post a = new Post(rs.getInt("post_id"),1, rs.getString("post_title"), rs.getString("content1"),"", rs.getString("img"), rs.getDate("post_date"));
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
                Post a = new Post(rs.getInt("post_id"),rs.getInt("product_id"), rs.getString("post_title"), rs.getString("content1"), rs.getString("content2"), rs.getString("img"), rs.getDate("post_date"));
                return a;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public int getTotalNumberOfPost() {
        try {
            String sql = "select count(post.post_id) as count from post ";
            PreparedStatement prstm = connection.prepareStatement(sql);
            ResultSet rs = prstm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void addThisPost(Post thisPost) {
        try {
            String sql = "INSERT INTO [dbo].[post]\n" +
"           ([product_id]\n" +
"           ,[post_title]\n" +
"           ,[content1]\n" +
"           ,[content2]\n" +
"           ,[img]\n" +
"           ,[post_date])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
            PreparedStatement prstm = connection.prepareStatement(sql);
            prstm.setInt(1, thisPost.getProduct_id());
            prstm.setString(2, thisPost.getPost_title());
            prstm.setString(3, thisPost.getContent1());
            prstm.setString(4, thisPost.getContent2());
            prstm.setString(5, thisPost.getImage_path());
            prstm.setDate(6, thisPost.getPost_date());
            prstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Nhat_PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
