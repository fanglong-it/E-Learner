/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Course;
import fu.swp.model.GroupChat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class GroupChatDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    AccountDAO accountDAO = new AccountDAO();
    ClassDAO classDAO = new ClassDAO();
//    

    public List<GroupChat> getAllGroupChatByUserId(int userId) throws SQLException, Exception {
        String query = "SELECT gc.id, gc.groupChatName, gc.isPrivate , gc.classId , gc.userId  from RegistrationClass rc\n"
                + "              	left outer join GroupChat gc on rc.classId = gc.classId \n"
                + "              where rc.accountId = ? and rc.requestStatus = 'Approved'";
        ArrayList<GroupChat> groupChats = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    groupChats.add(
                            GroupChat.builder()
                                    .id(rs.getInt("id"))
                                    .groupChatName(rs.getString("groupChatName"))
                                    .isPrivate(rs.getInt("isPrivate"))
                                    .clas(classDAO.getClassById(rs.getInt("classId")))
                                    .account(accountDAO.getAccountById(rs.getInt("userId")))
                                    .build()
                    );
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return groupChats;
    }

    public List<GroupChat> getAllGroupChatExceptStudent(int userId) throws SQLException, Exception {
        String query = "SELECT * from GroupChat gc where gc.userId = ?";
        ArrayList<GroupChat> groupChats = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    groupChats.add(
                            GroupChat.builder()
                                    .id(rs.getInt("id"))
                                    .groupChatName(rs.getString("groupChatName"))
                                    .isPrivate(rs.getInt("isPrivate"))
                                    .clas(classDAO.getClassById(rs.getInt("classId")))
                                    .account(accountDAO.getAccountById(rs.getInt("userId")))
                                    .build()
                    );
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return groupChats;
    }
}
