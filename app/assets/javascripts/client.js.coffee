jQuery ($)->
	# Utility Methods
	split = (val)-> val.split(/,\s*/)
	extractLast = (term)-> split(term).pop()
	
	# Variables
	input = $('input#client_service_tokens')
	data = input.data('source')
	
	# Tabbed Completion
	input.bind 'keydown', (event)->
		if event.keyCode == 9 and $(this).data("autocomplete").menu.active
			event.preventDefault()

	# Autocompletion
	input.autocomplete
		source: (request, response)->
			response(
				$.ui.autocomplete.filter data, extractLast(request.term)
			)
		focus: -> false
		select: ( event, ui )->
			terms = split( this.value )
			terms.pop()
			terms.push( ui.item.value )
			terms.push( "" )
			this.value = terms.join( ", " )
			false