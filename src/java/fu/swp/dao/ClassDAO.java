/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Lesson;
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
public class ClassDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    AccountDAO accountDAO = new AccountDAO();
    CourseDAO courseDAO = new CourseDAO();

    public List<fu.swp.model.Class> getClassByTeacherId(int teacher) throws SQLException, Exception {
        String query = "SELECT * from Class c WHERE c.userId = ?;";
        ArrayList<fu.swp.model.Class> classes = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, teacher);
                rs = ps.executeQuery();
                while (rs.next()) {
                    classes.add(
                            fu.swp.model.Class.builder()
                                    .id(rs.getInt("Id"))
                                    .className(rs.getString("className"))
                                    .maxStudent(rs.getInt("maxStudent"))
                                    .account(accountDAO.getAccountById(rs.getInt("userId")))
                                    .dateCreate(rs.getDate("dateCreate"))
                                    .image(rs.getString("image"))
                                    .status(rs.getInt("status"))
                                    .course(courseDAO.getCourseById(rs.getInt("courseId")))
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
        return classes;
    }

    public fu.swp.model.Class getClassById(int classId) throws SQLException, Exception {
        String query = "SELECT * from Class c WHERE c.id = ?;";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, classId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return fu.swp.model.Class.builder()
                            .id(rs.getInt("Id"))
                            .className(rs.getString("className"))
                            .maxStudent(rs.getInt("maxStudent"))
                            .account(accountDAO.getAccountById(rs.getInt("userId")))
                            .dateCreate(rs.getDate("dateCreate"))
                            .image(rs.getString("image"))
                            .status(rs.getInt("status"))
                            .course(courseDAO.getCourseById(rs.getInt("courseId")))
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

    public List<fu.swp.model.Class> getClassByCourseId(int courseId) throws SQLException, Exception {
        String query = "SELECT * from Class c WHERE c.courseId = ?;";
        ArrayList<fu.swp.model.Class> classes = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, courseId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    classes.add(
                            fu.swp.model.Class.builder()
                                    .id(rs.getInt("Id"))
                                    .className(rs.getString("className"))
                                    .maxStudent(rs.getInt("maxStudent"))
                                    .account(accountDAO.getAccountById(rs.getInt("userId")))
                                    .dateCreate(rs.getDate("dateCreate"))
                                    .image(rs.getString("image"))
                                    .status(rs.getInt("status"))
                                    .course(courseDAO.getCourseById(rs.getInt("courseId")))
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
        return classes;
    }

    public boolean isOwnerCourse(int courseId, int userId) throws SQLException, Exception {
        String query = "SELECT * from Class c WHERE c.courseId = ? and c.userId = ?;";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, courseId);
                ps.setInt(2, userId);
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
