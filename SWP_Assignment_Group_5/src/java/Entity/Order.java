/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

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
    private int prod_id;
    private int quantity;

    public Order() {
    }

    public Order(int ord_id, int prod_id, int quantity) {
        this.ord_id = ord_id;
        this.prod_id = prod_id;
        this.quantity = quantity;
    }
    
}
