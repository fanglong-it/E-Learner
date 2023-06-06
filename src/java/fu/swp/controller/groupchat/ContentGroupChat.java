/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.groupchat;

import fu.swp.dao.GroupChatDAO;
import fu.swp.dao.MessageDAO;
import fu.swp.model.Account;
import fu.swp.model.GroupChat;
import fu.swp.model.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Date;
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
@WebServlet(name = "ContentGroupChat", urlPatterns = {"/chat-content"})
public class ContentGroupChat extends HttpServlet {

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
            out.println("<title>Servlet ContentGroupChat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContentGroupChat at " + request.getContextPath() + "</h1>");
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
        MessageDAO messageDAO = new MessageDAO();
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            String groupChatId = request.getParameter("groupChatId") == null ? "" : request.getParameter("groupChatId");
            String rows = request.getParameter("rows");
            if (account != null) {
                List<GroupChat> groupChats = groupChatDAO.getAllGroupChatByUserId(account.getId());
                request.setAttribute("groupChats", groupChats);
                //Default get the chat content;

                List<Message> messages = messageDAO.getAllMessageFromGroupId(Integer.parseInt(groupChatId), Integer.parseInt(rows));
                Collections.reverse(messages);

                request.setAttribute("messages", messages);
                request.setAttribute("groupChatId", groupChatId);
                request.setAttribute("rows", rows);
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
        String url = "Login.jsp";
        MessageDAO messageDAO = new MessageDAO();

        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                String groupChatId = request.getParameter("groupChatId");
                String rows = request.getParameter("rows");
                String messageContent = request.getParameter("messageContent");
                Message message = messageDAO.sendMessage(new Message(0, messageContent, "", account, Integer.parseInt(groupChatId), new Date(System.currentTimeMillis())));
                url = "chat-content?groupChatId=" + groupChatId + "&rows=" + rows;
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
