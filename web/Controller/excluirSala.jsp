<%-- 
    Document   : excluirSala
    Created on : 28/02/2021, 20:57:08
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Sala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    if (id != 0) {
        Sala sala = new Sala();
        sala = sala.consultar(id);
        if (sala != null) {
            String msg = "";
            if (sala.excluir()) {
                msg = "Sala excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Sala!";
            }
            response.sendRedirect("../Views/consultaSala.jsp?msg=" + msg);
        }
    }
%>

