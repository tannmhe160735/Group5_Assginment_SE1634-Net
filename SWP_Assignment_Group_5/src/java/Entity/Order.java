
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;
import java.util.List;
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

public class Order {
    private int ord_id;
    private String name;
    private String address;
    private String phone;
    private String email;
    private Account acc;
    private String payment;
    private float total_price;
    private int status;
    private String voucher_code;
    private Date date_created;
    List<OrderDetail> listOrders;


    
    
    
}
