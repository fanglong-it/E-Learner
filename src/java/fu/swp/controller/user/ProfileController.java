/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.controller.user;

import fu.swp.dao.AccountDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import fu.swp.model.Account;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuong
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class ProfileController extends HttpServlet {

    private static final long SerialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";
    private static final String LOGIN_PAGE = "Login.jsp";
    private static final String PROFILE_CONTROLLER = "profile";
    private static final String PROFILE_PAGE = "profile.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = LOGIN_PAGE;
        try {

            AccountDAO accountDAO = new AccountDAO();
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                request.setAttribute("acc", accountDAO.getAccountById(account.getId()));
                url = PROFILE_PAGE;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        int accountID = Integer.parseInt(request.getParameter("accountId"));
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        AccountDAO accountDAO = new AccountDAO();
        Account acc = new Account();
        Account oldData = (Account) request.getSession().getAttribute("account");

        try {
            acc.setId(accountID);
            acc.setFullname(fullname);
            acc.setPhone(phone);
            acc.setAddress(address);
            String checkChangePhoto = request.getParameter("isUpdatePhoto");
            if (checkChangePhoto != null) {
                String filename = uploadFile(request);
                acc.setAvatar(filename);
            } else {
                acc.setAvatar(oldData.getAvatar());
            }
            acc.setUsername(oldData.getUsername());
//            acc.setPassword(oldData.getPassword());
            acc.setEmail(oldData.getEmail());
            acc.setStatus(1);
            acc.setRole(oldData.getRole());

            Account result = accountDAO.updateAccount(acc);
            request.getSession().setAttribute("account", result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect("profile");
        }
    }

    public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("photo");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    public String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
