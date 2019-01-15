package com.ipartek.formacion.modelo;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class ConnectionManager {

	private static Connection conn;

	public static Connection getConnection() {

		conn = null;
		try {
			// cargar properties
			Properties prop = new Properties();

			InputStream input = ConnectionManager.class.getClassLoader().getResourceAsStream("database.properties");
			prop.load(input);

			// comprobar que exista .jar para mysql
			Class.forName(prop.getProperty("ddbb.driver")).newInstance();

			// crear conexion
			conn = DriverManager.getConnection(prop.getProperty("ddbb.url"), prop.getProperty("ddbb.user"),
					prop.getProperty("ddbb.pass"));

		} catch (Exception e) {

		}
		return conn;

	}
}

//package com.ipartek.formacion.modelo;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class ConnectionManager {
//
//	private static Connection conn;
//	private static final String URL = "jdbc:mysql://192.168.0.44/youtube?useSSL=false";
//	private static final String USER = "viernes";
//	private static final String PASS = "juernes";
//
//	public static Connection getConnection() {
//
//		conn = null;
//
//		try {
//			Class.forName("com.mysql.jdbc.Driver").newInstance();
//			conn = DriverManager.getConnection( URL , USER, PASS);
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//		}
//
//		return conn;
//
//	}
//	
//}
