<%-- 
    Document   : cadastroEditaCafe
    Created on : 28/02/2021, 21:21:08
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>cadastroEditaCafe</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Cafe cafe = new Cafe();
    if (id != 0) {                                  // recupera objeto Cafe
        cafe = cafe.consultar(id);
    }
%>
<div class="header">
    <h1>Treinamento 'X'</h1>
</div>

<div class="row">
    <div class="col-3 col-s-3 menu">
        <ul>
            <li><a class="link" href="../Views/cadastroCafe.jsp">Cadastro Espaços Café</a></li>
            <li><a class="link" href="../Views/cadastroSala.jsp">Cadastro Salas</a></li>
            <li><a class="link" href="../Views/cadastroAluno.jsp">Cadastro Alunos</a></li>
            <li><a class="link" href="../Views/consultaCafe.jsp">Consulta Espaços Café</a></li>
            <li><a class="link" href="../Views/consultaSala.jsp">Consulta Salas</a></li>
            <li><a class="link" href="../Views/consultaAluno.jsp">Consulta Alunos</a></li>
            <li><a class="link" href="../Views/consultaAlunosPorEtapaSala.jsp">Consulta Alunos / Sala</a></li>
        </ul>
    </div>

    <div class="col-6 col-s-9">
        <h2>Cadastro Espaços Cafés</h2>
        <form action="../Controller/recebeEditaDadosCafe.jsp" method="POST">
            <label for="cafe">*Nome do Espaço do Café</label><br>
            <input type="hidden" id="id" name="id" value="<%out.write(""+cafe.getId());%>">
            <input type="text" id="cafe" name="cafe" value="<%out.write(cafe.getCafe());%>"
                   maxlength="30" ><br>
            <label for="lotacao">*Lotação</label><br>
            <input type="number" id="lotacao" name="lotacao" value="<%out.write(""+cafe.getLotacao());%>" ><br>
            <input type="button" value="Alterar" onclick="validaDados()" /> &nbsp;
            <input type="reset" value="Reset" /><br>
        </form> 
    </div>

    <div class="col-3 col-s-12">
        <div class="aside">
            <h2>Instruções</h2>
            <p>Cadastre dois (2) Espaços de Cafés</p>
            <h2>Dúvidas?</h2>
            <p>Entre em contato pelo whatsapp (49)99966-0345</p>
        </div>
    </div>
</div>

<div class="footer">
    <script src="../Scripts/rodape.js"></script>
</div>

<script>
    function validaDados() {
        let cafe = document.getElementById("cafe");
        if (cafe.value == "") {
            alert("Informe o nome do Espaço do Café!");
            cafe.focus();
            exit;
        }
        let lotacao = document.getElementById("lotacao");
        if (lotacao.value < 1) {
            alert("lotação deve ser maior que Zero");
            lotacao.focus();
            exit;
        }
        document.forms[0].submit();
    }
</script>    
</body>
</html>
