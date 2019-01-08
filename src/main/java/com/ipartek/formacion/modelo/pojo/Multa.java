package com.ipartek.formacion.modelo.pojo;

import java.sql.Date;

public class Multa {
	private int id;
	private float importe;
	private String concepto;
	private Date fecha;
	
	
	
	public Multa() {
		super();
		this.id = -1;
		this.importe = -1;
		this.concepto = "Concepto";
		
		
	}
	
	
	
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
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	
	
}
