<%-- 
    Document   : recebeDadosSala
    Created on : 26/02/2021, 23:14:21
    Author     : Paulo
--%>

<%@page import="Model.Sala"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Sala sala = new Sala();
    sala.setSala(request.getParameter("sala"));
    sala.setLotacao(Integer.parseInt(request.getParameter("lotacao")));
    sala.setIdCafe(Integer.parseInt(request.getParameter("idCafe")));
    
    String msg = "";
    if (sala.salvar()) {
        msg = "Registro Salvo com sucesso!";
    } else {
        msg = "Problemas ao salvar!";
    }
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    response.sendRedirect("../Views/cadastroSala.jsp?msg=" + msg);
%>
