<?php

/**
 * This class will create an e-mail object.
 *
 * @package		frontend
 * @subpackage	core
 *
 * @author		Davy Hellemans <davy@spoon-library.com>
 * @since		2.3
 */
class FrontendMail
{
	/**
	 * List of attachments
	 *
	 * @var	array
	 */
	protected $attachments = array();


	/**
	 * Body
	 *
	 * @var	string
	 */
	protected $body;


	/**
	 * From email
	 *
	 * @var	string
	 */
	protected $fromEmail;


	/**
	 * From name
	 *
	 * @var	string
	 */
	protected $fromName;


	/**
	 * Plain text
	 *
	 * @var	string
	 */
	protected $plainText;


	/**
	 * Reply to email
	 *
	 * @var	string
	 */
	protected $replyToEmail;


	/**
	 * Reply to name
	 *
	 * @var	string
	 */
	protected $replyToName;


	/**
	 * Subject
	 *
	 * @var	string
	 */
	protected $subject;


	/**
	 * Template location or content string.
	 *
	 * @var string
	 */
	protected $template;


	/**
	 * To email
	 *
	 * @var	string
	 */
	protected $toEmail;


	/**
	 * To name
	 *
	 * @var	string
	 */
	protected $toName;


	/**
	 * List of variables
	 *
	 * @var	array
	 */
	protected $variables = array();


	/**
	 * Class constructor.
	 *
	 * @return	void
	 * @param	array[optional] $options	Set of properties you want to set.
	 */
	public function __construct(array $options = array())
	{
		foreach($options as $option => $value)
		{
			$this->$option = $value;
		}
	}


	/**
	 * Add an attachment.
	 *
	 * @return	FrontendMail
	 * @param	string $filename	The full path to the file you want to attach.
	 */
	public function addAttachment($filename)
	{
		if(!file_exists($filename))
		{
			throw new FrontendException(sprintf('This file "%s" does not exist.', $filename));
		}
		$this->attachments[] = (string) $filename;
	}


	/**
	 * Add multiple attachments.
	 *
	 * @return	FrontendMail
	 * @param	array $attachments	An list of files (full path) you want to attach.
	 */
	public function addAttachments(array $attachments)
	{
		foreach($attachments as $attachment)
		{
			$this->addAttachment($attachment);
		}

		return $this;
	}


	/**
	 * Fetch all attachments.
	 *
	 * @return	array
	 */
	public function getAttachments()
	{
		return $this->attachments;
	}


	/**
	 * Fetch message.
	 *
	 * @return	string
	 */
	public function getBody()
	{
		return $this->body;
	}


	/**
	 * Fetch from email.
	 *
	 * @return	string
	 */
	public function getFromEmail()
	{
		return $this->fromEmail;
	}


	/**
	 * Fetch from name.
	 *
	 * @return	string
	 */
	public function getFromName()
	{
		return $this->fromName;
	}


	/**
	 * Fetch plain text.
	 *
	 * @return	string
	 */
	public function getPlainText()
	{
		return $this->plainText;
	}


	/**
	 * Fetch reply to email.
	 *
	 * @return	string
	 */
	public function getReplyToEmail()
	{
		return $this->replyToEmail;
	}


	/**
	 * Fetch reply to name.
	 *
	 * @return	string
	 */
	public function getReplyToName()
	{
		return $this->replyToName;
	}


	/**
	 * Fetch subject.
	 *
	 * @return	string
	 */
	public function getSubject()
	{
		return $this->subject;
	}


	/**
	 * Fetch template location.
	 *
	 * @return	string
	 */
	public function getTemplate()
	{
		return $this->template;
	}


	/**
	 * Fetch to email.
	 *
	 * @return	string
	 */
	public function getToEmail()
	{
		return $this->toEmail;
	}


	/**
	 * Fetch to name.
	 *
	 * @return	string
	 */
	public function getToName()
	{
		return $this->toName;
	}


	/**
	 * Fetch all variables.
	 *
	 * @return	array
	 */
	public function getVariables()
	{
		return $this->variables;
	}


	/**
	 * Sets the body.
	 *
	 * @return	FrontendMail
	 * @param	string $value		The body content.
	 */
	public function setBody($value)
	{
		if($this->template !== null)
		{
			throw new FrontendException('Either set a template or the body, but not both!');
		}

		$this->body = (string) $value;
		return $this;
	}


	/**
	 * Sets from details.
	 *
	 * @return	FrontendMail
	 * @param	string $email			The from email.
	 * @param	string[optional] $name	The from name.
	 */
	public function setFrom($email, $name = null)
	{
		$this->fromEmail = (string) $email;
		if($name !== null)
		{
			$this->fromName = (string) $name;
		}
	}


	/**
	 * Set plain text.
	 *
	 * @return	FrontendMail
	 * @param	string $value		The plain text version.
	 */
	public function setPlainText($value)
	{
		$this->plainText = (string) $value;
		return $this;
	}


	/**
	 * Set reply to.
	 *
	 * @return	FrontendMail
	 * @param	string $email			The reply to email.
	 * @param	string[optional] $name	The reply to name.
	 */
	public function setReplyTo($email, $name = null)
	{
		$this->replyToEmail = (string) $email;
		if($this->name !== null)
		{
			$this->replyToName = (string) $name;
		}

		return $this;
	}


	/**
	 * Set subject.
	 *
	 * @return	FrontendMail
	 * @param	string $value		The mail subject.
	 */
	public function setSubject($value)
	{
		$this->subject = strip_tags((string) $value);
		return $this;
	}


	/**
	 * Set template location or content string.
	 *
	 * @return	FrontendMail
	 * @param	string $template	The full template location.
	 */
	public function setTemplate($template)
	{
		if($this->body !== null)
		{
			throw new FrontendException('Either set a template or the body, but not both!');
		}

		$this->template = (string) $template;
		return $this;
	}


	/**
	 * Sets to details.
	 *
	 * @return	FrontendMail
	 * @param	string $email			The recipient email.
	 * @param	string[optional] $name	The recipient name.
	 */
	public function setTo($email, $name = null)
	{
		$this->toEmail = (string) $email;
		if($name !== null)
		{
			$this->toName = (string) $name;
		}
	}


	/**
	 * Sets a variable.
	 *
	 * @return	FrontendMail
	 * @param	string $name	The variable name.
	 * @param	mixed $value	The variable value.
	 */
	public function setVariable($name, $value)
	{
		$this->variables[(string) $name] = $value;
		return $this;
	}


	/**
	 * Set multiple variables.
	 *
	 * @return	FrontendMail
	 * @param	array $variables	An array with key/value variables.
	 */
	public function setVariables(array $variables)
	{
		$this->variables = $variables;
		return $this;
	}
}

?>