<%-- 
    Document   : informacao
    Created on : 27/02/2021, 00:35:35
    Author     : Paulo Sergio Debastiani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>cadastroAluno</title>
</head>
<body>


<div class="row">
    <div class="col-3 col-s-3 menu">
        <!--<ul>
            <li><a class="link" href="../Views/cadastroCafe.jsp">Cadastro Espaços Café</a></li>
            <li><a class="link" href="../Views/cadastroSala.jsp">Cadastro Salas</a></li>
            <li><a class="link" href="../Views/cadastroAluno.jsp">Cadastro Alunos</a></li>
            <li><a class="link" href="../Views/consultaCafe.jsp">Consulta Espaços Café</a></li>
            <li><a class="link" href="../Views/consultaSala.jsp">Consulta Salas</a></li>
            <li><a class="link" href="../Views/consultaAluno.jsp">Consulta Alunos</a></li>
        </ul>-->
    </div>

    <div class="col-6 col-s-9">
        </div>
            <p class="sucesso"><img src="imagens/sucesso.png" width="50px" height="50px"/> 
                <%
                    out.write(request.getParameter("msg"));
                    
                %>
            </p> 
        </div>  
    </div>

    <div class="col-3 col-s-12">
        <div class="aside">
            <h2>Instruções</h2>
            <p>Vamos lotar essas Salas de Treinamento? Cadastre os Alunos!</p>
            <p>O sistema irá vincular aleatoriamente as salas aos alunos cadastrados conforme 
                as regras estabelecidas, nas duas etapas previstas para o Treinamento!</p>
            <h2>Dúvidas?</h2>
            <p>Entre em contato pelo whatsapp (49)99966-0345</p>
        </div>
    </div>
</div>

<div class="footer">
    <script src="../Scripts/rodape.js"></script>
</div>

</body>
</html>
