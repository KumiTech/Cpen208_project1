package com.kelly.cpen_208.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class cls_courses {
    public Connection con = null;
  
    public String outstanding_fees(int s_id) {
      String result = null;
      String SQL = "SELECT * FROM student_.calculate_outstanding_fees(?)";
      Connection conn = con;
      try {
  
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        pstmt.setInt(1, s_id);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
          result = rs.getString("calculate_outstanding_fees");
        }
      } catch (SQLException e) {
        // Print Errors in console.
        System.out.println("DATA Base code read");
        System.out.println(e.getMessage());
      } finally {
        if (conn != null) {
          try {
            conn.close();
          } catch (SQLException ex) {
          }
        }
      }
      return result;
    };
  

    public String delete_courses(String json_request) {
    String result = null;
    String SQL = "SELECT * FROM student_.delete_courses(?)";
    Connection conn = con;
    try {

      PreparedStatement pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1, json_request);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        result = rs.getString("delete_courses");
      }
    } catch (SQLException e) {
      // Print Errors in console.
      System.out.println("DATA Base code added");
      System.out.println(e.getMessage());
    } finally {
      if (conn != null) {
        try {
          conn.close();
        } catch (SQLException ex) {
        }
      }
    }
    return result;
  }
    public String add_courses(String json_request) {
      String result = null;
      String SQL = "SELECT * FROM student_.add_courses(?)";
      Connection conn = con;
      try {
  
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1, json_request);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
          result = rs.getString("add_courses");
        }
      } catch (SQLException e) {
        // Print Errors in console.
        System.out.println("DATA Base code added");
        System.out.println(e.getMessage());
      } finally {
        if (conn != null) {
          try {
            conn.close();
          } catch (SQLException ex) {
          }
        }
      }
      return result;
    }
  }