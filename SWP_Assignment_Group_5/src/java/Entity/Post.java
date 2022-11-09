/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Thinkpad
 */
public class Post {
    private int id;
    private int product_id;
    private String post_title;
    private String content1;
    private String content2;
    private String image_path;
    private Date post_date;

    public Post() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }

    public Post(int id, int product_id,String post_title, String content1,String content2, String image_path, Date post_date) {
        this.id = id;
        this.post_title = post_title;
        this.content1 = content1;
        this.content2 = content2;
        this.image_path = image_path;
        this.post_date = post_date;
        this.product_id=product_id;
    }

    public int getId() {
        return id;
    }

    public String getPost_title() {
        return post_title;
    }

    public String getContent1() {
        return content1;
    }
    public String getContent2() {
        return content2;
    }

    public String getImage_path() {
        return image_path;
    }

    public Date getPost_date() {
        return post_date;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Post{" + "id=" + id + ", post_title=" + post_title + ", content1=" + content1 + ", content2=" + content2 + ", image_path=" + image_path + ", post_date=" + post_date + '}';
    }

//    @Override
//    public int compareTo(Post o) {
//        boolean cmpID= this.id==o.id;
//        boolean cmpPost_title = this.post_title.equals(o.post_title);
//        boolean cmpContent1 = this.content1.equals(o.content1);
//        boolean cmpContent2 = this.content2.equals(o.content2);
//        boolean cmpImage_path= this.image_path.equals(o.image_path);
//        boolean cmpPost_date= this.post_date.toString().equals(o.post_date.toString());
//        
//        boolean and = cmpID && cmpPost_title && cmpContent1 && cmpContent2 && cmpImage_path && cmpPost_date;
//        return and?;
//    }
    
}
