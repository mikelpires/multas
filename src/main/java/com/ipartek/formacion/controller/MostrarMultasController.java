package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;

@WebServlet("/listado")
public class MostrarMultasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MatriculaDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = MatriculaDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idAgente = request.getParameter("idAgente");

		int id = Integer.parseInt(idAgente);
		// HttpSession session = request.getSession();
//		session.getAttribute("agente");
		request.setAttribute("multas", dao.getAll(id));
		request.getRequestDispatcher("privado/listadoMultas.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
