<%-- 
    Document   : recebeDadosCafe
    Created on : 26/02/2021, 22:58:35
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Cafe cafe = new Cafe();
    cafe.setCafe(request.getParameter("cafe"));
    cafe.setLotacao(Integer.parseInt(request.getParameter("lotacao")));
    
    String msg = "";
    if (cafe.salvar()) {
        msg = "Registro Salvo com sucesso!";
    } else {
        msg = "Problemas ao salvar!";
    }
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    response.sendRedirect("../Views/cadastroCafe.jsp?msg=" + msg);
%>