<?php
App::uses('AppController', 'Controller');
/**
 * Favoritos Controller
 *
 * @property Favorito $Favorito
 * @property PaginatorComponent $Paginator
 */
class FavoritosController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->loadModel('Anuncio');
		$this->Favorito->recursive = 2;
		$user_id=$this->Auth->user('id');
		$favoritos=$this->Favorito->findAllByUserId($user_id);
		//pr($favoritos);die();
		$anuncios = array();
		foreach ($favoritos as $anuncio)
			$anuncios[]=$anuncio['Anuncio'];
		$this->set('anuncios', $anuncios);
	}

/**
 * add method
 *
 * @return void
 */

	
	public function add($user_id=null,$anuncio_id=null) {
		$this->layout='ajax';
		$comprobar=true;
		if($user_id==$this->Auth->user('id')){
			$favoritos=$this->Favorito->findAllByUserId($user_id);
			foreach ($favoritos as $favorito){
				// pr($favorito['Favorito']['anuncio_id']);die();
				if($favorito['Favorito']['anuncio_id']==$anuncio_id){
					$comprobar=false;
				}
			}
			if($comprobar){
				$datos=array('user_id'=>$user_id,'anuncio_id'=>$anuncio_id);
				$this->Favorito->create();
				if ($this->Favorito->save($datos)) {
					$mensaje=$this->Favorito->id;
					$this->set('mensaje',$mensaje);
				} else {
					$mensaje= 'error';
					$this->set('mensaje',$mensaje);
				}
			}
		}
	}
	
	
	
	

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	
	
	public function deleteFavorito($id = null) {
		$this->Favorito->id = $id;
		$favorito=$this->Favorito->findById($id);
		$this->layout='ajax';
		if($favorito['Favorito']['user_id']==$this->Auth->user('id')){
			//$this->request->onlyAllow('post', 'delete');
			if ($this->Favorito->delete($this->Favorito->id)) {
				$mensaje='ok';
				$this->set('mensaje',$mensaje);
			} else {
				$mensaje= 'error';
				$this->set('mensaje',$mensaje);
	
			}
		}
	}}
