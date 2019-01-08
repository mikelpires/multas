package com.ipartek.formacion.modelo.pojo;

import java.sql.Date;

public class Multa {
	private int id;
	private float importe;
	private String concepto;
	private String fecha;
	
	
	
	public Multa() {
		super();
		this.id = -1;
		this.importe = -1;
		this.concepto = "Concepto";
		this.fecha = "00-00-0000";
		
	}
	
	public Multa(int id, float importe, String concepto, String fecha) {
		this();
		setId(id);
		setImporte(importe);
		setConcepto(concepto);
		setFecha(fecha);
	}
	
	
	//GETTERS & SETTERS
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getImporte() {
		return importe;
	}
	public void setImporte(float importe) {
		this.importe = importe;
	}
	public String getConcepto() {
		return concepto;
	}
	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
	//TO STRING

	@Override
	public String toString() {
		return "Multa [id=" + id + ", importe=" + importe + ", concepto=" + concepto + ", fecha=" + fecha + "]";
	}
	
	
	
}
