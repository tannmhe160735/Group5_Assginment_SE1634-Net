/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DB;

import Entity.Product;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Thinkpad
 */
public class Nhat_ProductDBContextTest {
    
    public Nhat_ProductDBContextTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of listAllIdAndTitleOfProduct method, of class Nhat_ProductDBContext.
     */
    @Test
    public void testListAllIdAndTitleOfProduct() {
        System.out.println("listAllIdAndTitleOfProduct");
        Nhat_ProductDBContext instance = new Nhat_ProductDBContext();
        ArrayList<Product> result = instance.listAllIdAndTitleOfProduct();
        assertTrue(result.size()>=29);
    }

    /**
     * Test of getIdAndTitleAndPriceAndImgOfProduct method, of class Nhat_ProductDBContext.
     */
    @Test
    public void testGetIdAndTitleAndPriceAndImgOfProduct() {
        System.out.println("getIdAndTitleAndPriceAndImgOfProduct");
        int productID = 2;
        Nhat_ProductDBContext instance = new Nhat_ProductDBContext();
        Product expResult = null;
        Product result = instance.getIdAndTitleAndPriceAndImgOfProduct(productID);
        assertTrue(result.getTitle().equals("Vans Unisex UA Authentic Trainers"));
    }
    
}
