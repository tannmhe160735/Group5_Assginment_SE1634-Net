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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author minht
 */
public class ForgotPasswordController extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("forgot_pass.jsp").forward(request, response);
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
        final String username = "hotronguoidungtuystore@gmail.com";
        final String password = "qwuhsdcjvmuwhizb";
        AccountDAO dao = new AccountDAO();
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        String fullname = request.getParameter("name");
        String email = request.getParameter("email");
        Account acc = dao.getAccountByEmail(email);
        if (fullname.equals(acc.getAcc_name())) {
            dao.ChangePassAccountById(acc.getAcc_id(), "abc@123a");
            String emailSubject = "Restore password Tuy Store";
            String emailContent = "Dear"+ acc.getAcc_name() + "\nYour new password is: abc@123a\n\n Tuy Store";
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipient(
                        Message.RecipientType.TO,
                        new InternetAddress(email)
                );
                message.setSubject(emailSubject);
                message.setText(emailContent);
                Transport.send(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("msg", "Hãy kiểm tra email của bạn");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            request.setAttribute("msg", "Tên trong tài khoản không giống tên đã nhập hãy nhập lại");
            request.getRequestDispatcher("forgot_pass.jsp").forward(request, response);
        }
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
