<%-- 
    Document   : consultaCafe
    Created on : 28/02/2021, 21:34:39
    Author     : Paulo Sergio Debastiani
--%>

<%@page import="Model.Cafe"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/estilos.css"> 
    <title>consultaCafe</title>
</head>
<body>
<%
    String msg = "";
    if (request.getParameter("msg") != null) {  //recupera a msg do Controller
        msg = request.getParameter("msg");
    }
    
    Cafe cafe = new Cafe();                         // recupera numa lista os Espaços para Café
    List<Cafe> cafes = new ArrayList<>();
    cafes = cafe.consultar();
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
        <h3>Listagem dos Espaços para Café</h3>
        <% if (msg != "") {%>
                <p class="sucesso"><img src="../imagens/sucesso.png" width="50px" height="50px"/>
                    <% out.write(request.getParameter("msg")); %>
                </p> 
        <%} else {%>
            <table class="container6">
                <thead>
                    <th>Cafe</th>
                    <th>Lotacao</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </thead> 
                <tbody>
                   <% for (Cafe c : cafes) {%>
                        <tr>
                            <td><%out.write(c.getCafe()) ;%></td>
                            <td><%out.write("" + c.getLotacao()) ;%></td>
                            <td><%out.write("<a href=./cadastroEditaCafe.jsp?id=" + c.getId() + ">Editar</a>");%></td>   
                            <td><%out.write("<a href=../Controller/excluirCafe.jsp?id=" + c.getId() + ">Excluir</a>");%></td>   
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
