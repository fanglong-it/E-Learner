/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.lesson;

import fu.swp.dao.LessonDAO;
import fu.swp.model.Account;
import fu.swp.model.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DW
 */
@WebServlet(name = "SaveLessonController", urlPatterns = {"/save-lesson"})
public class SaveLessonController extends HttpServlet {

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
            out.println("<title>Servlet SaveLessonController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveLessonController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String url = "";
        String msg = "";
        try {
            Account account = (Account) request.getSession().getAttribute("account");
            if (account != null) {
                LessonDAO lessonDAO = new LessonDAO();
                String lessonId = request.getParameter("lessonId") == null ? "" : request.getParameter("lessonId");
                String lessonName = request.getParameter("lessonName");
                String description = request.getParameter("description");
                String videoUrl = request.getParameter("videoUrl");
                String courseId = request.getParameter("courseId");
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("update")) {
                    lessonDAO.updateLesson(new Lesson(Integer.parseInt(lessonId), lessonName, 1, description, videoUrl, Integer.parseInt(courseId)));
                } else {
                    lessonDAO.saveLesson(new Lesson(0, lessonName, 1, description, videoUrl, Integer.parseInt(courseId)));
                }
                url = "manager-lesson?courseId=" + courseId;
            } else {
                url = "Login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
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

}
