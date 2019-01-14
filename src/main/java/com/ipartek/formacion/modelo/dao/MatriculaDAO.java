package com.ipartek.formacion.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.pojo.Coche;
import com.ipartek.formacion.modelo.pojo.Multa;

public class MatriculaDAO {

	public static final String SQL_GETBYMATRICULA = "SELECT id, matricula from coche where matricula = ?";
	public static final String SQL_GETALL = "SELECT m.id as 'id_multa', c.matricula as 'matricula',c.modelo as 'modelo', m.fecha_alta as 'fecha', m.concepto as 'concepto' FROM multa as m, coche as c, agente as a WHERE m.id_coche = c.id AND a.id = m.id_agente AND a.id = ? order by m.id desc;";
	public static final String SQL_INSERTAR = "INSERT INTO  multa(importe, concepto, id_coche, id_agente) VALUES (?, ?, ?, ?);";
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

public boolean insertar(int importe, String concepto, int idcoche, int idagente) throws SQLException {
		
		boolean resul = false;

		try ( Connection conn = ConnectionManager.getConnection();
			  PreparedStatement pst = conn.prepareStatement(SQL_INSERTAR);				   
			){
			
			pst.setInt(1, importe);
			pst.setString(2, concepto);
			pst.setInt(3, idcoche);
			pst.setInt(4, idagente);
			int affectedRows = pst.executeUpdate();
			if ( affectedRows == 1 ) {
				resul = true;
			}
			
		}
		return resul;
		
	}

	public Coche getByMatricula(String matricula) {

		Coche coche = null;

		try (Connection conn = ConnectionManager.getConnection();
				PreparedStatement pst = conn.prepareStatement(SQL_GETBYMATRICULA);) {

			pst.setString(1, matricula);

			try (ResultSet rs = pst.executeQuery()) {

				while (rs.next()) {

					coche = new Coche(rs.getInt("id"), rs.getString("matricula"));
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
