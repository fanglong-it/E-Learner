/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.GroupChat;
import fu.swp.model.Message;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class MessageDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    AccountDAO accountDAO = new AccountDAO();
    ClassDAO classDAO = new ClassDAO();
//    

    public List<Message> getAllMessageFromGroupId(int groupChatId, int rows) throws SQLException, Exception {
        String query = "select TOP(?) * from Message m where m.groupId = ? order by m.dateSended Desc";
        ArrayList<Message> messages = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, rows);
                ps.setInt(2, groupChatId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    messages.add(
                            Message.builder()
                                    .id(rs.getInt("id"))
                                    .content(rs.getString("content"))
                                    .resourcePathFile(rs.getString("resoucePathFile"))
                                    .account(accountDAO.getAccountById(rs.getInt("userId")))
                                    .groupId(rs.getInt("groupId"))
                                    .dateSended(rs.getDate("dateSended"))
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
        return messages;
    }

    public Message getLastMessage() throws SQLException, Exception {
        String query = "select top(1) * from Message m order by m.id Desc";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Message.builder()
                            .id(rs.getInt("id"))
                            .content(rs.getString("content"))
                            .resourcePathFile(rs.getString("resoucePathFile"))
                            .account(accountDAO.getAccountById(rs.getInt("userId")))
                            .groupId(rs.getInt("groupId"))
                            .dateSended(rs.getDate("dateSended"))
                            .build();
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
        return null;
    }

    public Message sendMessage(Message message) throws SQLException, Exception {
        String query = "INSERT INTO [e-learner].dbo.Message (content, resoucePathFile, userId, groupId, dateSended) VALUES(?, ?, ?, ?, ?);";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setString(1, message.getContent());
                ps.setString(2, message.getResourcePathFile());
                ps.setInt(3, message.getAccount().getId());
                ps.setInt(4, message.getGroupId());
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                if (ps.executeUpdate() > 0) {
                    return getLastMessage();
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
        return null;
    }
}
