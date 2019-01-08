package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.dao.MatriculaDAO;
import com.mysql.jdbc.PreparedStatement.ParseInfo;


/**
 * Servlet implementation class VerMultasController
 */
@WebServlet("/formularioMulta")
public class FormularioMultaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MatriculaDAO dao = null;

       
	@Override
	public void init(ServletConfig config) throws ServletException {
		dao = MatriculaDAO.getInstance();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		dao.getByMatricula(request.getParameter("busqueda"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
