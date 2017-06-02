<div class="provinces form">
<?php echo $this->Form->create('Province'); ?>
	<fieldset>
		<legend><?php echo __('Add Province'); ?></legend>
	<?php
		echo $this->Form->input('provincia');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Ver Provincias'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('Ver Anuncios'), array('controller' => 'anuncios', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('Nuevo Anuncio'), array('controller' => 'anuncios', 'action' => 'add')); ?> </li>
	</ul>
</div>
