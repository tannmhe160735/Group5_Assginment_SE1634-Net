/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Test.Tan;

import DAO.ProductDAO;
import Entity.Product;
import java.sql.Date;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author minht
 */
public class ProductDAOTest {
    
    public ProductDAOTest() {
    }
    
    @Test
    public void getProductByIdTest1(){
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(16);
        Date date;
        date = Date.valueOf("2022-10-26");
        Product expected_result = new Product(16, "Classisc Slip-on", 999,0, 150, "Laceration without foreign body of right index finger with damage to nail, initial encounter",
                "https://images.vans.com/is/image/Vans/VN0A5JMHB0G-ALT1?hei=392&wid=390&qlt=85", 3, date);
        assertEquals(expected_result.getProduct_id(), product.getProduct_id());
        assertEquals(expected_result.getTitle(), product.getTitle());
        assertEquals(expected_result.getSale_price(),product.getSale_price() , 150);
        assertEquals(expected_result.getPrice(),product.getPrice() , 999);
        assertEquals(expected_result.getQuantity(), product.getQuantity());
        assertEquals(expected_result.getDescription(), product.getDescription());
        assertEquals(expected_result.getImg(), product.getImg());
        assertEquals(expected_result.getCategory_id(), product.getCategory_id());
        assertEquals(expected_result.getCreate_date(), product.getCreate_date());
    }
    
    @Test
    public void getProductByIdTest2(){
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(17);
        Date date;
        date = Date.valueOf("2022-09-30");
        assertEquals(17, product.getProduct_id());
        assertEquals("Retro Floral Classic Slip-on", product.getTitle());
        assertEquals(0,product.getSale_price() , 0);
        assertEquals(75.5,product.getPrice() , 75.5);
        assertEquals(18, product.getQuantity());
        assertEquals("Salter-Harris Type I physeal fracture of unspecified calcaneus, sequela", product.getDescription());
        assertEquals("https://images.vans.com/is/image/Vans/VN0A5JMHB0G-ALT1?hei=392&wid=390&qlt=85", product.getImg());
        assertEquals(3, product.getCategory_id());
        assertEquals(date, product.getCreate_date());
    }
    
    @Test
    public void getProductByIdTest3(){
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(34);
        Date date;
        date = Date.valueOf("2022-09-30");
        assertEquals(34, product.getProduct_id());
        assertEquals("Vans Vault OG Style 36 LX Old Gold", product.getTitle());
        assertEquals(0.0,product.getSale_price() , 0.0);
        assertEquals(72.5,product.getPrice() , 72.5);
        assertEquals(6, product.getQuantity());
        assertEquals("Unspecified speech disturbances", product.getDescription());
        assertEquals("https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/cab0be68-2022-4403-bf71-0933c50fed22.jpg?v=1637165199000", product.getImg());
        assertEquals(5, product.getCategory_id());
        assertEquals(date, product.getCreate_date());
    }
   
    @Test
    public void EditProductTest() {
        ProductDAO dao = new ProductDAO();
        dao.EditProduct(30, "test", "70.5", "0", "20", "test", "https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/cab0be68-2022-4403-bf71-0933c50fed22.jpg?v=1637165199000", "3", "2022-09-30");
        Product product = dao.getProductById(30);
        Date date = Date.valueOf("2022-09-30");
        assertEquals(30, product.getProduct_id());
        assertEquals("test", product.getTitle());
        assertEquals(0.0,product.getSale_price() , 0.0);
        assertEquals(70.5,product.getPrice() , 72.5);
        assertEquals(20, product.getQuantity());
        assertEquals("test", product.getDescription());
        assertEquals("https://bizweb.dktcdn.net/thumb/medium/100/422/387/products/cab0be68-2022-4403-bf71-0933c50fed22.jpg?v=1637165199000", product.getImg());
        assertEquals(3, product.getCategory_id());
        assertEquals(date, product.getCreate_date());       
    }
    
    @Test
    public void DeleteProductTest(){
        ProductDAO dao = new ProductDAO();   
        boolean check;
        dao.DeleteProductById(39);
        Product product = dao.getProductById(41);
        if(product == null){
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);       
    }
    
    @Test
    public void getAllProductsTest(){
        ProductDAO dao = new ProductDAO();   
        List<Product> products = dao.getAllProducts();
        int count = 0;
        boolean check;
        for (Product product : products) {
            count++;
        }
        if(count == 35) {
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);  
    }
    
    @Test
    public void getAllProductByTitleTest() {
        ProductDAO dao = new ProductDAO();   
        List<Product> products = dao.getAllProductByTitle("a");
        int count = 0;
        boolean check;
        for (Product product : products) {
            count++;
        }
        if(count == 27) {
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);  
    }

    @Test
    public void testGetProductsByCategoryId(){
        ProductDAO dao = new ProductDAO();
        List<Product> pro = dao.getProductsByCategoryId(5);
        int count = 0;
        boolean check;
        for (Product product : pro) {
                count++;
        }
        if(count == 13) {
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);  
    }
    
    @Test
    public void testGetProductsById(){ 
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(16);
        Date date;
        date = Date.valueOf("2022-10-26");
        Product expected_result = new Product(16, "Classisc Slip-on", 999,0, 150, "Laceration without foreign body of right index finger with damage to nail, initial encounter",
                "https://images.vans.com/is/image/Vans/VN0A5JMHB0G-ALT1?hei=392&wid=390&qlt=85", 3, date);
        assertEquals(expected_result.getProduct_id(), product.getProduct_id());
        assertEquals(expected_result.getTitle(), product.getTitle());
        assertEquals(expected_result.getSale_price(),product.getSale_price() , 150);
        assertEquals(expected_result.getPrice(),product.getPrice() , 999);
        assertEquals(expected_result.getQuantity(), product.getQuantity());
        assertEquals(expected_result.getDescription(), product.getDescription());
        assertEquals(expected_result.getImg(), product.getImg());
        assertEquals(expected_result.getCategory_id(), product.getCategory_id());
        assertEquals(expected_result.getCreate_date(), product.getCreate_date());
    }
    
}
