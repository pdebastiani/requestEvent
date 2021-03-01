<%-- 
    Document   : recebeDadosSala
    Created on : 27/02/2021, 08:52:01
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Sala"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Sala sala = new Sala();
    sala.setId(Integer.parseInt(request.getParameter("id")));
    sala.setSala(request.getParameter("sala"));
    sala.setLotacao(Integer.parseInt(request.getParameter("lotacao")));
    sala.setIdCafe(Integer.parseInt(request.getParameter("idCafe")));
    String msg = "";
    if (sala.alterar()) {
        msg = "Sala Alterada com sucesso!";
    } else {
        msg = "Problemas ao alterar Sala!";
    }
    
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    response.sendRedirect("../Views/cadastroEditaSala.jsp?msg=" + msg);
%>
