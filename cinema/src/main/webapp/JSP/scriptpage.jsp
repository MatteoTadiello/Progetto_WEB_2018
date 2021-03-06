<%--
 * Cinema Universe - Reservation System
 * Copyright (C) 2018 Domenico Stefani, Ivan Martini, Matteo Tadiello
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * See <http://www.gnu.org/licenses/>.
--%>
<%-- 
    Document   : loginpage
    Created on : 26-mar-2018, 18.25.31
    Author     : domenico
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Cinema Start Script</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Latest compiled and minified CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"  crossorigin="anonymous">


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Custom styles for this template -->
  </head>
  <body class="collage">
    <div class="header container">
      <br><br>
      <div class="row">
        <div class="col-12">
          <h1 class="text-center"><b>Start Script</b></h1> 
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <div class="container-fluid">
          <form  class="signin" action="/cinema/startup.do" method="POST">
            <br>
            <label>Durata Programmazione(minuti) - (1-200)</label>
            <input type="number" id="durata" name="durata" class="form-control" placeholder="Durata (minuti)" min="1" max="200" required autofocus>
            <br/>
            <label>Numero Proiezioni per film - (1-20)</label>
            <input type="number" id="proiezioni" name="proiezioni" class="form-control" placeholder="Proiezioni" value="10" min="1" max="20" required autofocus>
            <br/>
            <div class="form-check my-3">
              <input class="form-check-input" type="checkbox" value="" id="random-check" name="random-check">
              <label class="form-check-label" for="random-check">
                Impostazione random sale
              </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Start</button>
          </form>
        </div> 
      </div>
      <div class="col-md-4"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
  </body>
</html>
