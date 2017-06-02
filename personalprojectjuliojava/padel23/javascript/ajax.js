$(document).ready(function() {
    $('.ajax_borrar').click(function(event) {
        event.preventDefault();
        var boton = this;
        var accion = boton.parentElement.getAttribute('action');
        $.ajax(accion, {
            beforeSend: function() {
                boton.parentElement.getElementsByClassName('loader_gif')[0].style.visibility = 'visible';
            },
            complete: function(a, b) {
                window.console.log(a,b);
                $(boton.parentElement.parentElement).remove();
            }});
    });
});
$(document).ajaxStart(function() {
    $('#loader').css({visibility: 'visible'});
});
$(document).ajaxStop(function() {
    $('#loader').css({visibility: 'hidden'});
});
