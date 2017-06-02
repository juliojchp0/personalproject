<div class="provinces view">
<h2><?php echo __('Provincia'); ?></h2>
	<dl>
		
		<dd>
			
		</dd>
		<dt></dt>
		<dd>
			<?php echo h($province['Province']['provincia']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<?php
$prov_img = Inflector::slug($province['Province']['provincia']);
echo $this->Html->image($prov_img . '.png', array('alt' => $province['Province']['provincia'], 'id' => 'imgProvincia'));
?>
<div class="actions">
	<h3><?php echo __(''); ?></h3>
	<ul>
		
		<li><?php echo $this->Html->link(__('Ver Provincias'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('Ver Todos los Anuncios'), array('controller' => 'anuncios', 'action' => 'index')); ?> </li>
		</ul>
</div>
<div class="related">
	<h3><?php echo __('Anuncios'); ?></h3>
	<?php if (!empty($province['Anuncio'])): ?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		
		<th><?php echo __('Nombre'); ?></th>
		<th><?php echo __('Descripcion'); ?></th>
		<th><?php echo __('Precio'); ?></th>
		<th><?php echo __('Fecha Creacion'); ?></th>
		
		<th class="actions"><?php echo __('Opciones'); ?></th>
	</tr>
	<?php foreach ($province['Anuncio'] as $anuncio): ?>
		<tr>
			
			<td><?php echo $anuncio['nombre']; ?></td>
			<td><?php echo $anuncio['descripcion']; ?></td>
			<td><?php echo $anuncio['precio']; ?></td>
			<td><?php echo $anuncio['created']; ?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('Ver'), array('controller' => 'anuncios', 'action' => 'view', $anuncio['id'])); ?>
                
				
                
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			
		</ul>
	</div>
</div>
