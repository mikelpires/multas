package com.ipartek.formacion.modelo.pojo;

public class Coche {
	
		private int id;
		private String matricula;
		private String modelo;
		private int km;
		
		
		public Coche() {
			super();
			this.id = -1;
			this.matricula = "0000AAA";
			this.modelo = "MARCA MODELO";
			this.km =  000;
		}
		
		public Coche(int id, String matricula, String modelo, int km) {
			this();
			setId(id);
			setMatricula(matricula);
			setModelo(modelo);
			setKm(km);
		}

		
		//GETTERS & SETTERS

		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getMatricula() {
			return matricula;
		}


		public void setMatricula(String matricula) {
			matricula = matricula;
		}


		public String getModelo() {
			return modelo;
		}


		public void setModelo(String modelo) {
			modelo = modelo;
		}


		public int getKm() {
			return km;
		}


		public void setKm(int km) {
			this.km = km;
		}

		//TO STRING

		@Override
		public String toString() {
			return "Coche [id=" + id + ", Matricula=" + matricula + ", Modelo=" + modelo + ", km=" + km + "]";
		}
		
		
		
	
}
