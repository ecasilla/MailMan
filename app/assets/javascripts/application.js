// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.hotkeys
//= require jquery_ujs
//= require underscore
//= require backbone
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/templates
//= require_tree ./backbone/views
//= require_tree ./backbone/routers
//= require bootstrap
//= require wysiwyg
//= require_self


$( document ).ready(function() {
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = [
        'Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
        'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
        'Times New Roman', 'Verdana'
        ],
        fontTarget = $('[title=Font]').siblings('.dropdown-menu');

      $.each(fonts, function (idx, fontName) {
        fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });

      $('a[title]').tooltip({container:'body'});

      $('.dropdown-menu input').click(function() {return false;})
      .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
      .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });

      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});

      } else {

        $('#voiceBtn').hide();
      }
    };
    function showErrorAlert (reason, detail) {
      var msg='';
      if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
      else {
        console.log("error uploading file", reason, detail);
      }
      $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
       '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
    };
    initToolbarBootstrapBindings();  
    
    $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });

$("form.email-template").on("submit", function(e) {
    // prevent the submit by writing this callback that prevents the default,
    // then removing this callback from future submits,
    // then submitting again (which will trigger the default action!)
    e.preventDefault();
    $(this).off();
    
    // copy the html as a string from div.rendered
    var htmlAsString = $("div#editor").html();

    // create a new form input
    var newInput = $("<input>").attr({
      id: "email_template_body",
      name: "email_template[body]",
      type: "textarea"
    }).css("display", "none").val( htmlAsString );

    // append the new input to the form
    $(this).append( newInput );

    $(this).submit();
  });

  $( "#first_name" ).click(function() {
    $('#editor').append("{{first_name}}");
  });
  $( "#last_name" ).click(function() {
    $('#editor').append("{{last_name}}");
  });
  $( "#email" ).click(function() {
    $('#editor').append("{{email}}");
  });
  $( "#phone" ).click(function() {
    $('#editor').append("{{phone}}");
  });

});

