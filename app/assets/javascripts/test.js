

$(function () {
 
  $(document).scroll(function () {
    const element = document.querySelector('.relevance');
    const relevanceElement = element.scrollTop = 704;
    var documentCurrentPos = $(this).scrollTop();
    
    if (documentCurrentPos > relevanceElement) {
        console.log(documentCurrentPos);
        $('.relevance').hide();
        $(".navbar").show();
    } else if (documentCurrentPos < relevanceElement) {
        $('.relevance').show();
        $(".navbar").hide();
    }
  });
});