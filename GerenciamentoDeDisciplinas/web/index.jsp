<%-- 
    Document   : index
    Created on : 04/10/2020, 06:35:24
    Author     : jrmac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.fatecpg.poo.Disciplina" %>
<%@page import="java.util.Set" %>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">

        <title>Gerenciador de Disciplinas - HOME</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/editor.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="narrow-jumbotron.css" rel="stylesheet">
        <%@include file="WEB-INF/jspf/css.jspf" %>
    </head>

    <body style="background-color: #E9ECEF;">

        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container">
            <div class="jumbotron">
                <h1 class="display-3">Gerenciamento de disciplinas</h1>
                <p class="lead">Aluno: Uilton Jose </br> Numero de disciplinas matriculadas: <%= Disciplina.getList().size() %> </p>
                <p><a class="btn btn-lg btn-success" href="disciplina.jsp" role="button" style="background-color: rgb(0, 123, 255);">Lista de Disciplinas</a></p>
            </div>
        </div>        

            <footer class="footer">

            </footer>

                <%@include file="WEB-INF/jspf/script.jspf" %>
    </body>
</html>
