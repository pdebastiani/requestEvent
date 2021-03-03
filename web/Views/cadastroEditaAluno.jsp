<%-- 
    Document   : cadastroAluno
    Created on : 26/02/2021, 23:20:01
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="Model.Sala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>cadastroEditaAluno</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Aluno aluno = new Aluno();
    if (id != 0) {                          // recupera opjeto Aluno
        aluno = aluno.consultar(id);    
    }      
    
    Sala sala = new Sala();
    List<Sala> salas = sala.consultar();  //carrega a lista das Salas disponíveis
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
        </ul>
    </div>

    <div class="col-6 col-s-9">
        <h2>Cadastro dos Alunos</h2>
        
        <form action="../Controller/recebeEditaDadosAluno.jsp" method="POST">
            <label for="nome">*Nome SEM o sobrenome</label><br>
            <input type="hidden" id="id" name="id" value="<%out.write("" + aluno.getId());%>">
            <input type="text" id="nome" name="nome" value="<%out.write(aluno.getNome());%>"
                   maxlength="50" ><br>
            <label for="sobrenome">*Sobrenome</label><br>
            <input type="text" id="sobrenome" name="sobrenome" value="<%out.write(aluno.getSobrenome());%>"
                   maxlength="50" ><br>
            <label for="idSala1">*Sala 1ª etapa</label><br>
            <select id="idSala1" name="idSala1" required="true">
                <% for (Sala s : salas) { %>
                    <% if (s.getId() == aluno.getIdSala1()) {%>
                        <option selected value="<%out.write("" + s.getId());%>">
                            <%out.write(s.getSala());%></option>
                    <% } else { %>
                        <option value="<%out.write("" + s.getId());%>">
                            <%out.write(s.getSala());%></option>
                    <%}%>
                <%}%>
            </select><br> 
            <label for="idSala2">*Sala 2ª etapa</label><br>
            <select id="idSala2" name="idSala2" required="true">
                <% for (Sala s : salas) { %>
                    <% if (s.getId() == aluno.getIdSala2()) {%>
                        <option selected value="<%out.write("" + s.getId());%>">
                            <%out.write(s.getSala());%></option>
                    <% } else { %>
                        <option value="<%out.write("" + s.getId());%>">
                            <%out.write(s.getSala());%></option>
                    <%}%>
                <%}%>
            </select><br> 
            <input type="button" value="Alterar" onclick="validaDados()"/> &nbsp;
            <input type="reset" value="Reset" /><br>
        </form> 
    </div>

    <div class="col-3 col-s-12">
        <div class="aside">
            <h2>Instruções</h2>
            <p>Vamos lotar essas Salas de Treinamento? Cadastre os Alunos!</p>
            <p style="color: black;">Ao Salvar, <b>automaticamente</b> será vinculado 
                as salas aos alunos cadastrados conforme as regras estabelecidas, 
                para as duas etapas previstas do Treinamento!</p>
            <h2>Dúvidas?</h2>
            <p>Entre em contato pelo whatsapp (49)99966-0345</p>
        </div>
    </div>
</div>

<div class="footer">
    <script src="../Scripts/rodape.js"></script>
</div>

<script>
    function validaDados() {                           // identifica se Nome ou Sobrenome foram informados
        let nome = document.getElementById("nome");     
        let sobrenome = document.getElementById("sobrenome");
        if (nome.value == "" || sobrenome.value == "") {
            alert("Nome não informado ou incompleto!");
            nome.focus();
            exit;
        }
        let nomeStr = nome.value;                       // identifica sobrenome já contido no nome e interage com o usuario
        let sobrenomeStr = sobrenome.value;             // para confirmar ou corrigir a informação
        let posicao = nomeStr.indexOf(sobrenomeStr);    
        if (posicao !== -1) {                           // se -1 não encontrou nada
            let resposta = confirm("Sobrenome contido no Nome ---> " + nomeStr + " " + sobrenomeStr);
            if (resposta !== true) {                    
                let nomeSemSobrenome = nomeStr.slice(0,posicao-1);
                document.getElementById("nome").value = nomeSemSobrenome;
                nome.focus();
                exit;
            }
        }
       
        document.forms[0].submit();
    }
</script>

</body>
</html>
