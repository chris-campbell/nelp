

$(function () {

    $(document).scroll(function () {
        
        var documentCurrentPos = $(this).scrollTop();
        const element = document.querySelector('.places');
        const relevanceElement = element.scrollTop = 704;
        
        
        const relevance = "<section class='relevance'>" + "<div class='container'>" +
        "<div class='row'>" + "<div class='col-md-4'></div>" +
            "<div class='col-md-4'>" + 
                '<select class="form-control" id="sel1">' +
                    "<option>Latest</option>" +
                    "<option>Oldest</option>" +
                    "<option>Popular</option>" +
                    "<option>Relevant</option>" +
                "</select>" +
            "</div>" +
            "<div class='place-count'>" +
                "<p><%= @places.length %> Places Found.</p>" +
            "</div>" +
            "</div>" +
            "</div>" +
        "</section>";
        
        
        const navbar = "<header>" + '<nav class="navbar navbar-light bg-light">' +
                       '<a class="navbar-brand" href="#">Nelp</a>' + "</nav>"+
                       "</header>";

        
        if (documentCurrentPos > relevanceElement) {
            $('.navbar').replaceWith(relevance);
        } else if (documentCurrentPos < relevanceElement) {
            $('.relevance').replaceWith(navbar);
        }
    
    });

// if (documentCurrentPos > relevanceElement) {
//     $('.navbar, .relevance').toggle()
// }
//     console.log(documentCurrentPos);
// //   
// //     const element = document.querySelector('.relevance');
// //     const relevanceElement = element.scrollTop = 704;
// //     var documentCurrentPos = $(this).scrollTop();
    
// //     if (documentCurrentPos > relevanceElement) {
// //         console.log(documentCurrentPos);
// //         $('.navbar, .relevance').toggle()
// //         // $('.relevance').hide(400);
// //         // $(".navbar").show();
// //     } else if (documentCurrentPos < relevanceElement) {
// //         $('.relevance').show(400);
// //         // $(".navbar").hide();
// //     }
// //   });
});











// const relevance = "<section class='relevance'>" + "<div class='container'>" +
//         "<div class='row'>" + "<div class='col-md-4'></div>" +
//             "<div class='col-md-4'>" + 
//                 '<select class="form-control" id="sel1">' +
//                     "<option>Latest</option>" +
//                     "<option>Oldest</option>" +
//                     "<option>Popular</option>" +
//                     "<option>Relevant</option>" +
//                 "</select>" +
//             "</div>" +
//             "<div class='place-count'>" +
//                 "<p><%= @places.length %> Places Found.</p>" +
//             "</div>" +
//         "</div>" +
//     "</div>" +
// "</section>";