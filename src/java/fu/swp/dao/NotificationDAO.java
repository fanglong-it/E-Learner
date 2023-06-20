/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Course;
import fu.swp.model.Notification;
import java.io.Serializable;
import java.sql.Connection;
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
public class NotificationDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    AccountDAO accountDAO = new AccountDAO();
    ClassDAO classDAO = new ClassDAO();

    public List<Notification> getListNotificationByAccount(int accountId) throws SQLException, Exception {
        String query = "select * from [Notification] where Notification.ownerId = ? order by dateCreate desc";
        ArrayList<Notification> notifications = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, accountId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    notifications.add(
                            Notification.builder()
                                    .id(rs.getInt("id"))
                                    .content(rs.getString("content"))
                                    .account(accountDAO.getAccountById(rs.getInt("ownerId")))
                                    .dateCreate(rs.getDate("dateCreate"))
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
        return notifications;
    }

    public Notification getLastNotification() throws SQLException, Exception {
        String query = "select top(1) * from [Notification] order by Notification.ownerId desc";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                if (rs.next()) {

                    return Notification.builder()
                            .id(rs.getInt("id"))
                            .content(rs.getString("content"))
                            .account(accountDAO.getAccountById(rs.getInt("ownerId")))
                            .dateCreate(rs.getDate("dateCreate"))
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

    public Notification saveNotification(Notification notification) throws SQLException, Exception {
        String query = "INSERT INTO [dbo].[Notification]([content],[ownerId], [dateCreate])\n"
                + "     VALUES (? ,?, ?);";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setString(1, notification.getContent());
                ps.setInt(2, notification.getAccount().getId());
                ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
                if (ps.executeUpdate() > 0) {
                    return getLastNotification();
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
