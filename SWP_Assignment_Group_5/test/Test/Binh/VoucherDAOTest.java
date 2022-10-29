/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Test.Binh;

import DAO.AccountDAO;
import DAO.VoucherDAO;
import Entity.Account;
import Entity.Voucher;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class VoucherDAOTest {
    
    public VoucherDAOTest() {
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
        Account acc = dao.getAccountByLogin("staff@gmail.com", "staff");
        assertEquals(15, acc.getAcc_id());
        assertEquals("staff", acc.getAcc_name());
        assertEquals("staff@gmail.com", acc.getEmail());
        assertEquals("staff", acc.getPassword());
        assertEquals(false, acc.isGender());
        assertEquals(912781481, acc.getPhone());
        assertEquals("Hoa Lac, Ha Noi", acc.getAddress());
        assertEquals(2, acc.getRole_id());
        assertEquals(null, acc.getAvatar());
    }
    
    @Test
    public void CheckVoucherCodeTest(){
        VoucherDAO dao = new VoucherDAO();
        List rs = new ArrayList<>();
        rs.add(dao.CheckVoucherCode("TESTEDIT"));
        rs.add(dao.CheckVoucherCode("TESTLAN2"));
        rs.add(dao.CheckVoucherCode("TESTEDIT45"));
        for (Object r : rs) {
            assertEquals(true, r);
        }
    }
  
     @Test
    public void AddVoucherCodeTest(){
        VoucherDAO dao = new VoucherDAO();
        SimpleDateFormat DateFor = new SimpleDateFormat("MM-dd-yyyy");
        LocalDate dateObj = LocalDate.now();
        boolean rs_after = dao.CheckVoucherCode("TESTADD");
        if(rs_after){
             assertEquals(true, rs_after);
        }else{
        dao.AddNewVoucher("TESTADD", dateObj.toString(), "11-30-2022", 30);
        }
         boolean rs_before = dao.CheckVoucherCode("TESTADD");
         assertEquals(true, rs_before);
    }
    
       @Test
    public void EditVoucherCodeTest() {
        VoucherDAO dao = new VoucherDAO();
        SimpleDateFormat DateFor = new SimpleDateFormat("MM-dd-yyyy");
        LocalDate dateObj = LocalDate.now();
        boolean rs_after = dao.CheckVoucherCode("TESTADD");
        if (!rs_after) {
            assertEquals(false, rs_after);
        } else {
            dao.EditVoucher("TESTADD", "TESTADD_2", "12-30-2022", 15);
        }
        boolean rs_before = dao.CheckVoucherCode("TESTADD_2");
        assertEquals(true, rs_before);
    }
    
      @Test
    public void DeleteVoucherCodeTest(){
        VoucherDAO dao = new VoucherDAO();
        SimpleDateFormat DateFor = new SimpleDateFormat("MM-dd-yyyy");
        LocalDate dateObj = LocalDate.now();
        boolean rs_after = dao.CheckVoucherCode("SaleMatTay");
        if(!rs_after){
             assertEquals(false, rs_after);
        }else
        {
            dao.DeleteVoucher("SaleMatTay");
        }
         boolean rs_before = dao.CheckVoucherCode("SaleMatTay");
         assertEquals(false, rs_before);
    }
    
    @Test
    public void ListVoucherCodeTest(){
         VoucherDAO dao = new VoucherDAO();
         assertEquals(16, dao.GetAllVoucher().size()); 
    }
    
    
}
