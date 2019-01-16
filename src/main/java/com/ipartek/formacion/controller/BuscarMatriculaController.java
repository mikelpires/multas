package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;
import com.ipartek.formacion.modelo.pojo.Alerta;

@WebServlet("/buscar")
public class BuscarMatriculaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MatriculaDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = MatriculaDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String matricula = request.getParameter("matricula");

		if (dao.getByMatricula(matricula) == null) {
			Alerta alerta = new Alerta("danger", "La matricula introducida no existe");
			request.setAttribute("alerta", alerta);
			request.getRequestDispatcher("privado/buscar.jsp").forward(request, response);
		} else {
			request.setAttribute("coche", dao.getByMatricula(matricula));
			request.getRequestDispatcher("privado/multar.jsp").forward(request, response);
		}
	}

}
