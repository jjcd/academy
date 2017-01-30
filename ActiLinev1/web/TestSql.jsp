<%@ page import="java.sql.*" %>
<html>
  <body>
  <%
      Connection con = (Connection) request.getSession().getAttribute("h2.connection");

      PreparedStatement stmt = con.prepareStatement("SELECT * FROM USUARIO");
      ResultSet rst = stmt.executeQuery();
      while (rst.next()) {
      %>

  <%=rst.getString("LOGIN")%>, mailto:<%=rst.getString("EMAIL")%><br/>

      <%
      }

  %>
  </body>
</html>