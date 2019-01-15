
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->


<script>
	window.jQuery
			|| document
					.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://unpkg.com/popper.js@1.14.6/dist/umd/popper.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-confirmation2/dist/bootstrap-confirmation.min.js"></script>
<script src="../js/confirmation.js"></script>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.3.0/bootbox.min.js"></script>
  <script src="http://bootstrap-confirmation.js.org/assets/js/docs.min.js"></script>
  <script src="http://bootstrap-confirmation.js.org/assets/js/script.js"></script>


<script>
	$(document).ready(function() {
		$('.tablaResponsiva').dataTable({
			"pageLength" : 25,
			"language" : {
				"url" : "dataTables/spanish.json"
			}
		});
	});
</script>
<script>
	$('[data-toggle=confirmation]').confirmation();
</script>


</body>
</html>
