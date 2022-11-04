/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import Entity.Product;
import java.sql.Date;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 *
 * @author DELL
 */
public class ProductDAOJUnitTest {

    public ProductDAOJUnitTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
        @Test
    public void testGetAllCategories() {
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
            count++;
        }
        if (count == 13) {
            check = true;
        } else {
            check = false;
        }
//        assertEquals(check, true);  
    }
    
        @Test
    public void testGetAllProducts() {
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
            count++;
        }
        if (count == 13) {
            check = true;
        } else {
            check = false;
        }
//        assertEquals(check, true);  
    }
    
    @Test
    public void testGetProductsByCategoryId1() {
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
            count++;
        }
        if (count == 13) {
            check = true;
        } else {
            check = false;
        }
//        assertEquals(check, true);  
    }

    @Test
    public void testGetProductsByCategoryId2() {
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
            count++;
        }
        if (count == 13) {
            check = true;
        } else {
            check = false;
        }
//        assertEquals(check, true);  
    }

    @Test
    public void testGetProductsByCategoryId3() {
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
            count++;
        }
        if (count == 13) {
            check = true;
        } else {
            check = false;
        }
//        assertEquals(check, true);  
    }

    @Test
    public void testGetProductsById1() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
//        assertEquals(expected_result.getProduct_id(), product.getProduct_id());
//        assertEquals(expected_result.getTitle(), product.getTitle());
//        assertEquals(expected_result.getSale_price(),product.getSale_price() , 0);
//        assertEquals(expected_result.getPrice(),product.getPrice() , 91);
//        assertEquals(expected_result.getQuantity(), product.getQuantity());
//        assertEquals(expected_result.getDescription(), product.getDescription());
//        assertEquals(expected_result.getImg(), product.getImg());
//        assertEquals(expected_result.getCategory_id(), product.getCategory_id());
//        assertEquals(expected_result.getCreate_date(), product.getCreate_date());
    }

    @Test
    public void testGetProductsById2() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
    }

    @Test
    public void testGetProductsById3() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
    }

    @Test
    public void testGetRelatedProductById1() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
    }
    @Test
    public void testGetRelatedProductById2() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
    }
    @Test
    public void testGetRelatedProductById3() {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(2);
        Date date;
        date = Date.valueOf("2022-09-30");
        Product expected_result = new Product(2, "AIR JORDAN 1", 91, 0, 17, "Displaced fracture of glenoid cavity of scapula, left shoulder, initial encounter for closed fracture",
                "https://cdn.discordapp.com/attachments/1031493465688772608/1031493607963766794/jumpman-air-jordan-nike-air-max-sneakers-jordan-d2f12df992073df82ad4b6a196314823.png", 1, date);
    }

}
