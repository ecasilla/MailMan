var EditorView = Backbone.View.extend({
  el: "form.email-template",

  initialize: function() {
    this.render();
  },
  render: function() {
    //console.log("Rendering editor view: ");
    //console.log("  editor HTML: " + $("#editor").html() );
    this.template = _.template( $("#editor").html() );

    //console.log("  template HTML: " + this.template({first_name: "Ernie"}) );
    this.$el.find(".rendered").html( this.template(this.example) );
  },

  example: JSON.parse('{"first_name": "John", "last_name": "Doe", "email": "jdoe@gmail.com", "phone": "(212)455-5555" }'),

  events: {
    "keyup #editor": "render",
    "click .btn-group": "render"
  },
  
});

new EditorView();

_.templateSettings = {
  interpolate : /\{\{([\s\S]+?)\}\}/g
};