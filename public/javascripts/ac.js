function split(val) {
	return val.split(' ');
}
$(function() {
	$('input[data-autocomplete]').live('focus', function(i){
    $(this).autocomplete({
      source: $(this).attr('data-autocomplete'),
			focus: function() {
				return false;
			},
      select: function(event, ui) {
				var terms = split(this.value);
				terms.pop();
				terms.push(ui.item.value);
				terms.push('');
				this.value = terms.join(' ');
        return false;
      }
    });
  });
});