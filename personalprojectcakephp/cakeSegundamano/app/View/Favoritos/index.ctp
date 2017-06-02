<div class="anuncios index">
	<h2><?php echo __('Anuncios');//pr($anuncios); die(); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo'Foto'; ?></th>
			<th><?php echo 'nombre'; ?></th>
			<th><?php echo 'descripcion'; ?></th>
			<th><?php echo 'precio'; ?></th>
			<th><?php echo 'creado'; ?></th>
			<th><?php echo 'provincia'; ?></th>
			<th><?php echo 'usuario'; ?></th>
			<th class="actions"><?php echo __('Opciones'); ?></th>
	</tr>
	<?php foreach ($anuncios as $anuncio): ?>
	<tr>
	    <?php if (isset($anuncio['Foto'][0])):?>
	    <td><img src="/cakeSegundamano/files/<?php echo $anuncio['Foto'][0]['nombre_archivo'];?>" width="100"/></td>
		<?php endif; ?>
		<?php if (!isset($anuncio['Foto'][0])):?>
		<td><?php echo 'No Imagen'; ?>
		<?php endif; ?>
		<td><?php echo h($anuncio['nombre']); ?>&nbsp;</td>
		<td><?php echo $anuncio['descripcion']; ?>&nbsp;</td>
		<td><?php echo h($anuncio['precio']); ?>&nbsp;</td>
		<td><?php echo h($anuncio['created']); ?>&nbsp;</td>
		
		<td>
			<?php echo h($anuncio['Province']['provincia']); ?>
		</td>
		<td>
			<?php echo h($anuncio['User']['email']); ?>
		</td>
		<td class="actions">

			<?php echo $this->Html->link(__('Ver'), array('controller'=>'anuncios','action' => 'view', $anuncio['id'])); ?>
			<?php if (AuthComponent::user('id')==$anuncio['user_id']):?>
			<?php echo $this->Html->link(__('Editar'), array('controller'=>'anuncios','action' => 'edit', $anuncio['id'])); ?>
			<?php echo $this->Form->postLink(__('Borrar'), array('controller'=>'anuncios','action' => 'delete', $anuncio['id']), null, __('Are you sure you want to delete # %s?', $anuncio['id'])); ?>
			<?php endif; ?>
		</td>
	</tr>
<?php endforeach; ?>
  
	</table>
	
</div>
<div class="actions">
	<h3><?php echo __(''); ?></h3>
	<ul>
	    <li><?php echo $this->Html->link(__('Ver todos los anuncios'), array('controller'=>'anuncios','action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('Nuevo Anuncio'), array('controller'=>'anuncios','action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Provincias'), array('controller'=>'provinces','action' => 'index')); ?>
        </li>
		<li><?php echo $this->Html->link(__('Favoritos'), array('action' => 'index')); ?></li>
	</ul>
</div>
