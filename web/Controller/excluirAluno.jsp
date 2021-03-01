<%-- 
    Document   : excluirAluno
    Created on : 28/02/2021, 20:15:00
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    if (id != 0) {
        Aluno aluno = new Aluno();
        aluno = aluno.consultar(id);
        if (aluno != null) {
            String msg = "";
            if (aluno.excluir()) {
                msg = "Aluno excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Aluno!";
            }
            response.sendRedirect("../Views/consultaAluno.jsp?msg=" + msg);
        }
    }
%>
 