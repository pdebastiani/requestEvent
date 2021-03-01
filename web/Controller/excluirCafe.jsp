<%-- 
    Document   : excluirCafe
    Created on : 28/02/2021, 20:57:26
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    if (id != 0) {
        Cafe cafe = new Cafe();
        cafe = cafe.consultar(id);
        if (cafe != null) {
            String msg = "";
            if (cafe.excluir()) {
                msg = "Espaço Café excluido com sucesso!";
            } else {
                msg = "Problemas ao excluir Espaço Café!";
            }
            response.sendRedirect("../Views/consultaCafe.jsp?msg=" + msg);
        }
    }
%>

