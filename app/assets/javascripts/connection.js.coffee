jQuery ->
	$('#unhide_form').click ->
		$(this).toggleClass('hidden')
		$('fieldset').toggleClass('hidden')