$(document).on('ready', function () {
    $(function () {
        $(document).scroll(function () {
            const element = $('.buffer');
            var documentCurrentPos = $(this).scrollTop();
            var position = element.position();
            var elementPos = element.scrollTop = (position.top - 30);
    
            // Toggle logic for Nav/Relevance
            if (documentCurrentPos > elementPos) {
                if ($('.relevance').css('display') == 'none') {
                    $('.navbar').toggle(100);
                    $('.relevance').toggle();
                    $('.social').toggle();
                }
            } else if (documentCurrentPos < elementPos) {
                 if ($('.relevance').css('display') == 'block') {
                    $('.navbar').toggle(100);
                    $('.relevance').toggle();
                    $('.social').toggle();
                }
            }
        });
    });
});
