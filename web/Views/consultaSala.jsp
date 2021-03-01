<%-- 
    Document   : consultaSala
    Created on : 28/02/2021, 20:33:39
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sala"%>
<%@page contentType="text/html charset-UTF-8" pageEncoding="UTF-8"%>
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
    
    Sala sala = new Sala();                         // recupera numa lista os Alunos
    List<Sala> salas = new ArrayList<>();
    salas = sala.consultar();
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
        <table class="container6">
            <thead>
                <th>Sala</th>
                <th>Lotacao</th>
                <th>Coffe</th>
                <th>Editar</th>
                <th>Excluir</th>
            </thead> 
            <tbody>
               <% Cafe cafe = new Cafe(); %>
               
               <% for (Sala s : salas) {%>
                    <tr>
                        <td><%out.write(s.getSala()) ;%></td>
                        <td><%out.write("" + s.getLotacao()) ;%></td>
                        <td><%out.write("" + s.getIdCafe()) ;%></td>
                        <td><%out.write("<a href=./cadastroEditaSala.jsp?id=" + s.getId() + ">Editar</a>");%></td>   
                        <td><%out.write("<a href=../Controller/excluirSala.jsp?id=" + s.getId() + ">Excluir</a>");%></td>   
                    </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    
</div>

<div class="footer">
    <script src="../Scripts/rodape.js"></script>
</div>

</body>
</html>
