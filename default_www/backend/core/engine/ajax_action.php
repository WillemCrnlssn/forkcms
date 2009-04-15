<?php

/**
 * BackendBaseAction
 *
 * This class is the real code for Fork, it creates an action, loads the configfile, ...
 *
 * @package		Backend
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@netlash.com>
 * @since		2.0
 */
class BackendAJAXAction
{
	/**
	 * The current action
	 *
	 * @var	string
	 */
	private $action;


	/**
	 * The config file
	 *
	 * @var	BackendBaseConfig
	 */
	private $config;


	/**
	 * The current module
	 *
	 * @var	string
	 */
	private $module;


	/**
	 * Default constructor
	 * You have to specify the action and module so we know what to do with this instance
	 *
	 * @return	void
	 * @param	string $action
	 * @param	string $module
	 */
	public function __construct($action, $module)
	{
		// set properties
		$this->setModule((string) $module);
		$this->setAction((string) $action);

		// load the configfile for the required module
		$this->loadConfig();

		// get linked modules
		$aLinkedActions = $this->config->getLinkedAction($this->getAction());

		// if there are no linked action this is invalid by default
		if($aLinkedActions === false)
		{
			// set correct headers
			SpoonHTTP::setHeadersByCode(403);

			// throw an exception, when debug is on we get a descent message
			throw new BackendException('Not allowed action.');
		}

		// init var
		$allowed = false;

		// loop linked actions
		foreach((array) $aLinkedActions as $action)
		{
			//
			if(BackendAuthentication::isAllowedAction($action, $this->getModule())) $allowed = true;
		}

		// is this an allowed AJAX-action?
		if(!$allowed)
		{
			// set correct headers
			SpoonHTTP::setHeadersByCode(403);

			// throw an exception, when debug is on we get a descent message
			throw new BackendException('Not allowed action.');
		}
	}


	/**
	 * Execute the action
	 * We will build the classname, require the class and call the execute method.
	 *
	 * @return	void
	 */
	public function execute()
	{
		// build action-class-name
		$actionClassName = SpoonFilter::toCamelCase($this->getModule() .'_ajax_'. $this->getAction());

		// require the config file, we know it is there because we validated it before (possible actions are defined by existance off the file).
		require_once BACKEND_MODULE_PATH .'/ajax/'. $this->getAction() .'.php';

		// validate if class exists (aka has correct name)
		if(!class_exists($actionClassName)) throw new BackendException('The actionfile is present, but the classname should be: '. $actionClassName .'.');

		// create action-object
		$object = new $actionClassName($this->getAction(), $this->getModule());

		// call the execute method of the real action (defined in the module)
		$object->execute();
	}



	/**
	 * Get the current action
	 * REMARK: You should not use this method from your code, but it has to be public so we can access it later on in the core-code
	 *
	 * @return	string
	 */
	public function getAction()
	{
		return (string) $this->action;
	}


	/**
	 * Get the current module
	 * REMARK: You should not use this method from your code, but it has to be public so we can access it later on in the core-code
	 *
	 * @return	string
	 */
	public function getModule()
	{
		return (string) $this->module;
	}


	/**
	 * Load the config file for the requested module.
	 * In the config file we have to find dissabled actions, the constructor will read the folder and set possible actions
	 * Other configurations will be stored in it also.
	 *
	 * @return	void
	 */
	public function loadConfig()
	{
		// build path to the module and define it. This is a constant because we can use this in templates.
		define('BACKEND_MODULE_PATH', BACKEND_MODULES_PATH .'/'. $this->getModule());

		// check if the config is present? If it isn't present there is a huge problem, so we will stop our code by throwing an error
		if(!SpoonFile::exists(BACKEND_MODULE_PATH .'/config.php')) throw new BackendException('The configfile for the module ('. $this->getModule() .') can\'t be found.');

		// build config-object-name
		$configClassName = SpoonFilter::toCamelCase($this->getModule() .'_config');

		// require the config file, we validated before for existence.
		require_once BACKEND_MODULE_PATH .'/config.php';

		// validate if class exists (aka has correct name)
		if(!class_exists($configClassName)) throw new BackendException('The config file is present, but the classname should be: '. $configClassName .'.');

		// create config-object, the constructor will do some magic
		$this->config = new $configClassName;
	}


	/**
	 * Set the action
	 *
	 * @return	void
	 * @param	string $action
	 */
	private function setAction($action)
	{
		$this->action = (string) $action;
	}


	/**
	 * Set the module
	 *
	 * @return	void
	 * @param	string $module
	 */
	private function setModule($module)
	{
		$this->module = (string) $module;
	}
}

?>