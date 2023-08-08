/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CategoriesDAO;
import dal.MoviesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Categories;
import models.Movies;

/**
 *
 * @author admin
 */
public class HomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoriesDAO cDAO = new CategoriesDAO();
        MoviesDAO mDAO = new MoviesDAO();
        List<Categories> list = cDAO.getAll();
        //lay caid
        String caId = request.getParameter("caID");
        request.setAttribute("caID", caId);
        //lay page
        String xpage = request.getParameter("page");
        //sort gia theo tung category
        int ca=0, page=0;
        int num=1;
        List<Movies> listpage = new ArrayList<>();
        try {
            ca = (caId == null) ? 0 : Integer.parseInt(caId);
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int size = mDAO.getMaxIndex(ca);
             num = (size % 6 == 0 ? (size / 6) : ((size / 6) + 1));
            
            request.setAttribute("page", page);
            request.setAttribute("list", list);
            request.setAttribute("num", num);
            request.setAttribute("size", size);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        listpage = mDAO.getListByPageNew(page, ca);

        String txt=request.getParameter("txt");
        if(txt!=null){
            listpage=mDAO.search(1,txt);
            request.setAttribute("page", 1);
            request.setAttribute("num", 1);
        }
        
        if(request.getParameter("by")!=null && request.getParameter("by").equals("asc")){
            listpage=mDAO.getByASC(page, ca);
        }
        if(request.getParameter("by") != null &&request.getParameter("by").equals("des")){
            listpage=mDAO.getByDES(page, ca);
        }
        String by = request.getParameter("by");
        request.setAttribute("listpage", listpage);
        request.setAttribute("by", by);
        request.getRequestDispatcher("../view/Home.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
