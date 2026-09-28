package com.santiher;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("SantiHer Database Connection Test PASSED!");

            try {
                con.close();
                System.out.println("Database Connection Closed.");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("SantiHer Database Connection Test FAILED!");
        }
    }
}