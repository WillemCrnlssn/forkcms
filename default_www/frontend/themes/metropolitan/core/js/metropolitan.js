$(document).ready(function() {

	var formItem = $('p');
	var activeField;
	var parent;


	$('body').click(function(){
		$('body').trigger('clearFocusEvent');
	})

	formItem.click(function(event){
		setTimeout(function(){
			activeField = $(event.currentTarget);
			parent = activeField.parent();
			parent.children().removeClass('activeField')

			activeField.addClass('activeField');
		}, 10)
	});

	$('body').bind('clearFocusEvent',function() {
		if(parent)
		{
			parent.children().removeClass('activeField')
		}
	})
});