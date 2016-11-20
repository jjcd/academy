/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class MySessionListener implements ServletContextListener,
    HttpSessionListener {

    // Constante para el nombre de los ficheros
    private final static String DBFILENAME = "test";

    String url;
    Connection globalConnection;

public void contextInitialized(ServletContextEvent sce) {
    // Leemos el parametro del contexto
    String spath = sce.getServletContext().getInitParameter("h2.database.path");
    if (spath == null) {
        // Si no existe, es la home del usuario
        spath = System.getProperty("user.home");
    }

    // Comprobamos si no existe la base de datos
    boolean exists = new File(spath, DBFILENAME+".data.db").exists();

    try {
        Class.forName("org.h2.Driver");
        File dbfile = new File(spath, DBFILENAME);
        url = "jdbc:h2:file:" + dbfile.getAbsolutePath().replaceAll("\\\\", "/");
        globalConnection = openConnection();

        // Si no existe, llamamos al metodo initDb()
        if (!exists) {
            initDb();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

private void initDb() throws SQLException, IOException {
    InputStream is = getClass().getClassLoader().getResourceAsStream("squema-h2.sql.txt");
    BufferedReader br = new BufferedReader(new InputStreamReader(is));
    Connection connection = null;
    try {
        connection = openConnection();
        String line = br.readLine();
        StringBuilder statement = new StringBuilder();
        while (line != null) {
            line = line.trim();
            if (!line.startsWith("--") && !line.startsWith("#") && !line.startsWith("//")) {
                statement.append(line);
                if (line.endsWith(";")) {
                    executeLine(connection, statement.toString());
                    statement = new StringBuilder();
                }
            }
            line = br.readLine();
        }
        if (statement.length() > 0) {
            executeLine(connection, statement.toString());
        }
    } finally {
        try {
            br.close();
        } catch (Exception e) {;}
        try {
            if (connection != null) connection.close();
        } catch (Exception e) {;}
    }
}

private void executeLine(Connection connection, String statement) throws SQLException {
    PreparedStatement pstmt = connection.prepareStatement(statement);
    pstmt.execute();
    pstmt.close();
    System.out.println("Ejecutando "+statement);
}

    public Connection openConnection() throws SQLException {
        return DriverManager.getConnection(url, "", "sa");
    }

    public void contextDestroyed(ServletContextEvent sce) {
        try {
            globalConnection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void sessionCreated(HttpSessionEvent se) {
        try {
            se.getSession().setAttribute("h2.connection", openConnection());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        try {
            Connection con = (Connection)se.getSession().getAttribute("h2.connection");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
