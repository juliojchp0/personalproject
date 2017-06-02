<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
	public $components = array('Paginator','Session',
			'Auth' => array(
					'loginAction' => array('controller'=>'users', 'action'=>'index'),
					'loginRedirect' => array('controller' => 'anuncios', 'action' => 'index'),
					'logoutRedirect' => array('controller' => 'users', 'action' => 'index'),
					'authError' => 'Debes estar identificado para acceder a esta p�gina',
					'loginError' => 'e-mail o password incorrectos..',
					'authenticate' => array(
							'Form' => array(
									'fields' => array('username' => 'email', 'password'=>'password'),
									'userModel'=>'User'
							)
					)
			));
}
