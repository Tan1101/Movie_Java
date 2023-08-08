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
import java.util.List;
import models.Categories;

/**
 *
 * @author admin
 */
public class AddMovieServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddMovieServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMovieServlet at " + request.getContextPath () + "</h1>");
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
        
        //khoi tao list category va list anh
        List<Categories> listca = cDAO.getAll();
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String ca = request.getParameter("ca");
        String des = request.getParameter("des");
        String year = request.getParameter("year");
        String dir = request.getParameter("dir");
        request.setAttribute("listca", listca);
        request.getRequestDispatcher("../view/AddMovie.jsp").forward(request, response);
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
        CategoriesDAO cDAO = new CategoriesDAO();
        List<Categories> listca = cDAO.getAll();
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String ca = request.getParameter("ca");
        String des = request.getParameter("des");
        String year = request.getParameter("year");
        String dir = request.getParameter("dir");
        MoviesDAO dao = new MoviesDAO();
        dao.addMovie(name,img,ca,des,year,dir);
        request.setAttribute("mess", "Add Successful");
        request.setAttribute("listca", listca);
        request.getRequestDispatcher("../view/AddMovie.jsp").forward(request, response);
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
