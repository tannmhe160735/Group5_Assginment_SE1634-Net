/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DB;

import Entity.Feedback;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Thinkpad
 */
public class Nhat_FeedbackDBContextTest {
    
    public Nhat_FeedbackDBContextTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of listAllFeedbackStarAndContentByProductID method, of class Nhat_FeedbackDBContext.
     */
    @Test
    public void testListAllFeedbackStarAndContentByProductID() {
        System.out.println("listAllFeedbackStarAndContentByProductID");
        int productID = 2;
        Nhat_FeedbackDBContext instance = new Nhat_FeedbackDBContext();
        
        ArrayList<Feedback> result = instance.listAllFeedbackStarAndContentByProductID(productID);
        assertEquals(3, result.get(0).getFeedbackID());
        assertEquals(2, result.get(1).getFeedbackID());
        assertEquals(1, result.get(2).getFeedbackID());
    }
    
}
