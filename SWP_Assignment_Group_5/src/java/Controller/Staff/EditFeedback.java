/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Staff;

import DB.Nhat_AccountDBContext;
import DB.Nhat_FeedbackDBContext;
import DB.Nhat_ProductDBContext;
import Entity.Account;
import Entity.Feedback;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinkpad
 */
public class EditFeedback extends HttpServlet {

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
            out.println("<title>Servlet EditFeedback</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFeedback at " + request.getContextPath() + "</h1>");
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
        int feedbackID = Integer.parseInt(request.getParameter("feed_id"));
        //lay thong tin product
        Nhat_ProductDBContext npdbc = new Nhat_ProductDBContext();
        Product p = npdbc.getIdAndTitleAndPriceAndImgOfProductByFeedbackId(feedbackID);
        //lay thong tin user
        Nhat_AccountDBContext nadbc = new Nhat_AccountDBContext();
        Account acc = nadbc.getAccountByFeedbackID(feedbackID);
        //lay thong tin feed back
        Nhat_FeedbackDBContext nfdbc = new Nhat_FeedbackDBContext();
        Feedback fb = nfdbc.getFeedbackByID(feedbackID);
        //lay star cua product
        double star = npdbc.getSumOfStarsOfProductByFeedbackId(feedbackID);
        //cho vao request
        request.setAttribute("star", star);
        request.setAttribute("thisAccount", acc);
        request.setAttribute("thisProduct", p);
        request.setAttribute("thisFeedback", fb);
        request.getRequestDispatcher("view/editFeedBack.jsp").forward(request, response);
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
        int feedbackID = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("comment");
        Nhat_FeedbackDBContext nfdb = new Nhat_FeedbackDBContext();
        nfdb.editFeedback(feedbackID,content);
        
        ListOfFeedbackOnEachProduct controller1 = new ListOfFeedbackOnEachProduct();
        controller1.doGet(request, response);
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