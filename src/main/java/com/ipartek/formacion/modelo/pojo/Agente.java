package com.ipartek.formacion.modelo.pojo;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Agente {

	private int id;
	private String nombre;

	@Digits(fraction = 0, integer = 4)
	private int placa;

	@NotNull
	@Size(min = 4, max = 55)
	private String password;

	public Agente() {
		super();
		// TODO Auto-generated constructor stub
		this.id = -1;
		this.nombre = "Agente";
		this.placa = -2;
		this.password = "Password";
	}

	public Agente(int id, String nombre, int placa, String password) {
		this();
		setId(id);
		setNombre(nombre);
		setPlaca(placa);
		setPassword(password);
	}

	// GETTERS & SETTERS
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getPlaca() {
		return placa;
	}

	public void setPlaca(int placa) {
		this.placa = placa;
	}

	// TO STRING

	@Override
	public String toString() {
		return "Agente [id=" + id + ", nombre=" + nombre + ", placa=" + placa + ", password=" + password + "]";
	}

}
