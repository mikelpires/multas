package com.ipartek.formacion.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;
import com.ipartek.formacion.modelo.pojo.Alerta;

@WebServlet("/anular")
public class AnularController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MatriculaDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = MatriculaDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String opcion = request.getParameter("opcion");
		String idAgenteStr = request.getParameter("idAgente");
		String idMultaStr = request.getParameter("idMulta");

		try {
			int idAgente = Integer.parseInt(idAgenteStr);
			if (opcion.equals("listar")) {
				request.setAttribute("anuladas", dao.getAnuladas(idAgente));
				request.getRequestDispatcher("privado/listadoAnuladas.jsp").forward(request, response);
			}
			int idMulta = Integer.parseInt(idMultaStr);
			if (opcion.equals("habilitar")) {
				if (dao.habilitar(idMulta) == true) {
					Alerta alerta = new Alerta("success", "Multa habilitada con exito");
					request.setAttribute("anuladas", dao.getAnuladas(idAgente));
					request.setAttribute("alerta", alerta);
					request.getRequestDispatcher("privado/listadoAnuladas.jsp").forward(request, response);
				}
			}
			if (opcion.equals("anular")) {
				if (dao.anular(idMulta) == true) {

					Alerta alerta = new Alerta("success", "Multa anulada con exito");
					request.setAttribute("anuladas", dao.getAnuladas(idAgente));
					request.setAttribute("alerta", alerta);
					request.getRequestDispatcher("privado/listadoAnuladas.jsp").forward(request, response);
				}
			}
		} catch (SQLException e) {
			Alerta alerta = new Alerta("danger", "Ha habido un error inesperado");
			request.setAttribute("alerta", alerta);
			request.getRequestDispatcher("privado/index.jsp").forward(request, response);
		}
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
