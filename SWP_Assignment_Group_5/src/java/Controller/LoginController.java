/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CartDAO;
import Entity.Account;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        AccountDAO accDao = new AccountDAO();
        Account acc = accDao.getAccountByLogin(email, pass);
        request.setAttribute("account", acc);
        HttpSession session = request.getSession();
        session.setAttribute("acc", acc);

        if (acc == null) {
            request.setAttribute("msg", "Invalid email or password ! ");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {

            session.setAttribute("acc_id", acc.getAcc_id());
            CartDAO cartDao = new CartDAO();
            int cartSize = cartDao.getCartSizeByUserId(acc.getAcc_id());
            session.setAttribute("cartSize", cartSize);
        }
        if (pass.equals("abc@123a")) {
            request.setAttribute("email", email);
            RequestDispatcher rd = request.getRequestDispatcher("new_password.jsp");
            rd.forward(request, response);
        }
        if (acc.getRole_id() == 3) {
            RequestDispatcher rd = request.getRequestDispatcher("home");
            rd.forward(request, response);
        }
        if (acc.getRole_id() == 2) {
            RequestDispatcher rd = request.getRequestDispatcher("staff.jsp");
            rd.forward(request, response);
        }
        if (acc.getRole_id() == 1) {
            RequestDispatcher rd = request.getRequestDispatcher("home");
            rd.forward(request, response);
        }
        if (acc.getRole_id() == 0) {
            request.setAttribute("msg", "You have been BANNED from server please contact us to retrieve  your account ");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
