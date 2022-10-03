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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditVoucher", urlPatterns = {"/editVoucher"})
public class EditVoucher extends HttpServlet {

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
            out.println("<title>Servlet EditVoucher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditVoucher at " + request.getContextPath() + "</h1>");
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
        Voucher item = new Voucher();
        VoucherDAO dao = new VoucherDAO();
        List<Voucher> voucher = dao.GetAllVoucher();
        for (Voucher vc : voucher) {
            System.out.println(vc.getVoucher_code());
            if (vc.getVoucher_code().equals(request.getParameter("code"))) {
                item = vc;
            }
        }
        request.setAttribute("voucher", item);
        RequestDispatcher rd = request.getRequestDispatcher("editVoucher.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Voucher item = new Voucher();
        VoucherDAO dao = new VoucherDAO();
        List<Voucher> voucher = dao.GetAllVoucher();
        for (Voucher vc : voucher) {
            System.out.println(vc.getVoucher_code());
            if (vc.getVoucher_code().equals(request.getParameter("code"))) {
                item = vc;
            }
        }
        PrintWriter out = response.getWriter();
        out.println(item.getVoucher_code());
        out.println(request.getParameter("new_code"));
        out.println(item.getVoucher_create());
        out.println(request.getParameter("date"));
        out.println(request.getParameter("discount"));
        String code = request.getParameter("new_code");
        dao.EditVoucher(item.getVoucher_code(), request.getParameter("new_code"), item.getVoucher_create(), request.getParameter("date"), Double.parseDouble(request.getParameter("discount")));
        request.setAttribute("msg", "Edit voucher code success");
        RequestDispatcher rd = request.getRequestDispatcher("listVoucher");
        rd.forward(request, response);

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
