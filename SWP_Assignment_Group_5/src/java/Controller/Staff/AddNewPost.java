/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Staff;

import DB.Nhat_PostDBContext;
import DB.Nhat_ProductDBContext;
import Entity.Post;
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
public class AddNewPost extends HttpServlet {

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
            out.println("<title>Servlet AddNewPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewPost at " + request.getContextPath() + "</h1>");
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
        Nhat_ProductDBContext npdbc = new Nhat_ProductDBContext();
        request.setAttribute("listAllIdAndTitleOfProduct", npdbc.listAllIdAndTitleOfProduct());
        request.getRequestDispatcher("view/addNewPost.jsp").forward(request, response);
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
        //get path of new img
        ClassLoader loader = AddNewPost.class.getClassLoader();
        String pathOfProject = loader.getResource("Controller/Staff/AddNewPost.class").toString();
                           //  file:/D:/SWP391/Group5_Assginment_SE1634-Net/SWP_Assignment_Group_5/build/web/WEB-INF/classes/Controller/Staff/AddNewPost.class
        String[] splittedPathOfProject = pathOfProject.split("/");
        StringBuilder path = new StringBuilder();
        int lengthOfSplittedPathOfProject = splittedPathOfProject.length;
        for(int i=1;i<lengthOfSplittedPathOfProject;i++){
            if(splittedPathOfProject[i].equals("build") 
                    && splittedPathOfProject[i+1].equals("web")
                    && splittedPathOfProject[i+2].equals("WEB-INF")
                    && splittedPathOfProject[i+3].equals("classes")
                    && splittedPathOfProject[i+4].equals("Controller")){
                break;
            }
            path.append(splittedPathOfProject[i]);
            path.append("\\");
        }
        path.append("web\\assets\\img\\img_for_posts\\");
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        path.append(fileName);
        //save img file to "path"
        Part[] parts = request.getParts().toArray(new Part[5]);
        parts[1].write(path.toString());
        //create img path to save in DB
        String pathOfIMGofThisPost = "assets/img/img_for_posts/"+fileName;
        //take title and content1 and content2 and productID of this Post
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
        int productID = Integer.parseInt(request.getParameter("productID"));
        Date today = Date.valueOf(LocalDate.now());
        String title = request.getParameter("title");
        //then enough attributes to create this object Post
        Post thisPostMustAddToDB = new Post(-1,productID,title,content1,content2,pathOfIMGofThisPost,today);
        Nhat_PostDBContext nbpdbc= new Nhat_PostDBContext();
        nbpdbc.addThisPost(thisPostMustAddToDB);
        
        //tra ve list of post
        ListOfPostPaginaged lop = new ListOfPostPaginaged();
        lop.doGet(request, response);
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

}
