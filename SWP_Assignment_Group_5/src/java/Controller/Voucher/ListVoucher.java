/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Voucher;

import DAO.VoucherDAO;
import Entity.Voucher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListVoucher", urlPatterns = {"/listVoucher"})
public class ListVoucher extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            VoucherDAO dao = new VoucherDAO();
            List<Voucher> voucher = dao.GetAllVoucher();
            HttpSession session = request.getSession();
            int page = Integer.parseInt(request.getParameter("page"));
            int start = (page - 1) * 5;
            int end = start + 5;
            int totalPage = (int) voucher.size() / 5;
            if (page == 1) {
                request.setAttribute("condPrev", "disabled");
            }
            if (page == totalPage) {
                request.setAttribute("condNext", "disabled");
            }

            request.setAttribute("page", page);
            request.setAttribute("listVoucher", voucher.subList(start, end));
            RequestDispatcher rd = request.getRequestDispatcher("voucher.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
