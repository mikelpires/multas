package com.ipartek.formacion.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.pojo.Coche;

public class MatriculaDAO {

	public static final String SQL_GETID = "SELECT id, matricula from coches where matricula = ?";

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
					coche = rowMapper(rs);

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return coche;
	}



	private Coche rowMapper(ResultSet rs) throws SQLException {
		Coche c = new Coche();
		c.setId(rs.getInt("id"));
		c.setMatricula(rs.getString("matricula"));

		return c;
	}

}
