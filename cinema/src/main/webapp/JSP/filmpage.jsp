<%-- 
    Document   : film
    Created on : Apr 19, 2018, 6:54:49 PM
    Author     : matteo
--%>
<%@page import="it.unitn.disi.cinema.dataaccess.Beans.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page import="java.util.StringTokenizer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--Associo il film a quello passato via url
<%! Film film; %>
<% for( Film flm:films){
	
}%>--%>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"  crossorigin="anonymous">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cinema.css">

        <title>Film</title>
    </head>
	
    <body>
    <div class="header container">
        <div class="row">
            <div class="col-6">
                <h1 class="text-center"><b>Film page</b></h1> 
            </div>
            <div class="col-6">
                <c:choose>
                    <c:when test="${sessionScope.email != null}">
                        <c:set var="emailParts" value="${fn:split(sessionScope.email, '@')}" />
                        <h3>Welcome ${emailParts[0]} <b>(${sessionScope.ruolo})</b></h3>
                        <h4>You are logged in</h4>

                        <form class="form-signin" action="/cinema/logout.do" method="POST">
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Logout</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form class="form-signin" action="/cinema/login.do" method="GET">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                    </c:otherwise>      
                </c:choose>
            </div>
        </div>
    </div>

    <div class="container">
		<div class="row">
			<div class="col-12">
				<h2><b>${filmRichiesto.getFilm().getTitolo()}</b></h2>
				<p><b>Genere:</b> ${filmRichiesto.getGenere().getDescrizione()}</p>
				<p><b>Durata:</b> ${filmRichiesto.getFilm().getDurata()} </p>
				<p><b>Trama:</b> ${filmRichiesto.getFilm().getTrama()}</p>
				<div class="videoWrapper">
					<iframe width="420" height="315" src="${filmRichiesto.getFilm().getUrlTrailer()}" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>	
		</div>
        
    </div>
				<br />
				<footer class="container">
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<p><a href="${pageContext.request.contextPath}/JSP/infopage.jsp">Info:</a></p>
						<p><b>Telefono:</b> +39 0123 123123</p>
						<p><b>Indirizzo:</b> Via La Vita E Tutto Quanto, 42 (UNIVERSO)</p>
						<p><b>Partita Iva: </b>01234561001<b> – C.F. </b>01234561001</p>

					</div>
					<div class="col-lg-6 col-md-12">
						<br />
						<p>Posted by: Magic Group Srl</p>
						<p>Contact information: <a href="mailto:info@magicgroup.com">info@magicgroup.com</a>.</p>
					</div>
						
				</div>
				<p class="copyright">Copyright © 2018 · Tadiello Matteo - Stefani Domenico - Martini Ivan · all rights reserved.</p>
			</footer>
		

    </body>
</html>
