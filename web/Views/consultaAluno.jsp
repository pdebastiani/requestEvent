<%-- 
    Document   : consultaAluno
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
    String msg = "";
    if (request.getParameter("msg") != null) {  //recupera a msg do Controller
        msg = request.getParameter("msg");
    }
    
    Aluno aluno = new Aluno();                  // recupera num ResultSet os Alunos
    ResultSet rs = aluno.consultarInner();
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

    <div class="col-9 col-s-9">     
        <h3>Listagem dos Alunos</h3>
        <% if (msg != "") {%>
        <p class="sucesso"><img src="../imagens/sucesso.png" width="50px" height="50px"/>
                    <% out.write(request.getParameter("msg")); %>
                </p> 
        <%} else {%>
            <table class="container6">
                <thead>
                    <th>Nome Completo</th>
                    <th>Etapa 1</th>
                    <th>Etapa 2</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </thead> 
                <tbody>
                   <% while (rs.next()) {%>
                        <tr>
                            <td><%out.write(rs.getString("nomeCompleto"));%></td>
                            <td><%out.write(rs.getString("etapa1ComCafe"));%></td>
                            <td><%out.write(rs.getString("etapa2ComCafe"));%></td>
                            <td><%out.write("<a href=./cadastroEditaAluno.jsp?id=" + 
                                    rs.getString("id") + ">Editar</a>");%></td>   
                            <td><%out.write("<a href=../Controller/excluirAluno.jsp?id=" + 
                                    rs.getString("id") + ">Excluir</a>");%></td>  
                        </tr>
                    <%}%>
                </tbody>
            </table>
        <%}%>
    </div>
    
</div>

<div class="footer">
    <script src="../Scripts/rodape.js"></script>
</div>

</body>
</html>
