<div class="cakeFavoritos form">
<?php echo $this->Form->create('CakeFavorito'); ?>
	<fieldset>
		<legend><?php echo __('Edit Cake Favorito'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('user_id');
		echo $this->Form->input('anuncio_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('CakeFavorito.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('CakeFavorito.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Cake Favoritos'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Users'), array('controller' => 'users', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User'), array('controller' => 'users', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Anuncios'), array('controller' => 'anuncios', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Anuncio'), array('controller' => 'anuncios', 'action' => 'add')); ?> </li>
	</ul>
</div>
