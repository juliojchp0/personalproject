<div class="users form">
<?php echo $this->Form->create('User'); ?>
	<fieldset>
		<legend><?php echo __('Insertar Usuario'); ?></legend>
	<?php
	
		echo $this->Form->input('email');
		echo $this->Form->input('password');
		echo $this->Form->input('nombre');
		echo $this->Form->input('apellidos');
		echo $this->Form->input('provincia');
		echo $this->Form->input('ciudad');
		echo $this->Form->input('telefono');
		echo $this->Form->input('fecha_nacimiento');
		
		
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>

<div class="actions">
	
</div>
