package com.ipartek.formacion.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.pojo.Coche;
import com.ipartek.formacion.modelo.pojo.Multa;

public class MatriculaDAO {

	public static final String SQL_GETID = "SELECT id, matricula from coche where matricula = ?";
	public static final String SQL_GETALL = "SELECT m.id as 'id_multa', c.matricula as 'matricula',c.modelo as 'modelo', m.fecha as 'fecha', m.concepto as 'concepto' FROM multa as m, coche as c, agente as a WHERE m.id_coche = c.id AND a.id = m.id_agente AND a.id = ?;";
	private static MatriculaDAO INSTANCE = null;

	// constructor privado, solo acceso por getInstance()
	private MatriculaDAO() {
		super();
	}

	public synchronized static MatriculaDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new MatriculaDAO();
		}
		return INSTANCE;
	}

	public Coche getByMatricula(int matricula) {

		Coche coche = null;

		try (Connection conn = ConnectionManager.getConnection();
				PreparedStatement pst = conn.prepareStatement(SQL_GETID);) {

			pst.setInt(1, matricula);

			try (ResultSet rs = pst.executeQuery()) {

				while (rs.next()) {


				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return coche;
	}
	
	public ArrayList<Multa> getAll(int id) {

		ArrayList<Multa> multas = new ArrayList<Multa>();

		try (Connection conn = ConnectionManager.getConnection();
				PreparedStatement pst = conn.prepareStatement(SQL_GETALL);) {

			pst.setInt(1, id);

			try (ResultSet rs = pst.executeQuery()) {

				while (rs.next()) {
					Multa m = new Multa();
					m.setId(rs.getInt("id_multa"));
					m.setFecha(rs.getString("fecha"));
					m.setConcepto(rs.getString("concepto"));
					
					Coche c = new Coche();
					c.setMatricula(rs.getString("matricula"));
					c.setModelo(rs.getString("modelo"));
					
					m.setCoche(c);
					multas.add(m);

				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return multas;
	}
	

}
