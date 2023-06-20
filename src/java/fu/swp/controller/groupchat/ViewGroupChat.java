/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.groupchat;

import fu.swp.dao.AccountDAO;
import fu.swp.dao.GroupChatDAO;
import fu.swp.dao.MemberDAO;
import fu.swp.model.Account;
import fu.swp.model.GroupChat;
import fu.swp.model.Member;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.acl.Group;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DW
 */
@WebServlet(name = "ViewGroupChat", urlPatterns = {"/view-group-chat"})
public class ViewGroupChat extends HttpServlet {

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
            out.println("<title>Servlet ViewGroupChat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewGroupChat at " + request.getContextPath() + "</h1>");
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
        String url = "";
        GroupChatDAO groupChatDAO = new GroupChatDAO();
        try {
            HttpSession session = request.getSession();

            Account account = (Account) session.getAttribute("account");
            String groupChatId = request.getParameter("groupChatId") == null ? "" : request.getParameter("groupChatId");

            if (account != null) {
                int rows = 5;
                List<GroupChat> groupChats = account.getRole().getRole_name().equals("STUDENT")
                        ? groupChatDAO.getAllGroupChatByUserId(account.getId())
                        : groupChatDAO.getAllGroupChatExceptStudent(account.getId());
                MemberDAO memberDAO = new MemberDAO();
                AccountDAO accountDAO = new AccountDAO();
                for (GroupChat groupChat : groupChats) {
                    groupChat.setMember(memberDAO.countTotalMemberByGroupChatId(groupChat.getId()));
                    groupChat.setAccounts(accountDAO.getListAccountByGroupChatId(groupChat.getId()));
                }

                request.setAttribute("groupChats", groupChats);
                request.setAttribute("rows", rows);
                //Default get the chat content;
                url = "group-chat.jsp";
            } else {
                url = "Login.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
