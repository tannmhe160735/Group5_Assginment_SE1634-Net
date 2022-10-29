/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

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

public class OrderDetail {
    private int ord_id;
    private String address;
    private String phone;
    private String email;
    private int user_id;
    private String payment;
    private boolean status;
    List<Order> listOrders;

    @Override
    public String toString() {
        return "OrderDetail{" + "ord_id=" + ord_id + ", address=" + address + ", phone=" + phone + ", email=" + email + ", user_id=" + user_id + ", payment=" + payment + ", status=" + status + "}" ;
    }
    
    
}
