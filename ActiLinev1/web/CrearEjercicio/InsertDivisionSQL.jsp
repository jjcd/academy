<%-- 
    Document   : InsertDivisionSQL
    Created on : 19-ene-2017, 0:08:00
    Author     : JUAN JOSE
--%>

<%@ page import="java.sql.*" %>
<%@ page import="classes.DivisionClass" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
  <%
      DivisionClass divisionObj;
      String valor = "";
      String solUser = "";
      String sol = "";
      String user = "";
      String sql = "";
      
      if((request.getAttribute("divisionObject")!=null))
      {
          divisionObj = (DivisionClass) request.getAttribute("divisionObject");
          
          valor = divisionObj.getValor();
          solUser = divisionObj.getSolucionUsuario();
          sol = divisionObj.getSolucion();
          user = divisionObj.getUsuario();
          
          //Insertar en bd
          Connection con = (Connection) request.getSession().getAttribute("h2.connection");
          
          sql = "INSERT INTO EJERCICIORESUELTO VALUES (NULL,'"+ valor +"', '"+ solUser +"', '"+ sol +"','"+ user +"')";
         
          Statement stmt = con.createStatement();

          stmt.executeUpdate(sql);
          
         
      }
      
      //Connection con = (Connection) request.getSession().getAttribute("h2.connection");

      //PreparedStatement stmt = con.prepareStatement("SELECT * FROM EJERCICIO");
      //ResultSet rst = stmt.executeQuery();
      //while (rst.next()) {
      %>
      
      <%=valor%></br>
      <%=solUser%></br>
      <%=sol%></br>
      <%=user%></br>
      
      <%= sql %>
      
    </body>
</html>
