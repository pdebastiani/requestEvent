<%-- 
    Document   : cadastroCafe
    Created on : 26/02/2021, 20:26:37
    Author     : Paulo Sergio Debastiani
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>cadastroCafe</title>
</head>
<body>
<%
    String msg = "";
    if (request.getParameter("msg") != null) {      // recupera msg do Controller
        msg = request.getParameter("msg");
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
        <form action="../Controller/recebeDadosCafe.jsp" method="POST">
            <label for="cafe">*Nome do Espaço do Café</label><br>
            <input type="text" id="cafe" name="cafe" required="true"
                   maxlength="30" onchange="javascript:this.value=this.value.toUpperCase();"><br>
            <label for="lotacao">*Lotação</label><br>
            <input type="number" id="lotacao" name="lotacao" required="true"><br>
            <input type="button" value="Salvar" onclick="validaDados()" /> &nbsp;
            <input type="reset" value="Limpar" /><br>
            <label><%out.write(msg);%></label> 
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