/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.AccountDAO;
import Entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author minht
 */
public class ActionAccountController extends HttpServlet {
   
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
            out.println("<title>Servlet ActionAccountController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActionAccountController at " + request.getContextPath () + "</h1>");
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
        String action = request.getParameter("action");
        if(action.equals("edit")){
            AccountDAO dao = new AccountDAO();
            ArrayList<Account> roles = dao.ListRoleId();
            ArrayList<Account> accounts = dao.list();
            request.setAttribute("roles", roles);
            request.setAttribute("accounts", accounts);
            request.setAttribute("action", "edit");
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
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
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        if(action.equals("delete")){  
            int id = Integer.parseInt(request.getParameter("id"));  
            dao.DeleteAccountById(id);
            ArrayList<Account> accounts = dao.list();
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
        if(action.equals("promote")){
            String[] indexs = request.getParameterValues("index");
            for (String index : indexs) {
                String acc_id = request.getParameter("acc_id"+index);
                String role = request.getParameter("role"+index);
                dao.UpdateRoleAccountById(acc_id, role);
            }
            ArrayList<Account> accounts = dao.list();
            request.setAttribute("accounts", accounts);
            request.setAttribute("action", null);
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
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
