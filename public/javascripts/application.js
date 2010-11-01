$(function() {
	$('.photo_body').click(function(){
		$('#'+this.id).children('.photo_body_text').css('display','none');
		$('#'+this.id).children('.add_photo_body_form').css('display','block');
	});
});