/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.VoucherDAO;
import Entity.Account;
import Entity.Cart;
import Entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    float price = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            CartDAO dao = new CartDAO();
            int acc_id = (int) session.getAttribute("acc_id");
            List<Cart> carts = dao.GetCartByUser(acc_id);
            float totalMoney = 0;
            for (Cart item : carts) {
                totalMoney += item.getQuantity() * item.getProduct().getPrice();
            }
            String voucher_code = request.getParameter("voucher");
            VoucherDAO vch = new VoucherDAO();
            float discountpercent = vch.getDiscountPercentById(voucher_code);
            Float paymentMoney = (float) (totalMoney - totalMoney * discountpercent);
            price = paymentMoney;
            String voucher_msg = " ";
            if (voucher_code != null) {
                if (discountpercent == 0) {
                    voucher_msg = "No voucher yet !!!";
                } else {
                    voucher_msg = "Discount: " + String.format("%.02f", discountpercent * 100) + "%";
                }
            }
            request.setAttribute("voucher", voucher_code);
            request.setAttribute("voucher_msg", voucher_msg);
            request.setAttribute("paymentMoney", paymentMoney);
            request.setAttribute("totalMoney", totalMoney);
            request.setAttribute("carts", carts);
            
            
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

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
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String name = firstName + " " + lastName;
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        float totalPrice = price;
//        try {
//            totalPrice = Float.parseFloat(request.getParameter("paymentMoney"));
//        } catch (NumberFormatException e) {
//        }
        String paymentMethod = request.getParameter("paymentMethod");

        LocalDateTime now = LocalDateTime.now();
        Date date = Date.valueOf(now.toLocalDate());

        Order order = Order.builder()
                .name(name)
                .address(address)
                .phone(phone)
                .email(email)
                .payment(paymentMethod)
                .status(1)
                .date_created(date)
                .totalPrice(totalPrice)
                .build();
        OrderDAO orderdao = new OrderDAO();
        orderdao.savecart(order);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int acc_id = acc.getAcc_id();
        CartDAO cartdao = new CartDAO();
        cartdao.clearCart(acc_id);
        session.removeAttribute("cartSize");
        request.getRequestDispatcher("thanks.jsp").forward(request, response);

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
