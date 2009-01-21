<?php

/**
 * Spoon Library
 *
 * This source file is part of the Spoon Library. More information,
 * documentation and tutorials can be found @ http://www.spoon-library.be
 *
 * @package			webservices
 * @subpackage		icalendar
 *
 * @author			Davy Hellemans <davy@spoon-library.be>
 * @author 			Tijs Verkoyen <tijs@spoon-library.be>
 * @since			0.1.1
 */


/** Spoon class */
require_once 'spoon/spoon.php';

/** Spoon ICalendar execption class */
require_once 'spoon/webservices/icalendar/exception.php';


/**
 * This class provides the base methods used by iCalendar
 *
 * @package			webservices
 * @subpackage		icalendar
 *
 * @author 			Tijs Verkoyen <tijs@spoon-library.be>
 * @since			0.1.1
 */
class SpoonICalendar
{
	/**
	 * Events
	 *
	 * @var	array
	 */
	private $events = array();


	/**
	 * Product Identifier
	 *
	 * @var	string
	 */
	private $prodId;


	/**
	 * Version
	 *
	 * @var	string
	 */
	private $version = '2.0';


	/**
	 * Add an event
	 *
	 * @return	void
	 * @param	SpoonICalendarEvent $item
	 */
	public function addEvent(SpoonICalendarEvent $item)
	{
		$this->events[] = $item;
	}


	/**
	 * Adds multiple events
	 *
	 * @return	void
	 */
	public function addEvents()
	{
		// fetch arguments
		$arguments = func_get_args();

		// loop arguments
		foreach($arguments as $item)
		{
			$this->addEvent($item);
		}
	}


	/**
	 * Get all event-objects
	 *
	 * @return	array
	 */
	public function getEvents()
	{
		return (array) $this->events;
	}


	/**
	 * Get product indentifier
	 *
	 * @return	string
	 */
	public function getProductIdentifier()
	{
		return ($this->prodId == '') ? 'Spoon v'. SPOON_VERSION : $this->prodId;
	}


	/**
	 * Get version
	 *
	 * @return	string
	 */
	public function getVersion()
	{
		return $this->version;
	}


	/**
	 * Returns iCalendar content
	 *
	 * @return	string
	 */
	public function parse()
	{
		// init var
		$string = '';

		// start string
		$string .= "BEGIN:VCALENDAR\n";

		// set version
		$string .= 'VERSION:'. $this->getVersion() ."\n";

		// set product identifier
		$string .= 'PRODID:-//'. $this->getProductIdentifier() .'//EN' ."\n";
		$string .= "CALSCALE:GREGORIAN\n";
		$string .= "METHOD:PUBLISH\n";

		// loop all events
		foreach($this->getEvents() as $event) $string .= $event->parse();

		// end string
		$string .= 'END:VCALENDAR';

		// return
		return $string;
	}


	/**
	 * Set product identifier
	 *
	 * @return	void
	 * @param	string $value
	 */
	public function setProductIdentifier($value)
	{
		$this->prodId = (string) $value;
	}


	/**
	 * Set version
	 *
	 * @return	void
	 * @param	string[optional] $value
	 */
	public function setVersion($value = '2.0')
	{
		$this->version = (string) $value;
	}
}

?>