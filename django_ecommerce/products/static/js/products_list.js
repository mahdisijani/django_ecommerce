function get_list_by_category(category) {
    // get list of products by category
    console.log(category);
    $.ajax
        ({
            url: cat_url,
            type: "GET",
            data: {
                category: category,
            },
            success: function (response) {
                page_content(response.results) // list of products
                page_nav(response.previous, response.next) // previous and next page link
            },
        });

}
function get_list_by_tag(tag) {
    // get list of products by tag
    console.log(tag);
    $.ajax
        ({
            url: tag_url,
            type: "GET",
            data: {
                tag: tag,
            },
            success: function (response) {
                page_content(response.results) // list of products
                page_nav(response.previous, response.next) // previous and next page link
            },
        });

}
function get_products_list() {
    // get list of all products 
    $.ajax
        ({
            url: products_url,
            type: "GET",

            success: function (response) {
                page_content(response.results) // list of products
                page_nav(response.previous, response.next) // previous and next page link
            },
        });

}
function page_content(products) {
    // put products on container
    content = $("#products")
    content.empty()
    for (let i = 0; i < products.length; i++) {
        product = products[i]

        content.append($(`

    <div class="col-md-3 mb-3">
        <div class="card">
            <img class="card-img-top" src="${product.image}" alt="Card image cap">
            <div class="card-body">
                <a href="/${LANGUAGE_CODE}/product/${product.id}/"  class=" card-title stretched-link">
                    ${product.name}
                </a>
                <h3 class="card-title text-left">${product.price} <small>تومان</small> </h3>
            </div>
        </div>
    </div>

    `))
    }
}
function page_nav(previous, next) {
    // change pagination nav button link
    content = $("#products")
    nav = $("#pagination_nav")
    nav.empty()

    if (previous) {
        console.log(previous);
        nav.append($(`<li class="page-item" id="pagenum_nav">
            <a class="page-link" aria-label="Previous" onclick="get_page($('#previous_page').val())">
                <span aria-hidden="true">&laquo;</span>
                <input type="hidden" value="${previous}" id="previous_page">
                <span class="sr-only">Previous</span>
            </a>
        </li>`))
    }

    if (next) {
        console.log(next);
        nav.append($(`<li class="page-item">
            <a class="page-link" aria-label="Next" onclick="get_page($('#next_page').val())">
                <span aria-hidden="true">&raquo;</span>
                <input type="hidden" value="${next}" id="next_page">
                <span class="sr-only">Next</span>
            </a>
        </li>`))
    }

}
function get_page(page_link) {
    // get page by link
    console.log(page_link);
    $.ajax
        ({
            url: page_link,
            type: "GET",

            success: function (response) {
                page_content(response.results)
                page_nav(response.previous, response.next)
            },
        });
}
$(document).ready(get_products_list())
