package com.ipartek.formacion.modelo.pojo;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Multa {
	private int id;

	@Digits(fraction = 999, integer = 999)
	private float importe;

	@NotNull
	@Size(min = 5, max = 150)
	private String concepto;

	private String fecha;
	private String fechaBaja;
	private Coche coche;
	private Agente agente;

	public Multa() {
		super();
		this.id = -1;
		this.importe = -1;
		this.concepto = "Concepto";
		this.fecha = "00-00-0000";
		this.fechaBaja = null;
		this.coche = new Coche();

	}

	public Coche getCoche() {
		return coche;
	}

	public void setCoche(Coche coche) {
		this.coche = coche;
	}

	public Multa(int id, float importe, String concepto, String fecha, String fechaBaja) {
		this();
		setId(id);
		setImporte(importe);
		setConcepto(concepto);
		setFecha(fecha);
		setFechaBaja(fechaBaja);
	}

	// GETTERS & SETTERS

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

	// TO STRING

	@Override
	public String toString() {
		return "Multa [id=" + id + ", importe=" + importe + ", concepto=" + concepto + ", fecha=" + fecha + ", coche="
				+ coche + ", agente=" + agente + "]";
	}

	public String getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(String fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

}
