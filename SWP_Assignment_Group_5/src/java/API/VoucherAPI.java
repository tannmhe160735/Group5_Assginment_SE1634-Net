/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package API;

import DAO.VoucherDAO;
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
import java.io.Reader;
import java.time.LocalDate;
import java.util.List;
import lombok.var;

/**
 *
 * @author Admin
 */
@WebServlet(name = "VoucherAPI", urlPatterns = {"/api-voucher"})
public class VoucherAPI extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("TestGet");
            List<Voucher> list = dao.GetAllVoucher();
            for (Voucher voucher : list) {
                out.println(voucher.toString());
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        List<Voucher> listVoucher = HttpUtil.of(request.getReader()).toModel(Voucher.class); 
        LocalDate dateObj = LocalDate.now();
        try ( PrintWriter out = response.getWriter()){
            /* TODO output your page here. You may use following sample code. */
            out.println("TestPost");
            for (Voucher voucher : listVoucher) {
                 if(dao.CheckVoucherCode(voucher.getVoucher_code())){
                 out.println("Voucher code: " + voucher.getVoucher_code() + " existed");
            }else{
              dao.AddNewVoucher(voucher.getVoucher_code(), dateObj.toString(), voucher.getVoucher_experience(), voucher.getVoucher_discount());
              out.println(voucher.toString());
            }
            }
            
           
        }
        
   
        
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("TestPut");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         VoucherDAO dao = new VoucherDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String voucher_code = request.getParameter("voucher_code");
        LocalDate dateObj = LocalDate.now();
        try ( PrintWriter out = response.getWriter()){
            /* TODO output your page here. You may use following sample code. */
            out.println("TestDelete");
             
           if(!dao.CheckVoucherCode(voucher_code)){
               out.println("Voucher code doesn't existed");
           }else{
               dao.DeleteVoucher(voucher_code);  
               out.println("Deleted"+voucher_code);
           }
            
           
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
