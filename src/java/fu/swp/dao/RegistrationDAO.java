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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class RegistrationDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    AccountDAO accountDAO = new AccountDAO();
    CourseDAO courseDAO = new CourseDAO();

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

    public RegistrationClass getLastRegistrationClass() throws SQLException, Exception {
        String query = "Select TOP(1) * from RegistrationClass rc order by rc.id";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
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

    public RegistrationClass getRegistrationClassByRegisId(int id) throws SQLException, Exception {
        String query = "Select * from RegistrationClass rc where rc.id = ?";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
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

//    INSERT INTO [e-learner].dbo.RegistrationClass (requestDate, requestStatus, classId, accountId) VALUES('', '', 0, 0);
    public RegistrationClass saveRegistrationClass(RegistrationClass registrationClass) throws SQLException, Exception {
        String query = "INSERT INTO [e-learner].dbo.RegistrationClass (requestDate, requestStatus, classId, accountId)"
                + " VALUES(?, ?, ?, ?);";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setDate(1, new Date(registrationClass.getRequestDate().getTime()));
                ps.setString(2, registrationClass.getRequestStatus());
                ps.setInt(3, registrationClass.getClassId());
                ps.setInt(4, registrationClass.getAccountId());

                if (ps.executeUpdate() > 0) {
                    return getLastRegistrationClass();
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

    public RegistrationClass updateRequestJoinClass(int regisId, String status) throws SQLException, Exception {
        String query = "Update RegistrationClass set requestStatus = ? where id = ?";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setString(1, status);
                ps.setInt(2, regisId);
                if (ps.executeUpdate() > 0) {
                    return getRegistrationClassByRegisId(regisId);
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

    public boolean isRegistration(int accountId, int courseId) throws SQLException, Exception {
        String query = "SELECT rc.id, rc.requestDate , rc.requestStatus , rc.classId , rc.accountId\n"
                + "                from RegistrationClass rc\n"
                + "               	left outer join Class c ON rc.classId = c.id          \n"
                + "                WHERE rc.accountId = ? and rc.requestStatus = 'Approved' and c.courseId = ?; ";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, accountId);
                ps.setInt(2, courseId);
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

    public boolean isSendRegistration(int accountId, int classId) throws SQLException, Exception {
        String query = "SELECT * from RegistrationClass rc WHERE rc.classId = ? and rc.accountId = ?;";
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, classId);
                ps.setInt(2, accountId);
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

    public List<RegistrationClass> getRegisterByClassId(int classId) throws SQLException, Exception {
        String query = "SELECT * from RegistrationClass rc WHERE rc.classId = ?;";
        ArrayList<RegistrationClass> registrations = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, classId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    registrations.add(
                            RegistrationClass.builder()
                                    .id(rs.getInt("id"))
                                    .requestDate(rs.getDate("requestDate"))
                                    .requestStatus(rs.getString("requestStatus"))
                                    .classId(rs.getInt("classId"))
                                    .accountId(rs.getInt("accountId"))
                                    .account(accountDAO.getAccountById(rs.getInt("accountId")))
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
        return registrations;
    }
}
