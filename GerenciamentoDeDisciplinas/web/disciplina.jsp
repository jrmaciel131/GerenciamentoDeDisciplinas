<%-- 
    Document   : listaDeDisciplina
    Created on : 04/10/2020, 06:40:07
    Author     : jrmac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.fatecpg.poo.Disciplina" %>
<%@page import="web.DbListener"%>
<!DOCTYPE html>
<%
    String exceptionMsg = null;

    if (request.getParameter("cancelar") != null) {
        response.sendRedirect(request.getRequestURI());
    }
    if (request.getParameter("formInsert") != null) {
        try {
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            Double nota = Double.parseDouble(request.getParameter("nota"));
            if (nota >= 0 && nota <= 10) {
                Disciplina.insert(nome, ementa, ciclo, nota);
                response.sendRedirect(request.getRequestURI());
            } else {
                exceptionMsg = "Nota invalida, Apenas valores de 0 a 10 são permitidos";
            }

        } catch (Exception e) {
            exceptionMsg = e.getLocalizedMessage();
        }
    }

    if (request.getParameter("formUpdate") != null) {
        try {
            String nome = request.getParameter("nome");
            String nomeAntigo = request.getParameter("nomeAntigo");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            Double nota = Double.parseDouble(request.getParameter("nota"));
            if (nota >= 0 && nota <= 10) {
                Disciplina.update(nomeAntigo, nome, ementa, ciclo, nota);
                response.sendRedirect(request.getRequestURI());
            } else {
                exceptionMsg = "Nota invalida, Apenas valores de 0 a 10 são permitidos";
            }
        } catch (Exception e) {
            exceptionMsg = e.getLocalizedMessage();
        }
    }

    if (request.getParameter("formDelete") != null) {
        try {
            String nome = request.getParameter("nome");
            Disciplina.delete(nome);

            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            exceptionMsg = e.getLocalizedMessage();
        }
    }
%>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciador de Disciplinas - Table</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
    </head>
    <body style="background-color: #E9ECEF;">
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <%if (request.getParameter("prepareInsert") != null) {%>
        <h3>Inserir registros</h3>
        <form>
            Nome: <input type="text" name="nome"/>
            Ementa: <input type="text" name="ementa"/>
            Ciclo: <input type="text" name="ciclo"/>
            Nota: <input type="text" name="nota"/>
            <input type="submit" name="formInsert" value="inserir">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else if (request.getParameter("prepareUpdate") != null) { %>
        <h3>Alterar registros</h3>
        <form>
            <% String nome = request.getParameter("nome");
                String ementa = request.getParameter("ementa");
                String ciclo = request.getParameter("ciclo");
                String nota = request.getParameter("nota");
            %>
            <input type="hidden" name="nomeAntigo" value="<%= nome%>"/>
            Nome: <input type="text" name="nome" value="<%= nome%>"/>
            Ementa:<input type="text" name="ementa" value="<%= ementa%>" />
            Ciclo: <input type="text" name="ciclo" value="<%= ciclo%>"/>
            Nota:  <input type="text" name="nota" value="<%= nota%>"/>
            <input type="submit" name="formUpdate" value="inserir">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else if (request.getParameter("prepareDelete") != null) { %>
        <form>
            <% String nome = request.getParameter("nome");%>
            <input type="hidden" name="nome" value="<%= nome%>"/>
            Excluir o registro <b><%= nome%></b>?
            <input type="submit" name="formDelete" value="excluir">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else {%>
        <form method="post">
            <input type="submit" name="prepareInsert" value="inserir"/>
            <% if (exceptionMsg != null) {
            %><Div style="color: red"><%= exceptionMsg%></div><%
                }
                %>
        </form>
        <%}%>

        <h3>Lista</h3>
        <table class="table" border="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Comandos</th>
            </tr>
            <%for (Disciplina c : Disciplina.getList()) {%>
            <tr>
                <td><%= c.getNome()%></td>
                <td><%= c.getEmenta()%></td>
                <td><%= c.getCiclo()%></td>
                <td><%= c.getNota()%></td>
                <td>
                    <form>
                        <input type="hidden" name="nome" value="<%= c.getNome()%>"/>
                        <input type="hidden" name="ementa" value="<%= c.getEmenta()%>"/>
                        <input type="hidden" name="ciclo" value="<%= c.getCiclo()%>"/>
                        <input type="hidden" name="nota" value="<%= c.getNota()%>"/>
                        <input type="submit" name="prepareUpdate" value="Alterar"/>
                        <input type="submit" name="prepareDelete" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>

        <%@include file="WEB-INF/jspf/script.jspf" %>
    </body>
</html>
