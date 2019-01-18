package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.modelo.dao.EstadisticasDAO;
import com.ipartek.formacion.modelo.pojo.Objetivo;

/**
 * Servlet implementation class EstadisticasController
 */
@WebServlet("/estadisticas")
public class EstadisticasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private EstadisticasDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = EstadisticasDAO.getInstance();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idAgenteStr = request.getParameter("idAgente");
		String anyoStr = request.getParameter("anyo");
		Objetivo objetivo = new Objetivo();
		boolean objetivoMesCumplido = false;
		boolean objetivoAnyoCumplido = false;

		try {
			int idAgente = Integer.parseInt(idAgenteStr);
			int anyo = Integer.parseInt(anyoStr);
			float totalmes = dao.getObjetivosMes(idAgente);
			float totalanyo = dao.getObjetivosAnyo(idAgente);
			
			if(totalmes > 1000 ) {
				objetivoMesCumplido = true;
			}
			if(totalanyo > 12000) {
				objetivoAnyoCumplido = true;
			}
			objetivo.setObjetivoMes(totalmes);
			objetivo.setObjetivoAnyo(totalanyo);
			objetivo.setObjetivoMesCumplido(objetivoMesCumplido);
			objetivo.setObjetivoAnyoCumplido(objetivoAnyoCumplido);
			
			request.setAttribute("objetivo", objetivo);
			request.setAttribute("objetivoAnyo", dao.getAllByAnyo(idAgente, anyo));
			request.getRequestDispatcher("privado/estadisticas.jsp").forward(request, response);
		}catch(Exception e){
		e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
