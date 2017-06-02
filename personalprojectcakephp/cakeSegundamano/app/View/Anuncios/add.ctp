<script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script>
        tinymce.init({selector:'textarea'});
</script>

<div class="anuncios form">
<?php echo $this->Form->create('Anuncio', array('type' => 'file')); ?>
	<fieldset>
		<legend><?php echo __('Insertar Anuncio'); ?></legend>
	<?php
		echo $this->Form->input('nombre');
		echo $this->Form->input('descripcion', array('required'=>'none'));
		echo $this->Form->input('precio');
		echo $this->Form->input('province_id');
		echo $this->Form->hidden('user_id',array('value'=>$users));
		echo '<h3>Foto Principal</h3>';
		echo $this->Form->file('nombre_archivo',array('multiple'=>'true','name'=>'data[nombre_archivo][]'));
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>

</div>

<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Ver Anuncios'), array('action' => 'index')); ?></li>
		
	</ul>
</div>


