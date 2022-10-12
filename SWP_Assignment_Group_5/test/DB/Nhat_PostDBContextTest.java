/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DB;

import Entity.Post;
import java.util.ArrayList;
import java.sql.Date;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Thinkpad
 */
public class Nhat_PostDBContextTest {
    
    public Nhat_PostDBContextTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of listAllPost method, of class Nhat_PostDBContext.
     */
//    @Test
//    public void testListAllPost() {
//        System.out.println("listAllPost");
//        Nhat_PostDBContext instance = new Nhat_PostDBContext();
//        ArrayList<Post> expResult = null;
//        ArrayList<Post> result = instance.listAllPost();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getAPostByID method, of class Nhat_PostDBContext.
     */
    @Test
    public void testGetAPostByID() {
        System.out.println("getAPostByID");
        int post_id = 3;
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        Post expResult = new Post(3, "test title", "test content 1", "test content 2", "adu/vi.img", new Date(2001 -1900, 10-1, 07));
        Post result = instance.getAPostByID(post_id);
        assertEquals(expResult.getId(), result.getId());
        assertEquals(expResult.getPost_title(), result.getPost_title());
        assertEquals(expResult.getPost_date(), result.getPost_date());
        assertEquals(expResult.getImage_path(), result.getImage_path());
        assertEquals(expResult.getContent1(), result.getContent1());
        assertEquals(expResult.getContent2(), result.getContent2());
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
}
