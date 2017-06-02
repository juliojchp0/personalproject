<div class="anuncios index">
	<h2><?php echo __('Anuncios');//pr($anuncios); die(); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo'Foto'; ?></th>
			<th><?php echo $this->Paginator->sort('nombre'); ?></th>
			<th><?php echo $this->Paginator->sort('descripcion'); ?></th>
			<th><?php echo $this->Paginator->sort('precio'); ?></th>
			<th><?php echo $this->Paginator->sort('creado'); ?></th>
			<th><?php echo $this->Paginator->sort('provincia'); ?></th>
			<th><?php echo $this->Paginator->sort('usuario'); ?></th>
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
		<td><?php echo h($anuncio['Anuncio']['nombre']); ?>&nbsp;</td>
		<td><?php echo $anuncio['Anuncio']['descripcion']; ?>&nbsp;</td>
		<td><?php echo h($anuncio['Anuncio']['precio']); ?>&nbsp;</td>
		<td><?php echo h($anuncio['Anuncio']['created']); ?>&nbsp;</td>
		
		<td>
			<?php echo h($anuncio['Province']['provincia']); ?>
		</td>
		<td>
			<?php echo h($anuncio['User']['email']); ?>
		</td>
		<td class="actions">

			<?php echo $this->Html->link(__('Ver'), array('action' => 'view', $anuncio['Anuncio']['id'])); ?>
			<?php if (AuthComponent::user('id')==$anuncio['Anuncio']['user_id']):?>
			<?php echo $this->Html->link(__('Editar'), array('action' => 'edit', $anuncio['Anuncio']['id'])); ?>
			<?php echo $this->Form->postLink(__('Borrar'), array('action' => 'delete', $anuncio['Anuncio']['id']), null, __('Are you sure you want to delete # %s?', $anuncio['Anuncio']['id'])); ?>
			<?php endif; ?>
		</td>
	</tr>
<?php endforeach; ?>
  
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>
	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('previous'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('next') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>
<div class="actions">
	<h3><?php echo __(''); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Nuevo Anuncio'), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('Provincias'), array('controller'=>'provinces','action' => 'index')); ?>
        </li>
		<li><?php echo $this->Html->link(__('Favoritos'), array('controller'=>'favoritos','action' => 'index')); ?></li>
	</ul>
</div>
