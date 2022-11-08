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

public class Cart {
    private Product product;
    private int quantity; //so luong san pham tren gio hang
    private int size;
    
    
}
