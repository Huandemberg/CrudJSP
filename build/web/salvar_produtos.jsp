<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="model.Produto" %>
<%@page import="controller.Controller" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                //Receber os dados do formulario
                Controller cn = new Controller();
                String nome, marca;
                double preco;
                nome = request.getParameter("nome");
                marca = request.getParameter("marca");
                preco = Double.parseDouble(request.getParameter("preco"));
                String forn = request.getParameter("forn");
                try {
                    cn.save(nome, marca, preco, forn);
                    response.sendRedirect("listpro.jsp");

                } catch (Exception x) {
                    String erro = x.getMessage();
                    if (erro.contains("<p>Duplicate entry</p>")) {

                    } else {
                        out.print("Erro: " + erro);
                    }
                }
            }

        %>
    </body>
</html>
