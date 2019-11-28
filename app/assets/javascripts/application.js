//= require jquery
//= require rails-ujs
//= require select2
//= require_tree .

$(document).ready(function(){
	$('.origin-search-form').select2({
		placeholder: 'Origem',
		allowClear: true,
		width: 100,
	})
	$('.destino-search-form').select2({
		placeholder: 'Destino',
		allowClear: true,
		width: 100
	})
})

