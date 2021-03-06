package com.ipartek.formacion.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.apache.log4j.Logger;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;
import com.ipartek.formacion.modelo.pojo.Alerta;
import com.ipartek.formacion.modelo.pojo.Coche;
import com.ipartek.formacion.modelo.pojo.Multa;

@WebServlet("/formularioMulta")
public class FormularioMultaController extends HttpServlet {
	private final static Logger LOG = Logger.getLogger(FormularioMultaController.class);
	private static final long serialVersionUID = 1L;
	private static MatriculaDAO dao = null;
	private ValidatorFactory factory;
	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		dao = MatriculaDAO.getInstance();
		factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idcocheStr = request.getParameter("idcoche");
		String idagenteStr = request.getParameter("idagente");
		String importeStr = request.getParameter("importe");
		String concepto = request.getParameter("concepto");
		String matricula = request.getParameter("matricula");
		try {
			int idcoche = Integer.parseInt(idcocheStr);

			int idagente = Integer.parseInt(idagenteStr);

			Float importe = Float.parseFloat(importeStr);
			Multa multaValid = new Multa();
			multaValid.setImporte(importe);
			multaValid.setConcepto(concepto);

			Set<ConstraintViolation<Multa>> violations = validator.validate(multaValid);
			if (violations.isEmpty()) {
				try {
					if (dao.insertar(importe, concepto, idcoche, idagente)) {
						LOG.debug("anyadida la multa por agente " + idagenteStr + " al coche con id " + idcocheStr
								+ " importe a deber " + importeStr + " con concepto " + concepto);
						Alerta alerta = new Alerta("success", "Multa guardada con exito");
						request.setAttribute("alerta", alerta);
						request.getRequestDispatcher("privado/index.jsp").forward(request, response);
					} else {
						Alerta alerta = new Alerta("danger", "Ha habido un error");
						request.setAttribute("alerta", alerta);
						response.sendRedirect("privado/index.jsp");
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}

			} else {
				Alerta alerta = new Alerta("danger", "Los datos introducidos no cumplen el estilo minimo");
				Coche coche = new Coche();
				coche.setId(idcoche);
				coche.setMatricula(matricula);
				request.setAttribute("coche", coche);
				request.setAttribute("alerta", alerta);
				request.getRequestDispatcher("privado/multar.jsp").forward(request, response);
			}
		} catch (Exception e) {
			Alerta alerta = new Alerta("danger", "Los datos introducidos no son del tipo correcto");
			Coche coche = new Coche();
			coche.setId(Integer.parseInt(idcocheStr));
			coche.setMatricula(matricula);
			request.setAttribute("coche", coche);
			request.setAttribute("alerta", alerta);
			request.getRequestDispatcher("privado/multar.jsp").forward(request, response);
		}

	}
}
