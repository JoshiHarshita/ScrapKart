/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scrapKart.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;

/**
 *
 * @author PC
 */
public class DBConnection {
    private static Connection conn;
    static
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("Driver loaded!");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@//LAPTOP-E496KQSH:1521/XE","minorproject", "minorproject");
            System.out.println("Connection opened!");

        }
        
    catch(Exception ex)
    {
        System.out.println("Exception in static block:"+ex);

    }
    }
public static Connection getConnection()
{
    return conn;
}
public static void closeConnection()
{
    try
    {
        conn.close();
    }
    catch(Exception ex)
    {
        System.out.println("Exception in closing the conn:"+ex);
    }
}
}
