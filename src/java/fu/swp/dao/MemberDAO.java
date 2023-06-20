/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Account;
import fu.swp.model.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DW
 */
public class MemberDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    AccountDAO accountDAO = new AccountDAO();
    GroupChatDAO groupChatDAO = new GroupChatDAO();

    public Member getLastMemberChat() throws SQLException, Exception {
        String query = "SELECT TOP(1) * FROM [Member] m order by m.id desc";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return Member.builder()
                            .id(rs.getInt("id"))
                            .groupChat(groupChatDAO.getGroupChatById(rs.getInt("groupChatId")))
                            .account(accountDAO.getAccountById(rs.getInt("userId")))
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

    public Member saveMemberChat(Member member) throws SQLException, Exception {
        String query = "INSERT INTO [Member] (groupChatId, userId) VALUES(?, ?)";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, member.getGroupChat().getId());
                ps.setInt(2, member.getAccount().getId());
                if (ps.executeUpdate() > 0) {
                    return getLastMemberChat();
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

    public int countTotalMemberByGroupChatId(int groupChatId) throws SQLException, Exception {
        String query = "select COUNT(m.userId) as total_member from [Member] m where m.groupChatId = ?";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, groupChatId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("total_member");
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
        return 0;
    }
}
