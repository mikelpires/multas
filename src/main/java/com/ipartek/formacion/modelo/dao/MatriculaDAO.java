package com.ipartek.formacion.modelo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.modelo.ConnectionManager;
import com.ipartek.formacion.modelo.pojo.Coche;
import com.ipartek.formacion.modelo.pojo.Multa;

public class MatriculaDAO {

	public static final String SQL_GETBYMATRICULA = "{call PA_dgt_getByMatricula(?)}";
	public static final String SQL_GETALL = "{call PA_dgt_getAll(?)}";
	public static final String SQL_INSERTAR = "{call PA_dgt_insertarMulta(?,?,?,?)}";
	public static final String SQL_ANULAR = "{call PA_dgt_anular(?)}";
	private static final String SQL_GETANULADAS = "{call PA_dgt_getAnuladas(?)}";
	private static final String SQL_HABILITAR = "{call PA_dgt_habilitar(?)}";

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

	public boolean anular(int idMulta) throws SQLException {

		boolean resul = false;

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_ANULAR);) {

			cs.setInt(1, idMulta);

			int affectedRows = cs.executeUpdate();
			if (affectedRows == 1) {
				resul = true;
			}

		}
		return resul;

	}

	public boolean habilitar(int idMulta) throws SQLException {

		boolean resul = false;

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_HABILITAR);) {

			cs.setInt(1, idMulta);

			int affectedRows = cs.executeUpdate();
			if (affectedRows == 1) {
				resul = true;
			}

		}
		return resul;

	}

	public boolean insertar(Float importe, String concepto, int idcoche, int idagente) throws SQLException {

		boolean resul = false;

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_INSERTAR);) {

			cs.setFloat(1, importe);
			cs.setString(2, concepto);
			cs.setInt(3, idcoche);
			cs.setInt(4, idagente);
			int affectedRows = cs.executeUpdate();
			if (affectedRows == 1) {
				resul = true;
			}

		}
		return resul;

	}

	public Coche getByMatricula(String matricula) {

		Coche coche = null;

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_GETBYMATRICULA);) {

			cs.setString(1, matricula);

			try (ResultSet rs = cs.executeQuery()) {

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
				CallableStatement cs = conn.prepareCall(SQL_GETALL);) {

			cs.setInt(1, id);

			try (ResultSet rs = cs.executeQuery()) {

				while (rs.next()) {
					Multa m = new Multa();
					m.setId(rs.getInt("id_multa"));
					m.setFecha(rs.getString("fecha"));
					m.setFechaBaja(rs.getString("fecha_baja"));
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

	public ArrayList<Multa> getAnuladas(int idAgente) {

		ArrayList<Multa> multas = new ArrayList<Multa>();

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_GETANULADAS);) {

			cs.setInt(1, idAgente);

			try (ResultSet rs = cs.executeQuery()) {

				while (rs.next()) {
					Multa m = new Multa();
					m.setId(rs.getInt("id_multa"));
					m.setFecha(rs.getString("fecha_alta"));
					m.setFechaBaja(rs.getString("fecha_baja"));
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
