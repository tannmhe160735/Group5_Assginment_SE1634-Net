/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CartDAO;
import DAO.VoucherDAO;
import Entity.Account;
import Entity.Cart;
import Entity.Product_size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CartController", urlPatterns = {"/carts"})
public class CartController extends HttpServlet {

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
            HttpSession session = request.getSession();
            CartDAO dao = new CartDAO();
            int acc_id = (int) session.getAttribute("acc_id");
            try {
                if (acc_id != 0) {
                    List<Cart> carts = dao.GetCartByUser(acc_id);
                    float totalMoney = 0;
                    for (Cart item : carts) {
                        totalMoney += item.getQuantity() * item.getProduct().getPrice();
                    }
                    String voucher_code = request.getParameter("voucher_code");
                    VoucherDAO vch = new VoucherDAO();
                    float discountpercent = vch.getDiscountPercentById(voucher_code);
                    Float paymentMoney = (float) (totalMoney - totalMoney * discountpercent);
                    String voucher_msg = " ";
                    if (voucher_code != null) {
                        if (discountpercent == 0) {
                            voucher_msg = "Voucher is not exist or expired !";
                        } else {
                            voucher_msg = "Discount: " + String.format("%.02f", discountpercent * 100) + "%";
                        }
                    }
                    request.setAttribute("voucher", voucher_code);                    
                    request.setAttribute("voucher_msg", voucher_msg);
                    request.setAttribute("paymentMoney", paymentMoney);
                    request.setAttribute("totalMoney", totalMoney);
                    request.setAttribute("carts", carts);
                    request.getRequestDispatcher("carts.jsp").forward(request, response);
                }
                else{
                    response.sendRedirect("login.jsp");
                }

            } catch (Exception e) {
                response.sendRedirect("login.jsp");
            }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
