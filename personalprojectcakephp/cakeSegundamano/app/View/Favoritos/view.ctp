<div class="cakeFavoritos view">
<h2><?php echo __('Cake Favorito'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($cakeFavorito['CakeFavorito']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('User'); ?></dt>
		<dd>
			<?php echo $this->Html->link($cakeFavorito['User']['id'], array('controller' => 'users', 'action' => 'view', $cakeFavorito['User']['id'])); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Anuncio'); ?></dt>
		<dd>
			<?php echo $this->Html->link($cakeFavorito['Anuncio']['id'], array('controller' => 'anuncios', 'action' => 'view', $cakeFavorito['Anuncio']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Cake Favorito'), array('action' => 'edit', $cakeFavorito['CakeFavorito']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Cake Favorito'), array('action' => 'delete', $cakeFavorito['CakeFavorito']['id']), null, __('Are you sure you want to delete # %s?', $cakeFavorito['CakeFavorito']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Cake Favoritos'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Cake Favorito'), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Users'), array('controller' => 'users', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User'), array('controller' => 'users', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Anuncios'), array('controller' => 'anuncios', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Anuncio'), array('controller' => 'anuncios', 'action' => 'add')); ?> </li>
	</ul>
</div>
