<%-- 
    Document   : consultaSala
    Created on : 28/02/2021, 20:33:39
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Model.Cafe"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>consultaSala</title>
</head>
<body>
<%
    String msg = "";
    if (request.getParameter("msg") != null) {  //recupera a msg do Controller
        msg = request.getParameter("msg");
    }
         
    Sala sala = new Sala();                         // recupera num ResultSet os Alunos
    ResultSet rs = sala.consultarInner();
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
        <h3>Listagem das Salas de treinamento</h3>
        <% if (msg != "") {%>
                <p class="sucesso"><img src="../imagens/sucesso.png" width="50px" height="50px"/>
                    <% out.write(request.getParameter("msg")); %>
                </p> 
        <%} else {%>
            <table class="container6">
                <thead>
                    <th>Sala</th>
                    <th>Lotacao</th>
                    <th>Coffe</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </thead> 
                <tbody>
                    <% while (rs.next()) {%>
                        <tr>
                            <td><%out.write(rs.getString("sala"));%></td>
                            <td><%out.write(rs.getString("lotacao"));%></td>
                            <td><%out.write(rs.getString("cafe"));%></td>
                            <td><%out.write("<a href=./cadastroEditaSala.jsp?id=" + rs.getString("id") + ">Editar</a>");%></td>
                            <td><%out.write("<a href=../Controller/excluirSala.jsp?id=" + rs.getString("id") + ">Excluir</a>");%></td>
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
