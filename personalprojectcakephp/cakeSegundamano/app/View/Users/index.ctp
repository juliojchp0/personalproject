<div id="comunidad">

<?php echo $this->Html->image('/app/webroot/files/comunidad.jpg', array('url' => array('controller' => 'provinces', 'action' => 'index'))); ?> 
</div>

<div class="users index">
	
	<?php echo $this->Form->create('User');
	echo $this->Session->flash('auth'); ?>
	<fieldset>
		<legend><?php echo __('SegundaMano Castilla La Mancha'); ?></legend>
	<table>
		<tr>

	
		<td><?php echo $this->Form->input('email');?></td>
		<td><?php echo $this->Form->input('password'); ?></td>
		
		</tr>

	</table>
	
	</fieldset>
	<?php echo $this->Form->end(__('Enviar')); echo $this->Html->link('Registrarse',array('controller'=>'users','action'=>'add')) ?>
</div>

