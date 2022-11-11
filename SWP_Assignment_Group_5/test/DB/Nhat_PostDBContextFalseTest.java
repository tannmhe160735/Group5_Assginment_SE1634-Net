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
public class Nhat_PostDBContextFalseTest {
    
    public Nhat_PostDBContextFalseTest() {
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
    public void testFalseGetAPostByID() {
        System.out.println("getAPostByID");
        int post_id = 10;
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        Post expResult = new Post(3,28, "test title", "test content 1", "test content 2", "adu/vi.img", new Date(2001 -1900, 10-1, 07));
        Post result = instance.getAPostByID(post_id);
        assertNotEquals(expResult.getId(), result.getId());
        assertNotEquals(expResult.getProduct_id(), result.getProduct_id());
        assertNotEquals(expResult.getPost_title(), result.getPost_title());
        assertNotEquals(expResult.getPost_date(), result.getPost_date());
        assertNotEquals(expResult.getImage_path(), result.getImage_path());
        assertNotEquals(expResult.getContent1(), result.getContent1());
        assertNotEquals(expResult.getContent2(), result.getContent2());
        // TODO review the generated test code and remove the default call to fail.
        
    }


    /**
     * Test of listAllPostPaginaged method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseListAllPostPaginaged() {
        System.out.println("listAllPostPaginaged");
        int noPage = 2;
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        ArrayList<Post> result = instance.listAllPostPaginaged(noPage);
        assertFalse(4== result.size());
    }

    /**
     * Test of getTotalNumberOfPost method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseGetTotalNumberOfPost() {
        System.out.println("getTotalNumberOfPost");
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        int expResult = 0;
        int result = instance.getTotalNumberOfPost();
        assertFalse(result<25);
    }

    /**
     * Test of addThisPost method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseAddThisPost() {
        System.out.println("addThisPost");
        Post thisPost = new Post();
        thisPost.setId(-1);
        thisPost.setPost_title("test");
        thisPost.setContent1("content1");
        thisPost.setContent2("content2");
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
       assertTrue(instance.addThisPost(thisPost));
        
    }

    /**
     * Test of editThisPostExceptIMGpath method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseEditThisPostExceptIMGpath() {
        System.out.println("editThisPostExceptIMGpath");
        Post thisPost = new Post(57, 2, "ddd", "ddd", "sss","adu/vi.imgggg", new Date(2001 -1900, 10-1, 07));
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        instance.editThisPostExceptIMGpath(thisPost);
        Post outPost = instance.getAPostByID(57);
        assertFalse(("adu/vi.imgggg").equals(outPost.getPost_title()));
    }

    /**
     * Test of editThisPost method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseEditThisPost() {
        System.out.println("editThisPost");
        Post thisPost = new Post(57, 2, "ddd", "ddd", "sss","adu/vi.img", new Date(2001 -1900, 10-1, 07));
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        instance.editThisPost(thisPost);
        Post outPost = instance.getAPostByID(57);
        assertTrue(("ddd").equals(outPost.getPost_title()));
    }

    /**
     * Test of hidePost method, of class Nhat_PostDBContext.
     */
    @Test
    public void testFalseHidePost() {
        System.out.println("hidePost");
        Post thisPost = new Post(57, 2, "ddd", "ddd", "sss","adu/vi.img", new Date(2001 -1900, 10-1, 07));
        Nhat_PostDBContext instance = new Nhat_PostDBContext();
        instance.hidePost(thisPost);
        Post outPost = instance.getAPostByID(57);
        assertTrue(("[HIDDEN]ddd").equals(outPost.getPost_title()));
    }
    
}
