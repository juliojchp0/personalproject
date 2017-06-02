/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
$('.estrella').click(function(){
    var img=$(this);
           if(img.attr('data-favorito')=='true'){
               var user_id=img.attr('data-user_id');
                var anuncio_id=img.attr('data-anuncio_id');
               if (confirm('¿estas seguro que deseas hacer este anuncio tu favorito?')) {
		$.ajax({
			url:'/cakeSegundamano/favoritos/add/'+user_id+'/'+anuncio_id,
			type:'GET',
			success:function(data){
                            //var favorito_id=parseInt(data);
				if(data=='error'){
                                   alert('Error al intentar hacer el favorito vuleva a intentarlo');
					
				}else{
					
                                        img.attr('src','/cakeSegundamano//img/estrellaAmarilla.png');
                                        img.attr('data-favorito','false');
                                        img.attr('data-favorito_id',data);
					}
				},
			error:function(){
				alert('ERROR');
			}
		});
            }
        }else{
             var favorito_id=img.attr('data-favorito_id');
             if (confirm('¿estas seguro que deseas deshacer este favorito?')) {
             $.ajax({
			url:'/cakeSegundamano/favoritos/deleteFavorito/'+favorito_id,
			type:'GET',
			success:function(data){
				if(data=='ok'){
                                    //alert('#favoritos'+anuncio_id);
					img.attr('src','/cakeSegundamano/img/estrella.png');
                                        img.attr('data-favorito','true');
                                        img.attr('data-favorito_id','');
				}else{
					alert('Error al intentar deshacer el favorito vuleva a intentarlo');
					}
				},
			error:function(){
				alert('ERROR');
			}
                   }
               );
            
                }
            }
	});

        });