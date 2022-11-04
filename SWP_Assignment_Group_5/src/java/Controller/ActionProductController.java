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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author minht
 */
public class ActionProductController extends HttpServlet {

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
            out.println("<title>Servlet DeleteProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProductController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProductById(pro_id);
            List<Category> listCategories = new CategoryDAO().getAllCategories();
            request.setAttribute("listCategories", listCategories);
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        }
        if (action.equals("add")) {
            List<Category> listCategories = new CategoryDAO().getAllCategories();
            request.setAttribute("listCategories", listCategories);
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
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
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            String title = request.getParameter("title");
            String price = request.getParameter("price");
            String sale_price = request.getParameter("sale_price");
            String quantity = request.getParameter("quantity");
            String description = request.getParameter("description");
            String img = request.getParameter("image");
            String category_id = request.getParameter("category");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String today = formatter.format(date);
            ProductDAO dao = new ProductDAO();
            dao.EditProduct(pro_id, title, price, sale_price, quantity, description, img, category_id, today);
            List<Product> listProducts = dao.getAllProducts();
            request.setAttribute("listProducts", listProducts);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        if (action.equals("delete")) {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            ProductDAO dao = new ProductDAO();
            dao.DeleteProductById(pro_id);
            List<Product> listProducts = dao.getAllProducts();
            request.setAttribute("listProducts", listProducts);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        if (action.equals("add")) {
            String title = request.getParameter("title");
            String price = request.getParameter("price");
            String sale_price = request.getParameter("sale_price");
            String quantity = request.getParameter("quantity");
            String description = request.getParameter("description");
            String img = request.getParameter("image");
            String category_id = request.getParameter("category");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String today = formatter.format(date);
            ProductDAO dao = new ProductDAO();
            List<Product> listProducts = dao.getAllProducts();
            List<Category> listCategories = new CategoryDAO().getAllCategories();
            if (title.trim().equals("") || title == null) {
                request.setAttribute("listCategories", listCategories);
                request.setAttribute("msg", "please fill title");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
                return;
            }
            if (price.trim().equals("") || price == null) {
                request.setAttribute("listCategories", listCategories);
                request.setAttribute("msg", "please fill price");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
                return;
            }
            if (!(title.trim().equals("") || title == null)) {
                    for (Product listProduct : listProducts) {
                        if (title.trim().equals(listProduct.getTitle())) {
                            request.setAttribute("msg", "PRODUCT is already exist");
                            request.setAttribute("listCategories", listCategories);
                            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
                            return;
                        }
                    }                 
                }
            if (!isNumeric(price) || !isNumeric(quantity) || !isNumeric(sale_price)) {
                request.setAttribute("listCategories", listCategories);
                request.setAttribute("msg", "price, quantity, sale_price must be number");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            } else {              
                dao.AddProduct(title, price, sale_price, quantity, description, img, category_id, today);
                request.setAttribute("listCategories", listCategories);
                request.setAttribute("msg", "new PRODUCT has been added");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            }
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

    public static boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Float.parseFloat(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

}
