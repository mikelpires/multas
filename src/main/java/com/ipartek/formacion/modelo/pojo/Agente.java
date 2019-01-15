package com.ipartek.formacion.modelo.pojo;

public class Agente {

	private int id;
	private String nombre;
	private int placa;

	public Agente() {
		super();
		// TODO Auto-generated constructor stub
		this.id = -1;
		this.nombre = "Agente";
		this.placa = -2;
	}

	public Agente(int id, String nombre, int placa) {
		this();
		setId(id);
		setNombre(nombre);
		setPlaca(placa);
	}

	// GETTERS & SETTERS

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
		return "Agente [id=" + id + ", nombre=" + nombre + ", placa=" + placa + "]";
	}

}
