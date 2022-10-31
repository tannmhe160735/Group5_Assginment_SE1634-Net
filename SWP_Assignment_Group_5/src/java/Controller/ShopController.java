/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

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

        List<Category> listCategories = new CategoryDAO().getAllCategories();
        ProductDAO dao = new ProductDAO();
        String typePage = request.getParameter("typePage");
        List<Product> listProducts = new ArrayList<>();
        if (typePage.equals("all")) {
            listProducts = dao.getAllProducts();
           
        } else if (typePage.equals("category")) {
            listProducts = dao.getProductsByCategoryId(Integer.parseInt(request.getParameter("cond")));
        }
        request.setAttribute("typePage", typePage);
        request.setAttribute("cond", request.getParameter("cond"));
        HttpSession session = request.getSession();
        int page = Integer.parseInt(request.getParameter("page"));
        int totalPage = listProducts.size() / 6;
        if(listProducts.size() % 6!=0){
            totalPage +=1;
        }
        int start = (page - 1) * 6;
        int end = start + 6;
        if(end>listProducts.size()){
            end = listProducts.size();
        } 
        if (page == 1) {
            request.setAttribute("condPrev", "disabled");
        }
        if (page == totalPage) {
            request.setAttribute("condNext", "disabled");
        }
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("page", page);
        request.setAttribute("listProducts", listProducts.subList(start, end));
        request.setAttribute("listCategories", listCategories);
        String url = "shop?typePage="+request.getAttribute("typePage")+"&&page="+request.getAttribute("page")+"&&cond="+request.getAttribute("cond")+"";
        request.getSession().setAttribute("urlHistory", url);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

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
