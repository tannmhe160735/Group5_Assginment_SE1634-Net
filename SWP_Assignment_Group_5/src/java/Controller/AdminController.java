/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.AdminDAO;
import Entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author minht
 */
public class AdminController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        float tong;
        float revenue1 = dao.GetOrderByMonth1();
        request.setAttribute("revenue1", revenue1);
        float revenue2 = dao.GetOrderByMonth2();
        request.setAttribute("revenue2", revenue2);
        float revenue3 = dao.GetOrderByMonth3();
        request.setAttribute("revenue3", revenue3);
        float revenue4 = dao.GetOrderByMonth4();
        request.setAttribute("revenue4", revenue4);
        float revenue5 = dao.GetOrderByMonth5();
        request.setAttribute("revenue5", revenue5);
        float revenue6 = dao.GetOrderByMonth6();
        request.setAttribute("revenue6", revenue6);
        float revenue7 = dao.GetOrderByMonth7();
        request.setAttribute("revenue7", revenue7);
        float revenue8 = dao.GetOrderByMonth8();
        request.setAttribute("revenue8", revenue8);
        float revenue9 = dao.GetOrderByMonth9();
        request.setAttribute("revenue9", revenue9);
        float revenue10 = dao.GetOrderByMonth10();
        request.setAttribute("revenue10", revenue10);
        float revenue11 = dao.GetOrderByMonth11();
        request.setAttribute("revenue11", revenue11);
        float revenue12 = dao.GetOrderByMonth12();
        tong =  revenue1 + revenue2 + revenue3 + revenue4 + revenue5 + revenue6 + revenue7 + revenue8 + revenue9 + revenue10 + revenue11 + revenue12;
        int count = dao.CountOrder();
        request.setAttribute("count", count);
        request.setAttribute("tong", tong);
        request.setAttribute("revenue12", revenue12);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
