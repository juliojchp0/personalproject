<div class="anuncios view">
<h2><?php echo __('Anuncio'); ?>	<?php echo $this->Html->script('jquery-1.4.3.min');?>
<?php 
      if($this->Session->check('Auth.User.id')){
          $esFavorito=false;
          $favorito_id='';
          foreach ($anuncio['Favorito'] as $favorito){
          	if($favorito['user_id']==AuthComponent::user('id')){
          		$esFavorito=true;
          		$favorito_id=$favorito['id'];
          	}
                                  }?>
                    
    
           <div style="float: left;cursor: pointer;">
                  <?php $img='';$favo='true';    
                  if($esFavorito){
                      $img='estrellaAmarilla.png';
                      $favo='false';
                  } else{
                      $img='estrella.png';
                  } 
  echo $this->Html->image($img,array('id'=>$anuncio['Anuncio']['id'],'width'=>'20px','height'=>'20px','class'=>'estrella','data-anuncio_id'=>$anuncio['Anuncio']['id'],'data-user_id'=>AuthComponent::user('id'),'data-favorito_id'=>$favorito_id,'data-favorito'=>$favo));?> 
                       
          </div>
      <?php } ?>
<?php echo $this->Html->script('ajaxFavoritos');?></h2>

	<dl>
		
		<dt><?php echo __('Nombre'); ?></dt>
		<dd>
			<?php echo h($anuncio['Anuncio']['nombre']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Descripcion'); ?></dt>
		<dd>
			<?php echo $anuncio['Anuncio']['descripcion']; ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Precio'); ?></dt>
		<dd>
			<?php echo h($anuncio['Anuncio']['precio']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Fecha Creacion'); ?></dt>
		<dd>
			<?php echo h($anuncio['Anuncio']['created']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Provincia'); ?></dt>
		<dd>
			<?php echo h($anuncio['Province']['provincia']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('User'); ?></dt>
		<dd>
			<?php echo h($anuncio['User']['email']); ?>
			&nbsp;
		</dd>
	</dl>
	
	<?php

	 if (isset($anuncio['Foto'][0])):?>
	   
        
        <?php foreach ($anuncio ['Foto'] as $foto): ?>
           <img src="/cakeSegundamano/files/<?php echo $foto['nombre_archivo']; ?>" width="250" height="300"/>
        <?php endforeach; ?>
        
		<?php endif; ?>
		<?php if (!isset($anuncio['Foto'][0])):?>
		<td><?php echo 'No Imagen'; ?>
		<?php endif; ?>
</div>
<div class="actions">
	<h3><?php echo __(''); ?></h3>
	<ul>
    	<?php if (AuthComponent::user('id')==$anuncio['Anuncio']['user_id']):?>
		<li><?php echo $this->Html->link(__('Editar Anuncio'), array('action' => 'edit', $anuncio['Anuncio']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Borrar Anuncio'), array('action' => 'delete', $anuncio['Anuncio']['id']), null, __('Are you sure you want to delete # %s?', $anuncio['Anuncio']['id'])); ?> </li>
        <?php endif; ?>
		<li><?php echo $this->Html->link(__('Ver Anuncios'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('Nuevo Anuncio'), array('action' => 'add')); ?> </li>
		
		
	</ul>
</div>

<div class="related">
<?php if (AuthComponent::user('id')==$anuncio['Anuncio']['user_id'] ):?>
	<h3><?php echo __('Anunciante'); ?></h3>

	<?php if (!empty($anuncio['User'])): ?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		
		<th><?php echo __('Nombre'); ?></th>
		<th><?php echo __('Apellidos'); ?></th>
		<th><?php echo __('Provincia'); ?></th>
		<th><?php echo __('Ciudad'); ?></th>
		<th><?php echo __('Telefono'); ?></th>
		<th><?php echo __('Fecha Nacimiento'); ?></th>
		
	</tr>
	
	<?php  ?>

		<tr>
			
			<td><?php echo $anuncio['User']['nombre']; ?></td>
			<td><?php echo $anuncio['User']['apellidos']; ?></td>
			<td><?php echo $anuncio['User']['provincia']; ?></td>
			<td><?php echo $anuncio['User']['ciudad']; ?></td>
			<td><?php echo $anuncio['User']['telefono']; ?></td>
			<td><?php echo $anuncio['User']['fecha_nacimiento']; ?></td>
			
		</tr>
	
	</table>
<?php endif; ?>
<?php endif; ?>
	
	
</div>










