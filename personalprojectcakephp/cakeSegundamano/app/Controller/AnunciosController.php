<?php
App::uses('AppController', 'Controller');
/**
 * Anuncios Controller
 *
 * @property Anuncio $Anuncio
 * @property PaginatorComponent $Paginator
 */
class AnunciosController extends AppController {

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
		
		$this->Anuncio->recursive = 1;
		$this->Paginator->settings=array('limit'=>5);
		
		$this->set('anuncios', $this->Paginator->paginate());
	}
public function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->allow('view','index');
	}
/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->Anuncio->exists($id)) {
			throw new NotFoundException(__('Invalid anuncio'));
		}
		$options = array('conditions' => array('Anuncio.' . $this->Anuncio->primaryKey => $id));
		$this->set('anuncio', $this->Anuncio->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->loadModel('Foto');
		if ($this->request->is('post')) {
			//pr($this->request);die();
			$anuncio=array('nombre'=>$this->request->data['Anuncio']['nombre'],'descripcion'=>$this->request->data['Anuncio']['descripcion'],'precio'=>$this->request->data['Anuncio']['precio'],'province_id'=>$this->request->data['Anuncio']['province_id'],'user_id'=>$this->Auth->user('id'));
			
			$this->Anuncio->create();
			$this->Anuncio->save($this->request->data);
			$datos = array();
			foreach($this->request->data['nombre_archivo'] as $foto){
			move_uploaded_file($foto['tmp_name'], 'files/'.$foto['name']);
			$datos[] = array('nombre_archivo'=>$foto['name'],'principal'=>1,'anuncio_id'=>$this->Anuncio->id);
			//$this->Foto->create();
			//$this->Foto->save($datos)
			}
			$this->Foto->create();
			$this->Foto->saveMany($datos);
			return $this->redirect(array('action' => 'index'));
		}
		$provinces = $this->Anuncio->Province->find('list',array('fields'=>array ('provincia')));
		$users = $this->Auth->user('id');
		$this->set(compact('provinces', 'users'));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		
		$anuncio = $this->Anuncio->findById($id);
		if (AuthComponent::user('id')==$anuncio['Anuncio']['user_id']) {
			
			
			if (!$this->Anuncio->exists($id)) {
			throw new NotFoundException(__('Invalid anuncio'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Anuncio->save($this->request->data)) {
				$this->Session->setFlash(__('The anuncio has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The anuncio could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('Anuncio.' . $this->Anuncio->primaryKey => $id));
			$this->request->data = $this->Anuncio->find('first', $options);
		}
		$provinces = $this->Anuncio->Province->find('list');
		$users = $this->Anuncio->User->find('list');
		$users = $this->Anuncio->User->find('list');
		$this->set(compact('provinces', 'users', 'users'));
			
			
		}else{
			
			
			$this->Session->setFlash(__('The anuncio could not be edited. Please, try again.'));
			
			}
		
		
		
		
		
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		$this->Anuncio->id = $id;
		if (!$this->Anuncio->exists()) {
			throw new NotFoundException(__('Invalid anuncio'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ($this->Anuncio->delete()) {
			$this->Session->setFlash(__('The anuncio has been deleted.'));
		} else {
			$this->Session->setFlash(__('The anuncio could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}}
