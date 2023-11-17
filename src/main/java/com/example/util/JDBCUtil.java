package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

    public static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/p232_22000082","p232_22000082","Juech6");
        } catch (ClassNotFoundException e ) {
            System.out.println("드라이버 오류");
            throw new RuntimeException(e);
        }catch (SQLException e) {
            System.out.println("db 연결 오류");
            throw new RuntimeException(e);
        }
        return conn;
    }

    public static void main(String arg[]){
        Connection con = JDBCUtil.getConnection();
        if (con==null)
            System.out.println("연결 안 됨");
        else
            System.out.println("연결 됨!");
    }

}
