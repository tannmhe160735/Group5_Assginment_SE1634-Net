/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.text.SimpleDateFormat;
import java.util.Date;



/**
 *
 * @author Admin
 */
public class Voucher {

    private String voucher_code;
    private String voucher_create;
    private String voucher_experience;
    private double voucher_discount;

    public Voucher() {
    }
    
    public Voucher(String voucher_code, String voucher_create, String voucher_experience, double voucher_discount) {
        this.voucher_code = voucher_code;
        this.voucher_create = voucher_create;
        this.voucher_experience = voucher_experience;
        this.voucher_discount = voucher_discount;
    }
    
    
    public String getVoucher_code() {
        return voucher_code;
    }

    public void setVoucher_code(String voucher_code) {
        this.voucher_code = voucher_code;
    }

    public String getVoucher_create() {
        return voucher_create;
    }

    public void setVoucher_create(String voucher_create) {
        this.voucher_create = voucher_create;
    }

    public String getVoucher_experience() {
        return voucher_experience;
    }

    public void setVoucher_experience(String voucher_experience) {
        this.voucher_experience = voucher_experience;
    }

    public double getVoucher_discount() {
        return voucher_discount;
    }

    public void setVoucher_discount(double voucher_discount) {
        this.voucher_discount = voucher_discount;
    }

    @Override
    public String toString() {
        return "Voucher{" + "voucher_code=" + voucher_code + ", voucher_create=" + voucher_create + ", voucher_experience=" + voucher_experience + ", voucher_discount=" + voucher_discount + '}';
    }
    
    
}
