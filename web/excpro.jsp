<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Controller" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
        
    </head>
    <body>
        <%
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            Controller cn = new Controller();
            try {   
            
            cn.excluir(cod);
            response.sendRedirect("listpro.jsp");
            
            }catch(Exception x){
                String erro = x.getMessage();
                out.print("Erro: " + erro);
            }
           
            
        %>


    </body>
</html>
