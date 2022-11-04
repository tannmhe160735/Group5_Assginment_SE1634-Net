/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Test.Tan;

import DAO.AccountDAO;
import Entity.Account;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author minht
 */
public class AccountDAOTest {

    public AccountDAOTest() {
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
    @Test
    public void getAccountByLoginTest1() {
        AccountDAO dao = new AccountDAO();
        Account acc = dao.getAccountByLogin("admin@gmail.com", "admin");
        assertEquals(14, acc.getAcc_id());
        assertEquals("admin", acc.getAcc_name());
        assertEquals("admin@gmail.com", acc.getEmail());
        assertEquals("admin", acc.getPassword());
        assertEquals(true, acc.isGender());
        assertEquals(855246269, acc.getPhone());
        assertEquals("Ha Noi, Viet Nam", acc.getAddress());
        assertEquals(1, acc.getRole_id());
        assertEquals(null, acc.getAvatar());
    }

    @Test
    public void getAccountByLoginTest2() {
        AccountDAO dao = new AccountDAO();
        Account acc = dao.getAccountByLogin("tannmhe160735@fpt.edu.vn", "12345678a");
        assertEquals(25, acc.getAcc_id());
        assertEquals("Nguyễn Minh Tân", acc.getAcc_name());
        assertEquals("tannmhe160735@fpt.edu.vn", acc.getEmail());
        assertEquals("12345678a", acc.getPassword());
        assertEquals(false, acc.isGender());
        assertEquals(855246269, acc.getPhone());
        assertEquals("Ha Noi, Viet Nam", acc.getAddress());
        assertEquals(3, acc.getRole_id());
        assertEquals("img\\1234491.png", acc.getAvatar());
    }
    
    @Test
    public void DeleteProductTest(){
        AccountDAO dao = new AccountDAO();
        boolean check;
        dao.DeleteAccountById(32);
        Account product = dao.getAccountById(32);
        if(product == null){
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);       
    }
    
    @Test
    public void UpdateRoleAccountByIdTest(){
        AccountDAO dao = new AccountDAO();
        boolean check;
        dao.UpdateRoleAccountById("31", "0");
        Account product = dao.getAccountById(31);
        if(product.getRole_id() == 0){
            check = true;
        }else{
            check = false;
        }
        assertEquals(check, true);       
    }
    
    @Test
    public void RegisterNewAccountTest() {
        AccountDAO dao = new AccountDAO();
        boolean check;
        dao.RegisterNewAccount("abcd@gmail.com", "abc", "abc");
        Account acc = dao.getAccountByEmail("abcd@gmail.com");
        if(acc != null){
            check = true;
        }else {
            check = false;
        }
        assertEquals(check, true);
    }
    
    @Test 
    public void ChangePassAccountByIdTest(){
        AccountDAO dao = new AccountDAO();
        boolean check;
        dao.ChangePassAccountById(21, "654321");
        Account acc = dao.getAccountById(21);
        if(acc.getPassword().equals("654321")){
            check = true;
        }else {
            check = false;
        }
        assertEquals(check, true);
    }
    
}
