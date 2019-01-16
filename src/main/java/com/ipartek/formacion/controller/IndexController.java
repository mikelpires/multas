package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.apache.log4j.Logger;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;
import com.ipartek.formacion.modelo.pojo.Agente;
import com.ipartek.formacion.modelo.pojo.Alerta;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/index")
public class IndexController extends HttpServlet {

	private final static Logger LOG = Logger.getLogger(IndexController.class);
	private static final long serialVersionUID = 1L;
	private MatriculaDAO dao;
	private ValidatorFactory factory;
	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = MatriculaDAO.getInstance();

		factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("privado/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean redirect = false;
		String placaStr = request.getParameter("placa");
		String password = request.getParameter("password");

		try {
			int placa = Integer.parseInt(placaStr);
			HttpSession session = request.getSession();

			Agente agente = new Agente();

			agente.setPlaca(placa);
			agente.setPassword(password);

			Set<ConstraintViolation<Agente>> violations = validator.validate(agente);

			if (violations.size() > 0) { // validacion NO PASA

				String errores = "<ul>";
				for (ConstraintViolation<Agente> violation : violations) {
					errores += String.format("<li> %s : %s </li>", violation.getPropertyPath(), violation.getMessage());
				}
				errores += "</ul>";
				Alerta alerta = new Alerta("danger", errores);

				request.setAttribute("alerta", alerta);

			} else { // validacion OK

				agente = dao.login(placa, password);

				if (agente == null) {
					Alerta alerta = new Alerta("danger", "Datos incorrectos, vuelve a intentarlo");
					request.setAttribute("alerta", alerta);
				} else {

					session.setMaxInactiveInterval(60 * 60 * 24 * 365 * 5);

					session.setAttribute("agente", agente);

					redirect = true;

				}
			}

		} catch (Exception e) {

			LOG.error(e);
		} finally {

			if (redirect) {
				response.sendRedirect("privado/index.jsp");
			} else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}

	}

}
