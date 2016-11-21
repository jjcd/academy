<%@ page import="java.sql.*" %>
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