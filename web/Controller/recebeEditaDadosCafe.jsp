<%-- 
    Document   : recebeEditaDadosCAfe
    Created on : 27/02/2021, 08:52:01
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Cafe cafe = new Cafe();
    cafe.setId(Integer.parseInt(request.getParameter("id")));
    cafe.setCafe(request.getParameter("cafe"));
    cafe.setLotacao(Integer.parseInt(request.getParameter("lotacao")));
    String msg = "";
    if (cafe.alterar()) {
        msg = "Café Alterado com sucesso!";
    } else {
        msg = "Problemas ao alterar Café!";
    }
    
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    //response.sendRedirect("../Views/cadastroEditaCafe.jsp?msg=" + msg);
    response.sendRedirect("../Views/consultaCafe.jsp?msg=" + msg);    
%>
