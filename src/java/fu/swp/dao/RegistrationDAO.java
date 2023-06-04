/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Account;
import fu.swp.model.RegistrationClass;
import fu.swp.model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DW
 */
public class RegistrationDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public RegistrationClass getAccountIsRegistration(int accountId) throws SQLException, Exception {
        String query = "SELECT rc.id, rc.requestDate , rc.requestStatus , rc.classId , rc.accountId\n"
                + "from RegistrationClass rc WHERE rc.accountId = ? and rc.requestStatus = 'Approved'; ";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, accountId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return RegistrationClass.builder()
                            .id(rs.getInt("id"))
                            .requestDate(rs.getDate("requestDate"))
                            .requestStatus(rs.getString("requestStatus"))
                            .classId(rs.getInt("classId"))
                            .accountId(rs.getInt("accountId"))
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

    public boolean isRegistration(int accountId) throws SQLException, Exception {
        String query = "SELECT rc.id, rc.requestDate , rc.requestStatus , rc.classId , rc.accountId\n"
                + "from RegistrationClass rc WHERE rc.accountId = ? and rc.requestStatus = 'Approved'; ";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, accountId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;

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
        return false;
    }
}
