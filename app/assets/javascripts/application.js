// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
	
	initialize_edit_chores();
});

function initialize_edit_chores() {
	$('#chore_chore_type_id').on('change', function() { $('#new_chore').submit(); });	
	
	$('.edit_button').live('click', function() { 
		$(this).next('.edit_chore').css('display', 'inline');
		$(this).prev('.points').hide();
		$(this).hide();
	});
}
