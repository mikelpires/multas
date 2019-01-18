package com.ipartek.formacion.modelo.pojo;

public class Objetivo {

	private float objetivoMes;
	private float objetivoAnyo;
	private boolean objetivoMesCumplido;
	private boolean objetivoAnyoCumplido;

	public Objetivo() {
		super();
		this.objetivoMes = 0;
		this.objetivoAnyo = 0;
		this.objetivoMesCumplido = false ;
		this.objetivoAnyoCumplido = false;
	}



	public Objetivo(float objetivoMes, float objetivoAnyo, boolean objetivoMesCumplido, boolean objetivoAnyoCumplido) {
		this();
		setObjetivoMes(objetivoMes);
		setObjetivoAnyo(objetivoAnyo);
		setObjetivoMesCumplido(objetivoMesCumplido);
		setObjetivoAnyoCumplido(objetivoAnyoCumplido);
	}



	public float getObjetivoMes() {
		return objetivoMes;
	}



	public void setObjetivoMes(float objetivoMes) {
		this.objetivoMes = objetivoMes;
	}



	public float getObjetivoAnyo() {
		return objetivoAnyo;
	}



	public void setObjetivoAnyo(float objetivoAnyo) {
		this.objetivoAnyo = objetivoAnyo;
	}



	public boolean isObjetivoMesCumplido() {
		return objetivoMesCumplido;
	}



	public void setObjetivoMesCumplido(boolean objetivoMesCumplido) {
		this.objetivoMesCumplido = objetivoMesCumplido;
	}



	public boolean isObjetivoAnyoCumplido() {
		return objetivoAnyoCumplido;
	}



	public void setObjetivoAnyoCumplido(boolean objetivoAnyoCumplido) {
		this.objetivoAnyoCumplido = objetivoAnyoCumplido;
	}



	@Override
	public String toString() {
		return "Objetivo [objetivoMes=" + objetivoMes + ", objetivoAnyo=" + objetivoAnyo + ", objetivoMesCumplido="
				+ objetivoMesCumplido + ", objetivoAnyoCumplido=" + objetivoAnyoCumplido + "]";
	}

	// GETTERS & SETTERS

	
}
