$(function() {
	if (window.PIE) {
		$('.round,.boxShadow,.activeList li .fr,.certList img').each(function() {
			PIE.attach(this);
		});
	}
});
