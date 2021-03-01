<%-- 
    Document   : cadastroCafe
    Created on : 26/02/2021, 20:26:37
    Author     : Paulo Sergio Debastiani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Styles/estilos.css"> 
    <title>index</title>
</head>
<body>

<div class="header">
    <h1>Treinamento 'X'</h1>
</div>

<div class="row">
    <div class="col-3 col-s-3 menu">        <!-- menu da esquerda da tela -->
        <ul>
            <li><a class="link" href="./Views/cadastroCafe.jsp">Cadastro Espaços Café</a></li>
            <li><a class="link" href="./Views/cadastroSala.jsp">Cadastro Salas</a></li>
            <li><a class="link" href="./Views/cadastroAluno.jsp">Cadastro Alunos</a></li>
            <li><a class="link" href="./Views/consultaCafe.jsp">Consulta Espaços Café</a></li>
            <li><a class="link" href="./Views/consultaSala.jsp">Consulta Salas</a></li>
            <li><a class="link" href="./Views/consultaAluno.jsp">Consulta Alunos</a></li>
        </ul>
    </div>

    <div class="col-6 col-s-9">     <!-- coluna central da tela -->
        <h1>Siga as instruções do menu ao lado!</h1>
    </div>

    <div class="col-3 col-s-12">    <!-- menu de instruções a direita da tela -->
        <div class="aside">
            <h2>Instruções</h2>
            <p>Para começar siga a ordem do Menu</p>
            <h2>Como?</h2>
            <p>Cadastre primeiramente (2) Espaços de Cafés, (2) Salas e os (n) Alunos</p>
            <h2>Dúvidas?</h2>
            <p>Entre em contato pelo whatsapp (49)99966-0345</p>
        </div>
    </div>
</div>

<div class="footer">
    <script src="Scripts/rodape.js"></script>
</div>

</body>
</html>