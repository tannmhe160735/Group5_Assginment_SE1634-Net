/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Voucher;

import DAO.VoucherDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddVoucher", urlPatterns = {"/addVoucher"})
public class AddVoucher extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        SimpleDateFormat DateFor = new SimpleDateFormat("MM-dd-yyyy");
        LocalDate dateObj = LocalDate.now();
        String code = request.getParameter("code");
        String experience = request.getParameter("date");
        String discount = request.getParameter("discount");
        if(dao.CheckVoucherCode(code)){
            request.setAttribute("msg", "This voucher code already existed");
        }else{
             dao.AdNewVoucher(code, dateObj.toString(), experience, Double.parseDouble(discount));
             request.setAttribute("msg", "Add new voucher code success");
             
        }
        RequestDispatcher rd = request.getRequestDispatcher("addVoucher.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
