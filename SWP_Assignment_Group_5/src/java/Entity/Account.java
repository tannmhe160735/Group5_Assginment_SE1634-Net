/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author Admin
 */
public class Account {
        private int acc_id;
        private String acc_name;
        private String email;
        private String password;
        private boolean gender;
        private int phone;
        private String address;
        private int role_id;
        private String avatar;

    public Account() {
    }

    public Account(int acc_id, String acc_name, String email, String password, boolean gender, int phone, String address, int role_id, String avatar) {
        this.acc_id = acc_id;
        this.acc_name = acc_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role_id = role_id;
        this.avatar = avatar;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Account{" + "acc_id=" + acc_id + ", acc_name=" + acc_name + ", email=" + email + ", password=" + password + ", gender=" + gender + ", phone=" + phone + ", address=" + address + ", role_id=" + role_id + ", avatar=" + avatar + '}';
    }
        
        
}
