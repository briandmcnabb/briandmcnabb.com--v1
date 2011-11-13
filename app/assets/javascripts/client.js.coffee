jQuery ->
  $('#client_service_tokens').autoSuggest $('#client_service_tokens').data('autosuggest'),
		selectedItemProp: 'name'
		selectedValuesProp: 'id'
		searchObjProps: 'name'
		asHtmlID: 'service_tokens'
		startText: ''