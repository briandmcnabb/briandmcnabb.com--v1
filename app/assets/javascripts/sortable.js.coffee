jQuery ->
	$('tbody#sortable').sortable
		axis: 'y'
		handle: '.handle'
		update: ->
			$.post($(this).data('sort_url'), $(this).sortable('serialize'))