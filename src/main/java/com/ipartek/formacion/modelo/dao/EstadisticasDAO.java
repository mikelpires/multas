package com.ipartek.formacion.modelo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import com.ipartek.formacion.modelo.ConnectionManager;

public class EstadisticasDAO {
	public static final String SQL_GETOBJETIVOSMES = "select total from v_dgt_objetivos where id_agente = ? AND month(now())=mes";
	private static final String SQL_GETOBJETIVOSANYO = "select sum(total) as 'total' from v_dgt_objetivos where id_agente = ? AND year(now())=anyo";
	private static final String SQL_GETALLBYANYO = "select mes, total from v_dgt_objetivos where id_agente = ? AND anyo=?";
	private static EstadisticasDAO INSTANCE = null;

	// constructor privado, solo acceso por getInstance()
	private EstadisticasDAO() {
		super();
	}

	public synchronized static EstadisticasDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new EstadisticasDAO();
		}
		return INSTANCE;
	}

	public float getObjetivosMes(int idAgente) {

		float totalmes = 0;

		try (Connection conn = ConnectionManager.getConnection();
				PreparedStatement pst = conn.prepareStatement(SQL_GETOBJETIVOSMES);) {

			pst.setInt(1, idAgente);

			try (ResultSet rs = pst.executeQuery()) {

				while (rs.next()) {

					totalmes = rs.getFloat("total");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalmes;
	}

	public float getObjetivosAnyo(int idAgente) {

		float totalanyo = 0;

		try (Connection conn = ConnectionManager.getConnection();
				PreparedStatement pst = conn.prepareStatement(SQL_GETOBJETIVOSANYO);) {

			pst.setInt(1, idAgente);

			try (ResultSet rs = pst.executeQuery()) {

				while (rs.next()) {

					totalanyo = rs.getFloat("total");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalanyo;
	}

	public HashMap<String, Integer> getAllByAnyo(int idAgente, int anyo) {

		HashMap<String, Integer> objetivoAnyo = new HashMap<String, Integer>();

		try (Connection conn = ConnectionManager.getConnection();
				CallableStatement cs = conn.prepareCall(SQL_GETALLBYANYO);) {

			cs.setInt(1, idAgente);
			cs.setInt(2, anyo);

			try (ResultSet rs = cs.executeQuery()) {

				while (rs.next()) {
					String mesNombre;
					
					switch (rs.getInt("mes")) {
					case 1: mesNombre = "enero";break;
					case 2: mesNombre = "febrero";break;
					case 3: mesNombre = "marzo";break;
					case 4: mesNombre = "abril";break;
					case 5: mesNombre = "mayo";break;
					case 6: mesNombre = "junio";break;
					case 7: mesNombre = "julio";break;
					case 8: mesNombre = "agosto";break;
					case 9: mesNombre = "septiembre";break;
					case 10: mesNombre = "octubre";break;
					case 11: mesNombre = "noviembre";break;
					case 12: mesNombre = "diciembre";break;

					default: mesNombre = "ninguno"; break;
					}
					objetivoAnyo.put(mesNombre, rs.getInt("total"));

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objetivoAnyo;
	}
}
