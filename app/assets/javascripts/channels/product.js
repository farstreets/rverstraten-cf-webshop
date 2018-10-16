App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    // $('#product-reviews').prepend("<%= j render @comment %>");
    $('#product-reviews').prepend(data.comment);
    $("#average_rating_outside_div").html('<p><div class="rated" data-score=' + data.average_rating +'></div></p>');
    refreshRating();
  },

  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }

});

$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    App.product.listen_to_comments();
  }, 500);
});
