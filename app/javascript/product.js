$(document).ready(function(){
  var subcategory;

  $('#product_subcategory_id').parent().hide();

  subcategory = $('#product_subcategory_id').html();

  $('#product_category_id').change(function() {
    var category, escaped_category, options;
    category = $('#product_category_id :selected').text();
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(subcategory).filter("optgroup[label='" + escaped_category + "']").html();
    if (options) {
      $('#product_subcategory_id').html(options);
      return $('#product_subcategory_id').parent().show();
    } else {
      $('#product_subcategory_id').empty();
      return $('#product_subcategory_id').parent().hide();
    }
  });
})
