/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.demoShop;

import DB.DBConnection;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAOTest {

    public static void main(String[] args) {
        Connection conn = DBConnection.CreateConnection();
        UserDAO dao = new UserDAO();
        List<UserModel> list = dao.listAllUser(conn);
        for (UserModel user : list) {
            System.out.println(user);

        }
    }
}
