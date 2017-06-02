<div class="provinces index">
	<h2><?php echo __('Provincias'); ?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			
			<th><?php echo $this->Paginator->sort('provincia'); ?></th>
			<th class="actions"><?php echo __(''); ?></th>
	</tr>
    
    
	
	<?php foreach ($provinces as $province): ?>
	<tr>
		
		<td><?php echo h($province['Province']['provincia']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('Ver Anuncios'), array('action' => 'view', $province['Province']['id'])); ?>
          			
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
		
		<li><?php echo $this->Html->link(__('Ver Todos los Anuncios'), array('controller' => 'anuncios', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('Nuevo Anuncio'), array('controller' => 'anuncios', 'action' => 'add')); ?> </li>
	</ul>
</div>
