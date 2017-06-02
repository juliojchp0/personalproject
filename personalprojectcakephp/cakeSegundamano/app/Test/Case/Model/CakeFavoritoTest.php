<?php
App::uses('CakeFavorito', 'Model');

/**
 * CakeFavorito Test Case
 *
 */
class CakeFavoritoTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.cake_favorito',
		'app.user',
		'app.anuncio',
		'app.province',
		'app.foto',
		'app.anuncios_user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->CakeFavorito = ClassRegistry::init('CakeFavorito');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->CakeFavorito);

		parent::tearDown();
	}

}
