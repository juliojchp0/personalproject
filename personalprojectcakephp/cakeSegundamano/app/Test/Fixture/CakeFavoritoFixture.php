<?php
/**
 * CakeFavoritoFixture
 *
 */
class CakeFavoritoFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'key' => 'primary'),
		'user_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'key' => 'index'),
		'anuncio_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'key' => 'index'),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1),
			'cake_favorito_ibk_1_idx' => array('column' => 'anuncio_id', 'unique' => 0),
			'cake_favorito_ibk_2_idx' => array('column' => 'user_id', 'unique' => 0),
			'user_id' => array('column' => 'user_id', 'unique' => 0),
			'anuncio_id' => array('column' => 'anuncio_id', 'unique' => 0)
		),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_spanish2_ci', 'engine' => 'InnoDB')
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'id' => 1,
			'user_id' => 1,
			'anuncio_id' => 1
		),
	);

}
