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
public class LessonDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Lesson> getLessonByCourseId(int courseId) throws SQLException, Exception {
        String query = "SELECT l.id, l.lessonName , l.status , l.description , l.videoUrl , l.courseId  FROM Lesson l"
                + " WHERE l.courseId = ?";
        ArrayList<Lesson> lessons = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, courseId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    lessons.add(Lesson.builder()
                            .id(rs.getInt("id"))
                            .lessonName(rs.getString("lessonName"))
                            .status(rs.getInt("status"))
                            .description(rs.getString("description"))
                            .videoUrl(rs.getString("videoUrl"))
                            .courseId(rs.getInt("courseId")).build());
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
        return lessons;
    }

    public Lesson getLessonId(int lessonId) throws SQLException, Exception {
        String query = "SELECT l.id, l.lessonName , l.status , l.description , l.videoUrl , l.courseId  FROM Lesson l"
                + " WHERE l.id = ?";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, lessonId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return Lesson.builder()
                            .id(rs.getInt("id"))
                            .lessonName(rs.getString("lessonName"))
                            .status(rs.getInt("status"))
                            .description(rs.getString("description"))
                            .videoUrl(rs.getString("videoUrl"))
                            .courseId(rs.getInt("courseId")).build();
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

    public Lesson getLastLesson() throws SQLException, Exception {
        String query = "SELECT top(1) l.id, l.lessonName , l.status , l.description , l.videoUrl , l.courseId  FROM Lesson l"
                + " order by l.id desc";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return Lesson.builder()
                            .id(rs.getInt("id"))
                            .lessonName(rs.getString("lessonName"))
                            .status(rs.getInt("status"))
                            .description(rs.getString("description"))
                            .videoUrl(rs.getString("videoUrl"))
                            .courseId(rs.getInt("courseId")).build();
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

    public Lesson saveLesson(Lesson lesson) throws SQLException, Exception {
        String query = "INSERT INTO [e-learner].dbo.Lesson"
                + " (lessonName, status, description, videoUrl, courseId) VALUES(?, ?, ?, ?, ?);";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setString(1, lesson.getLessonName());
                ps.setInt(2, lesson.getStatus());
                ps.setString(3, lesson.getDescription());
                ps.setString(4, lesson.getVideoUrl());
                ps.setInt(5, lesson.getCourseId());
                if (ps.executeUpdate() > 0) {
                    return getLastLesson();
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

    public Lesson updateLesson(Lesson lesson) throws SQLException, Exception {
        String query = "UPDATE [e-learner].dbo.Lesson "
                + "SET lessonName=?, status=?, description=?, videoUrl=?, courseId=? "
                + "WHERE id=?;";

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setString(1, lesson.getLessonName());
                ps.setInt(2, lesson.getStatus());
                ps.setString(3, lesson.getDescription());
                ps.setString(4, lesson.getVideoUrl());
                ps.setInt(5, lesson.getCourseId());
                ps.setInt(6, lesson.getId());
                if (ps.executeUpdate() > 0) {
                    return getLessonId(lesson.getId());
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
