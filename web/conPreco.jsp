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
        <title>Consulta de produt</title>
        <link rel="stylesheet" href="styles/tabela.css"/>
    </head>
    <body>
        <%
            Double n;
            n = Double.parseDouble(request.getParameter("preco"));
            Controller cn = new Controller();
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                try {

                    ResultSet rs = cn.listPreco(n);
        %>
        <table>
            <tr>
                <th>Código</th><th>Nome</th><th>Marca</th><th>Fornecedor</th><th>Preço</th><th>Exclusão</th><th>Alterar</th>
            </tr>

            <%
                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("marca")%></td>
                <td><%= rs.getString("nome_fornecedor")%></td>
                <td><%= rs.getString("preco")%></td>
                <td><a href="excpro.jsp?codigo=<%= rs.getString("codigo")%>"><button id="excluir" class="tooltip">
                            <svg width="20px" height="20px" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M17.381 37.238L14.381 56.238H50.381L47.381 37.239" stroke="#BB0A1E" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M14.256 37.238H50.506C51.0033 37.238 51.4802 37.0405 51.8318 36.6889C52.1834 36.3372 52.381 35.8603 52.381 35.363V29.113C52.3811 28.8668 52.3327 28.6229 52.2385 28.3953C52.1443 28.1678 52.0062 27.9611 51.8321 27.7869C51.658 27.6128 51.4512 27.4747 51.2237 27.3805C50.9961 27.2863 50.7522 27.2379 50.506 27.238H39.256C38.7588 27.2378 38.282 27.0401 37.9305 26.6886C37.5789 26.337 37.3812 25.8602 37.381 25.363V10.113C37.381 9.61576 37.1834 9.13884 36.8318 8.78721C36.4802 8.43558 36.0033 8.23804 35.506 8.23804H29.256C28.7587 8.23804 28.2818 8.43558 27.9302 8.78721C27.5785 9.13884 27.381 9.61576 27.381 10.113V25.363C27.3807 25.8602 27.1831 26.337 26.8315 26.6886C26.4799 27.0401 26.0032 27.2378 25.506 27.238H14.256C14.0097 27.2379 13.7658 27.2863 13.5383 27.3805C13.3108 27.4747 13.104 27.6128 12.9299 27.7869C12.7557 27.9611 12.6176 28.1678 12.5234 28.3953C12.4293 28.6229 12.3809 28.8668 12.381 29.113V35.363C12.381 35.8603 12.5785 36.3372 12.9302 36.6889C13.2818 37.0405 13.7587 37.238 14.256 37.238V37.238Z" stroke="#FFFFFF" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <span class="tooltiptext">Excluir</span>
                        </button></a></td>
                <td><a href="carregaprod.jsp?codigo=<%= rs.getString("codigo")%>"><button class="tooltip"><svg width="20px" height="20px" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M37.892 10.114L10.751 37.256L7.57499 53.139C7.49124 53.5569 7.51323 53.9892 7.63897 54.3966C7.76472 54.8039 7.99023 55.1733 8.29502 55.4714C8.59982 55.7694 8.97423 55.9866 9.38427 56.1032C9.79432 56.2198 10.227 56.2321 10.643 56.139L27.143 52.45L53.681 25.906C54.2643 25.3227 54.727 24.6303 55.0427 23.8682C55.3583 23.1061 55.5208 22.2893 55.5208 21.4645C55.5208 20.6396 55.3583 19.8228 55.0427 19.0607C54.727 18.2986 54.2643 17.6062 53.681 17.023L46.772 10.114C45.5942 8.93686 43.9972 8.27563 42.332 8.27563C40.6668 8.27563 39.0698 8.93686 37.892 10.114V10.114Z" stroke="#BB0A1E" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <span class="tooltiptext">Alterar</span></button></a></td>
            </tr>

            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print(x.getMessage());
            }
}
        %>
    </body>
</html>
