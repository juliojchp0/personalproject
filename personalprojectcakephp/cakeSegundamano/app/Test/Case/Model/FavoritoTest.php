<?php
App::uses('Favorito', 'Model');

/**
 * Favorito Test Case
 *
 */
class FavoritoTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.favorito',
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
		$this->Favorito = ClassRegistry::init('Favorito');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Favorito);

		parent::tearDown();
	}

}
