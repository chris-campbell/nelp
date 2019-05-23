$(function () {
    $(document).scroll(function () {
        const element = $('.buffer');
        var documentCurrentPos = $(this).scrollTop();
        var position = element.position();
        var elementPos = element.scrollTop = (position.top - 59);

        // Toggle logic for Nav/Relevance
        if (documentCurrentPos > elementPos) {
            if ($('.relevance').css('display') == 'none') {
                $('.navbar').toggle();
                $('.relevance').toggle();
            }
        } else if (documentCurrentPos < elementPos) {
             if ($('.relevance').css('display') == 'block') {
                $('.navbar').toggle();
                $('.relevance').toggle();
            }
        }
    });
});
