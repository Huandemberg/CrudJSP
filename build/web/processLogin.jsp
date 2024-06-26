<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processando Login</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("username");
            String senha = request.getParameter("password");
            if (usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()
                    && usuario.equals("admin") && senha.equals("admin") ) {
                session.setAttribute("usuario", usuario);
                response.sendRedirect("listpro.jsp");

            } else {
                response.sendRedirect("login.jsp");
            } 
        %>
    </body>
</html>
