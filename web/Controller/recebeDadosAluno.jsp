<%-- 
    Document   : recebeDadosAluno
    Created on : 27/02/2021, 08:52:01
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Sala"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Aluno"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Sala sala = new Sala();
    List<Sala> salas = new ArrayList<>();
    
    int idSala1 = 0;                                // recupera os dados das lotações das Salas e seus IDs
    int idSala2 = 0;
    int lotacaoSala1 = 0;
    int lotacaoSala2 = 0;
    salas = sala.consultar();                       
    if (!salas.isEmpty()) {  
        idSala1 = (salas.get(0).getId());
        idSala2 = (salas.get(1).getId());
        lotacaoSala1 = (salas.get(0).getLotacao());
        lotacaoSala2 = (salas.get(1).getLotacao());
    }
    
    Aluno contaAluno = new Aluno();
    List<Aluno> alunos = new ArrayList<>();

    int totalSala1 = 0;                             // Conta qtos Alunos tem em cada Sala
    int totalSala2 = 0;
    alunos = contaAluno.consultar();
    for (Aluno x : alunos) {
        if (x.getIdSala1() == idSala1) {
            totalSala1++;
        } else {
            totalSala2++;
        }
        /*if (x.getIdSala2() == idSala2) {
            totalSala2++;
        } else {
            totalSala1++;
        }*/
    }
    
    int vagasSala1 = (lotacaoSala1 - totalSala1);       // identifica os totais de vagas disponives por Sala 
    int vagasSala2 = (lotacaoSala2 - totalSala2);    
    
    int gravarIdSala1 = 0;                              // define qual sala sera gravada para cada Etapa
    int gravarIdSala2 = 0;
    String msg = "";
    if ((vagasSala1 + vagasSala2) > 0) {                
        if (vagasSala1 == 0) {
            gravarIdSala1 = idSala2;
            gravarIdSala2 = idSala2;
        } else if (vagasSala2 == 0) {
            gravarIdSala1 = idSala1;
            gravarIdSala2 = idSala1;
        } else if (((totalSala1 + totalSala2) % 2) == 0) {   // define se o total de alunos no momento é par ou ímpar
            gravarIdSala1 = idSala1;
            gravarIdSala2 = idSala2;
        } else {
            gravarIdSala1 = idSala2;
            gravarIdSala2 = idSala1;
        }
        
        Aluno aluno = new Aluno();                     // grava dados do Aluno no BD
        aluno.setNome(request.getParameter("nome"));
        aluno.setSobrenome(request.getParameter("sobrenome"));
        aluno.setIdSala1(gravarIdSala1);
        aluno.setIdSala2(gravarIdSala2);
        if (aluno.salvar()) {
            msg = "Aluno Salvo com sucesso!";
        } else {
            msg = "Problemas ao salvar Aluno!";
        }
    } else {
     msg = "Não há vagas suficiente para o Aluno!";
    }
    
    //response.sendRedirect("informacao.jsp?msg=" + msg);
    response.sendRedirect("../Views/cadastroAluno.jsp?msg=" + msg);
%>
