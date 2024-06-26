<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="controller.Controller" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/cadastro.css"/>
        <title>Carregar</title>
    </head>
    <body>
        <%
            int cod = Integer.parseInt(request.getParameter("codigo"));
            Controller cn = new Controller();
            try {
               
                ResultSet rs = cn.listId(cod);
                if(!rs.next()){
                    out.print("Este produto não foi encontrado!");
                } else{
        %>
        <form id="form" method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= rs.getString("codigo") %>" readonly>
            </p>

            <p>
                <label for="nome">Nome do produto:</label>
                <input type="text" name="nome" id="nome" size="70" maxlength="50" value="<%= rs.getString("nome") %>" >
            </p>

            <p>
                <label for="marca">Marca:</label>
                <input type="text" name="marca" id="marca" maxlength="50" value="<%= rs.getString("marca") %>">
            </p>

            <p>
                <label for="preco">Preço:</label>
                <input type="number" step="0.1" name="preco" id="preco" value="<%= rs.getString("preco") %>">
            </p>

            <p>
                <input type="submit" value="Salvar">
            </p>

        </form>
        <%
               }
            }catch(Exception x){
                String erro = x.getMessage();
                out.print("Erro: " + erro);
            }
            
        %>
    </body>
</html>
