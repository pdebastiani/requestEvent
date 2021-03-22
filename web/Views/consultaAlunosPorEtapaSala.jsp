<%-- 
    Document   : consultaAlunoPorEtapaSala
    Created on : 26/02/2021, 20:45:03
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Model.Sala"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="Model.Cafe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css">
    <title>consultaAluno</title>
</head>
<body>
    <%
        String etapa = request.getParameter("etapa");
        if (etapa == null) {
            etapa = "a";
        }
            
        Aluno aluno = new Aluno();
        ResultSet rs = aluno.consultar(etapa);
    %>

<div class="header">
    <h1>Treinamento 'X'</h1>
</div>

<div class="row">
    <div class="col-3 col-s-3 menu">    <!-- menu da esquerda da tela -->
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
        <h3>Consulta Alunos / Etapas / Salas</h3>
        <form action="../Views/consultaAlunosPorEtapaSala.jsp" method="POST" >
            <label for="etapa">Escolha a Etapa a consultar</label><br>
            <select id="etapa" name="etapa" required="true">
                <% if (etapa.equals("a")) {%>
                    <option selected value="a">1ª Etapa</option>
                    <option value="b">2ª Etapa</option>
                <%} else {%>
                    <option value="a">1ª Etapa</option>
                    <option selected value="b">2ª Etapa</option>
                <%}%>
            </select><br>
            <input type="submit" value="Consultar" /> 
        </form>
        <div>
            <table>
                <thead>
                    <% if (etapa.equals("a")) {%>
                        <p><b>1ª Etapa</b></p>
                    <%} else {%>
                        <p><b>2ª Etapa</b></p>
                    <%}%>
                    <th>Nome completo</th>
                    <th>Sala</th>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%out.write(rs.getString("nomeCompleto"));%></td>
                        <% if (etapa.equals("a")) { %>
                        <td><%out.write(rs.getString("etapa1"));%></td>
                        <%} else {%>
                            <td><%out.write(rs.getString("etapa2"));%></td>
                        <%}%>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="col-3 col-s-12">
        <div class="aside">
            <h2>Instruções</h2>
            <p>Consulta e lista os Alunos relacionando-os por Sala em cada Etapa do Treinamento.</p>
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
