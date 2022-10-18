/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DELL
 */

@Builder
@Getter
@Setter
@ToString

public class Product {
    private int product_id;
    private String title;
    private float price;
    private float sale_price;
    private int quantity; //so luong san pham trong kho
    private String description;
    private String img;
    private int category_id;
    private Date create_date;

    public Product() {
    }

    public Product(int product_id, String title, float price, float sale_price, int quantity, String description, String img, int category_id, Date create_date) {
        this.product_id = product_id;
        this.title = title;
        this.price = price;
        this.sale_price = sale_price;
        this.quantity = quantity;
        this.description = description;
        this.img = img;
        this.category_id = category_id;
        this.create_date = create_date;
    }

    public Product(String title, float price, float sale_price, int quantity, String description, String img, int category_id, Date create_date) {
        this.title = title;
        this.price = price;
        this.sale_price = sale_price;
        this.quantity = quantity;
        this.description = description;
        this.img = img;
        this.category_id = category_id;
        this.create_date = create_date;
    }
    
}
