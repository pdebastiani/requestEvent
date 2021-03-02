<%-- 
    Document   : recebeDadosAluno
    Created on : 27/02/2021, 08:52:01
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Sala"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Aluno"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Aluno aluno = new Aluno();
    aluno.setId(Integer.parseInt(request.getParameter("id")));
    aluno.setNome(request.getParameter("nome"));
    aluno.setSobrenome(request.getParameter("sobrenome"));
    aluno.setIdSala1(Integer.parseInt(request.getParameter("idSala1")));
    aluno.setIdSala2(Integer.parseInt(request.getParameter("idSala2")));
    String msg = "";
    if (aluno.alterar()) {
        msg = "Aluno Alterado com sucesso!";
    } else {
        msg = "Problemas ao alterar Aluno!";
    }
    
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    //response.sendRedirect("../Views/cadastroEditaAluno.jsp?msg=" + msg);
    response.sendRedirect("../Views/consultaAluno.jsp?msg=" + msg);
%>
