<%-- 
    Document   : InsertDivision
    Created on : 01-ene-2017, 22:11:44
    Author     : JUAN JOSE
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
  <%
      Connection con = (Connection) request.getSession().getAttribute("h2.connection");

      PreparedStatement stmt = con.prepareStatement("SELECT * FROM EJERCICIO");
      ResultSet rst = stmt.executeQuery();
      while (rst.next()) {
      %>

  <%=rst.getString("VALOR")%>, mailto:<%=rst.getString("WEB")%><br/>

      <%
      }

  %>
    </body>
</html>
