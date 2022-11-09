/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Staff;

import DB.Nhat_PostDBContext;
import DB.Nhat_ProductDBContext;
import Entity.Post;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.Date;
import java.time.LocalDate;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
/**
 *
 * @author Thinkpad
 */
public class EditPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_post_id = (String) request.getParameter("postID");
        // verification
        int post_id = verificationPostID(raw_post_id);
        //get post from DBContext to send
        Nhat_PostDBContext pdbc = new Nhat_PostDBContext();
        Post thisPost = pdbc.getAPostByID(post_id);
        //get product to send
        Nhat_ProductDBContext npdbc = new Nhat_ProductDBContext();
        Product thisProduct = npdbc.getIdAndTitleAndPriceAndImgOfProduct(thisPost.getProduct_id());
        //return output list of product
        request.setAttribute("listAllIdAndTitleOfProduct", npdbc.listAllIdAndTitleOfProduct());
        System.out.println("listAllIdAndTitleOfProduct=" + npdbc.listAllIdAndTitleOfProduct().size());
        //return output a post
        if (thisPost != null) {
            request.setAttribute("thisPost", thisPost);
        }
        //return output a product
        if (thisPost != null && thisProduct != null) {
            request.setAttribute("thisProduct", thisProduct);
        }

        request.getRequestDispatcher("view/editPost.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathOfIMGofThisPost = "";
        boolean isEditIMG = false;
        if (((String) request.getParameter("isClickChooseIMG")).equals("yes")) {
            isEditIMG = true;
        }

        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        if (fileName == null || fileName.equals("")) {
            isEditIMG = false;
        }
        if (isEditIMG == true) {
            //get path of new img
            ClassLoader loader = AddNewPost.class.getClassLoader();
            String pathOfProject = loader.getResource("Controller/Staff/AddNewPost.class").toString();
            //  file:/D:/SWP391/Group5_Assginment_SE1634-Net/SWP_Assignment_Group_5/build/web/WEB-INF/classes/Controller/Staff/AddNewPost.class
            String[] splittedPathOfProject = pathOfProject.split("/");
            StringBuilder path = new StringBuilder();
            int lengthOfSplittedPathOfProject = splittedPathOfProject.length;
            for (int i = 1; i < lengthOfSplittedPathOfProject; i++) {
                if (splittedPathOfProject[i].equals("build")
                        && splittedPathOfProject[i + 1].equals("web")
                        && splittedPathOfProject[i + 2].equals("WEB-INF")
                        && splittedPathOfProject[i + 3].equals("classes")
                        && splittedPathOfProject[i + 4].equals("Controller")) {
                    break;
                }
                path.append(splittedPathOfProject[i]);
                path.append("\\");
            }
            path.append("web\\assets\\img\\img_for_posts\\");

            path.append(fileName);
            //save img file to "path"
            Part[] parts = request.getParts().toArray(new Part[5]);
            parts[3].write(path.toString());
            //create img path to save in DB
            pathOfIMGofThisPost = "assets/img/img_for_posts/" + fileName;
        }
        //take post_id, title and content1 and content2 and productID of this Post
        String raw_post_id = request.getParameter("postID");
        int post_id = verificationPostID(raw_post_id);
        String title = request.getParameter("title");
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
        int productID = Integer.parseInt(request.getParameter("productID"));
        Date today = Date.valueOf(LocalDate.now());
        //then enough attributes to create this object Post
        Post thisPostMustEdit = new Post(post_id, productID, title, content1, content2, pathOfIMGofThisPost, today);
        Nhat_PostDBContext nbpdbc = new Nhat_PostDBContext();
        if (isEditIMG == false) {
            System.out.println(thisPostMustEdit);
            nbpdbc.editThisPostExceptIMGpath(thisPostMustEdit);
            System.out.println("editThisPostExceptIMGpath");
        }else{
            System.out.println(thisPostMustEdit);
            nbpdbc.editThisPost(thisPostMustEdit);
            System.out.println("editThisPost");
        }
        ListOfPostPaginaged a = new ListOfPostPaginaged();
        a.doGet(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int verificationPostID(String raw_post_id) {
        return Integer.parseInt(raw_post_id);
    }
}
