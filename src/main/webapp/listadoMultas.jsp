<%@ include file="../includes/header.jsp"%>

 <main role="main" class="container">
	
	
		
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">Id multa</th>
		      <th scope="col">Matricula</th>
		      <th scope="col">Fecha</th>
		      <th scope="col">Concepto</th>
		    </tr>
		  </thead>
		  <tbody>
		 	 <c:forEach items="${multas}" var="m">
			    <tr>		    	
			      <td>${m.id}</td>
			      <td>${m.coche.matricula}</td>
			      <td>${m.fecha}</td>
			      <td>${m.concepto}</td>			      		      
			    </tr>    
		    </c:forEach>
		  </tbody>
		</table>


	</main>			



<%@ include file="../includes/footer.jsp"%>