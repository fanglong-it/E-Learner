/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import fu.swp.model.Subject;
import fu.swp.model.SubjectRegistration;
import fu.swp.model.UserRegister;


public class SubjectRegistrationDAO extends DBContext {

    Connection con = null; // ket noi vs sql
    PreparedStatement ps = null; // nhan cau lenh
    ResultSet rs = null; // tra kq

    public List<SubjectRegistration> getAllSubjectRegister(int userId) {
        List<SubjectRegistration> list = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "Select Acc.userId,Acc.username, RS.subId,RS.userId,RS.statis,S.status,S.subjectId,S.subjectName from Account Acc inner join Registration_Subject RS\n"
                        + "on Acc.userId = RS.userId\n"
                        + "inner join Subject S on S.subjectId = RS.subId where RS.userId = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                userId = 2;
                stm.setInt(1, userId);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    SubjectRegistration s = SubjectRegistration.builder()
                            .usedId(rs.getInt(1))
                            .regisId(rs.getInt(3))
                            .subId(rs.getInt(4))
                            .statis(rs.getString(6))
                            .subId(rs.getInt(8))
                            .build();
                    list.add(s);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public void createSubjectRegister(SubjectRegistration sr) {
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[Registration_Subject]\n"
                        + "           ([regis_Date]\n"
                        + "           ,[statis]\n"
                        + "           ,[subId]\n"
                        + "           ,[priceId]\n"
                        + "           ,[userId])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, sr.getRegis_Date());
                ps.setString(2, sr.getStatis());
                ps.setInt(3, sr.getSubId());
                ps.setInt(4, sr.getPriceId());
                ps.setInt(5, sr.getUsedId());;
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<UserRegister> getAllUserRegister(int userId) {

        List<UserRegister> list = new ArrayList<>();
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "Select distinct RS.userId, RS.regisId,RS.statis,S.*, PP.salePrice,PP.price\n"
                        + "from Subject AS S left join SubjectPrice AS SP \n"
                        + "on S.subjectId = SP.subjectId \n"
                        + "left join PricePackage as PP on PP.priceId = SP.priceId\n"
                        + "inner join Registration_Subject RS on RS.subId = S.subjectId where RS.userId = 2";
                PreparedStatement stm = con.prepareStatement(sql);
                userId = 2;
                stm.setInt(1, userId);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    UserRegister us = UserRegister.builder()
                            .userId(rs.getInt(1))
                            .regisId(rs.getInt(2))
                            .regisStatis(rs.getString(3))
                            .subjectId(rs.getInt(4))
                            .subjectName(rs.getString(5))
                            .categoryId(rs.getInt(6))
                            .status(rs.getBoolean(7))
                            .tagLine(rs.getInt(8))
                            .title(rs.getString(9))
                            .thumbnail(rs.getString(10))
                            .description(rs.getString(11))
                            .salePrice(rs.getInt(12))
                            .price(rs.getInt(13))
                            .build();
                    list.add(us);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int checkRegistration(int subjectId, int userid) {
        
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "select SR.regisId from Registration_Subject SR WHERE SR.userId = ? and SR.subId = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, userid);
                stm.setInt(2, subjectId);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
