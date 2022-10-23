/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package API;

import DAO.OrderDAO;
import DAO.VoucherDAO;
import Entity.Order;
import Entity.OrderDetail;
import Entity.Voucher;
import Utils.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderAPI", urlPatterns = {"/api-order"})
public class OrderAPI extends HttpServlet {

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
            out.println("<title>Servlet OrderAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderAPI at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
       
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("TestGet");
            List<OrderDetail> list = dao.GetAllOrder();
            for (OrderDetail order : list) {
                out.println("OrderID: "+order.getOrd_id());
                out.println("UserID: "+order.getUser_id());
                out.println("Email: "+order.getEmail());
                out.println("Adress: "+order.getAddress());
                out.println("Phone: "+order.getPhone());
                out.println("Payment Method:"+order.getPayment());
                out.println("Order Status: "+order.isStatus());
                out.println("List Order Product: ");
                for (Order orderDetail : order.getListOrders()) {
                    out.println(orderDetail.getProd_id()+": "+orderDetail.getQuantity());
                }
                out.println("");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("Test Post");
        try {
            List<Order> listOrder = HttpUtil.of(request.getReader()).toModel(Order.class);
            for (Order order : listOrder) {
                out.println(order.toString());
            }

        } catch (Exception e) {
            out.println(e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
