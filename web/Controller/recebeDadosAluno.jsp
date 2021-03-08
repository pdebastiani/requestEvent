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
    }
        
    int vagasSala1 = (lotacaoSala1 - totalSala1);       // identifica os totais de vagas disponives por Sala 
    int vagasSala2 = (lotacaoSala2 - totalSala2); 
    int totalAlunos = (totalSala1 + totalSala2);
    
    int idSala1Etapa1 = 0;                              
    String msg = "";
    if ((vagasSala1 + vagasSala2) > 0) {                // Verifica se tem vagas
        if ((totalAlunos % 2) == 0) {                   // define qual Sala será atribuida para Etapa 1
            idSala1Etapa1 = idSala1;
        } else {
            idSala1Etapa1 = idSala2;
        }
        
        int idSala2Etapa2 = 0;
        boolean escolhaDaSala = false;
        for (int i = 1; i < totalAlunos; i+=2) {        // define qual Sala será atribuida para Etapa 2
            escolhaDaSala = (!escolhaDaSala);
        }
        if (escolhaDaSala) {
            idSala2Etapa2 = idSala2;
        } else {
            idSala2Etapa2 = idSala1;
        }
        
        Aluno aluno = new Aluno();                     // grava dados do Aluno no BD
        aluno.setNome(request.getParameter("nome"));
        aluno.setSobrenome(request.getParameter("sobrenome"));
        aluno.setIdSala1(idSala1Etapa1);
        aluno.setIdSala2(idSala2Etapa2);
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
