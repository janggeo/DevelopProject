package com.example.new2.user;

import com.example.new2.user.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
//            String dbName = System.getProperty("RDS_DB_NAME");
//            String userName = System.getProperty("RDS_USERNAME");
//            //String password = System.getProperty("RDS_PASSWORD");
//            String hostname = System.getProperty("RDS_HOSTNAME");
//            String port = System.getProperty("RDS_PORT");
//            String dbURL = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + "aa147147!";

            String dbURL = "jdbc:mysql://database-1.c2amexxqgd98.ap-northeast-2.rds.amazonaws.com/VeganWebSite";
            String dbID = "admin";
            String dbPassword = "aa147147!";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);


        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userID,String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                if(rs.getString(1).equals(userPassword)) {
                    return 1; //로그인성공
                }
                else {
                    return 0; //비밀번호 불일치
                }
            }

            else {
                return -1; //아이디가 없음
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -2; //데이터베이스 오류
    }

    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());

            return pstmt.executeUpdate();

        }catch(Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }


}