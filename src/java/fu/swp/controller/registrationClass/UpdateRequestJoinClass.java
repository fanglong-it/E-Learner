/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.registrationClass;

import fu.swp.dao.AccountDAO;
import fu.swp.dao.GroupChatDAO;
import fu.swp.dao.MemberDAO;
import fu.swp.dao.MessageDAO;
import fu.swp.dao.NotificationDAO;
import fu.swp.dao.RegistrationDAO;
import fu.swp.model.Account;
import fu.swp.model.GroupChat;
import fu.swp.model.Member;
import fu.swp.model.Message;
import fu.swp.model.Notification;
import fu.swp.model.RegistrationClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "UpdateRequestJoinClass", urlPatterns = {"/update-request"})
public class UpdateRequestJoinClass extends HttpServlet {

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
            out.println("<title>Servlet UpdateRequestJoinClass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRequestJoinClass at " + request.getContextPath() + "</h1>");
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
        String url = "course-detail";
        try {

            GroupChatDAO groupChatDAO = new GroupChatDAO();
            AccountDAO accountDAO = new AccountDAO();
            MemberDAO memberDAO = new MemberDAO();
            MessageDAO messageDAO = new MessageDAO();

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            NotificationDAO notificationDAO = new NotificationDAO();
            if (account != null) {
                String regisId = request.getParameter("regisId");
                String status = request.getParameter("regisStatus");
                String reason = "";
                if (status.equalsIgnoreCase("denied")) {
                    reason = request.getParameter("reason");
                }
                RegistrationDAO registrationDAO = new RegistrationDAO();
                RegistrationClass registrationClass = registrationDAO.updateRequestJoinClass(Integer.parseInt(regisId), status, reason);
                Account memberAcc = accountDAO.getAccountById(registrationClass.getAccountId());
                if (registrationClass.getRequestStatus().equals("Approved")) {
                    List<GroupChat> groupChats = groupChatDAO.getAllGroupChatByClassId(registrationClass.getClassId());
                    for (GroupChat groupChat : groupChats) {
                        Member member = new Member(0, memberAcc, groupChat);
                        memberDAO.saveMemberChat(member);
                        messageDAO.sendMessage(new Message(0, memberAcc.getEmail() + " Has Join! this conversation ", "", memberAcc, groupChat.getId(), null));
                        Notification notification = new Notification(0, "You have been approved to class " + registrationClass.getClassId() + " by " + account.getUsername(), memberAcc, new Date(System.currentTimeMillis()));
                        notificationDAO.saveNotification(notification);
                    }
                } else if (registrationClass.getRequestStatus().equals("Pending")) {
                    Notification notification = new Notification(0, "You have been remove from the class " + registrationClass.getClassId() + " by " + account.getUsername(), memberAcc, new Date(System.currentTimeMillis()));
                    notificationDAO.saveNotification(notification);
                } else {
                    Notification notification = new Notification(0, "You have have been Reject by " + account.getUsername() + " from the class " + registrationClass.getClassId() + "<br> Reason: " + reason, memberAcc, new Date(System.currentTimeMillis()));
                    notificationDAO.saveNotification(notification);
                }
                url = "view-request?classId=" + registrationClass.getClassId();
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
