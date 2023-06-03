package fu.swp.controller.course;

///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
import fu.swp.dao.CourseDAO;
import fu.swp.model.Course;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import fu.swp.model.Lesson;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CourseController", urlPatterns = {"/list-course"})
public class ListCourseController extends HttpServlet {

    private static final String COURSE_PAGE = "list-course.jsp";

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
            out.println("<title>Servlet SubjectListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectListController at " + request.getContextPath() + "</h1>");
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
        try {
//            final int PAGE_SIZE = 6;
//            int page = 1;
//            String pageStr = request.getParameter("page");
//            if (pageStr != null) {
//                page = Integer.parseInt(pageStr);
//            }
//            int totalSearch = new SubjectDAO().getTotalSubject();
//            int totalPage = totalSearch / PAGE_SIZE;
//            if (totalSearch % PAGE_SIZE != 0) {
//                totalPage += 1;
//            }

            String searchValue = request.getParameter("courseName") == null ? "" : request.getParameter("courseName");
            CourseDAO courseDAO = new CourseDAO();
            List<Course> courses = courseDAO.getAllCoursesIncluceTeacher(searchValue);
            request.setAttribute("courses", courses);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(COURSE_PAGE).forward(request, response);
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
//        processRequest(request, response);
        try {
//            final int PAGE_SIZE = 6;
//            int page = 1;
//            String pageStr = request.getParameter("page");
//            if (pageStr != null) {
//                page = Integer.parseInt(pageStr);
//            }
//            int totalSearch = new SubjectDAO().getTotalSubject();
//            int totalPage = totalSearch / PAGE_SIZE;
//            if (totalSearch % PAGE_SIZE != 0) {
//                totalPage += 1;
//            }
//
//            SubjectDAO subjectDAO = new SubjectDAO();
//            request.getSession().setAttribute("listSubjects", subjectDAO.getAllSubjects());
//            request.setAttribute("listSubjects", subjectDAO.getListSubjectsByPagging(page, PAGE_SIZE));
//            System.out.println("List: " + subjectDAO.getAllSubjects().toString());
//            List<Slider> listSliders = new SliderDAO().getAllSlidersShow();
//            List<Blog> listBlogs = new BlogDAO().getListBlogs();
//
//            request.getSession().setAttribute("listSliders", listSliders);
//            request.setAttribute("page", page);
//            request.setAttribute("totalPage", totalPage);
//            request.getSession().setAttribute("listBlogs", listBlogs);
//            request.getSession().setAttribute("search_url", "search_subject");
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            request.getRequestDispatcher("SubjectList.jsp").forward(request, response);
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
