/*
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
 */
package it.unitn.disi.cinema.servlets;

import it.unitn.disi.cinema.dataaccess.Beans.Posto;
import it.unitn.disi.cinema.dataaccess.DAO.DAOFactory;
import it.unitn.disi.cinema.dataaccess.DAO.PostoDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author domenico
 */
public class AddRemovePosti extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PostoDAO psd = DAOFactory.getPostoDAO();

        String idReq_str = request.getPathInfo();
        if (idReq_str == null) {
            request.setAttribute("errorcode", "404");
            request.getRequestDispatcher("/JSP/errorpage.jsp").forward(request, response);
        }
        idReq_str = idReq_str.substring(1);
        if (idReq_str.equals("")) {
            request.setAttribute("errorcode", "404");
            request.getRequestDispatcher("/JSP/errorpage.jsp").forward(request, response);
        }

        Integer idReq = null;
        try {
            idReq = Integer.parseInt(idReq_str);
            if (idReq <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException nfe) {
            request.setAttribute("errorcode", "400");
            request.getRequestDispatcher("/JSP/errorpage.jsp").forward(request, response);
        }

        try {
            Posto posto = psd.getPostoById(idReq);
            if (posto != null) {

                String pieces[] = request.getRequestURI().split("/");

                if (pieces[pieces.length - 2].equals("add")) {

                    psd.setAvailability(posto.getId(), Boolean.TRUE);

                    Integer salaid = posto.getSalaId();
                    response.sendRedirect("/cinema/admin/modificasala/" + salaid.toString());
                } else if (pieces[pieces.length - 2].equals("remove")) {

                    psd.setAvailability(posto.getId(), Boolean.FALSE);

                    Integer salaid = posto.getSalaId();
                    response.sendRedirect("/cinema/admin/modificasala/" + salaid.toString());
                }
            }
        } catch (SQLException ex) {
            System.err.println("ERRORE! Impossibile ottenere la sala richiesta");
            request.setAttribute("errorcode", "400");
            request.getRequestDispatcher("/JSP/errorpage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
