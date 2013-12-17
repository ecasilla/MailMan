var EditorView = Backbone.View.extend({
  el: "div#editor",

  events: {
    "keyup": "refreshRendered"
  },
  refreshRendered: function() {
 
  $(".rendered").html( $("#editor").html() );
  $("#editor").on("keyup", refreshRendered);
  $(".btn-group").on("click", refreshRendered);

  }
});

new EditorView();