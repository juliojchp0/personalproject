<script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script>
        tinymce.init({selector:'textarea'});
</script>


<div class="anuncios form">
<?php echo $this->Form->create('Anuncio'); ?>
	<fieldset>
		<legend><?php echo __('Editar Anuncio'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('nombre');
		echo $this->Form->input('descripcion');
		echo $this->Form->input('precio');
		//echo $this->Form->input('fecha_creacion');
		echo $this->Form->input('province_id',array(
    'options' => array('','Ciudad Real' ,'Albacete','Toledo','Guadalajara','Cuenca')));
		//echo $this->Form->input('user_id');
		//echo $this->Form->input('User');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Enviar')); ?>
</div>
<div class="actions">
	<h3><?php echo __(''); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Borrar Anuncio'), array('action' => 'delete', $this->Form->value('Anuncio.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Anuncio.id'))); ?></li>
		<li><?php echo $this->Html->link(__('Ver Anuncios'), array('action' => 'index')); ?></li>
		
	</ul>
</div>
