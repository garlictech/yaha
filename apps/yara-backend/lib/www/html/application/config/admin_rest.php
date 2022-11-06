<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| HTTP protocol
|--------------------------------------------------------------------------
|
| Should the service accept only HTTPS requests or not?
|
|	Default: FALSE
|
*/
$config['force_https'] = FALSE;

/*
|--------------------------------------------------------------------------
| admin_rest Format
|--------------------------------------------------------------------------
|
| What format should the data be returned in by default?
|
|	Default: xml
|
*/
$config['admin_rest_default_format'] = 'json';

/*
|--------------------------------------------------------------------------
| admin_rest Status field name
|--------------------------------------------------------------------------
|
| The field name for the status of the response
|
|	'status'
|
*/
$config['admin_rest_status_field_name'] = 'status';

/*
|--------------------------------------------------------------------------
| admin_rest message field name
|--------------------------------------------------------------------------
|
| The field name for the message inside the response
|
|	'error'
|
*/
$config['admin_rest_message_field_name'] = 'error';

/*
|--------------------------------------------------------------------------
| Enable emulate request
|--------------------------------------------------------------------------
|
| Should we enable emulation of the request (e.g. used in Mootools request)?
|
|	Default: false
|
*/
$config['enable_emulate_request'] = TRUE;


/*
|--------------------------------------------------------------------------
| admin_rest Realm
|--------------------------------------------------------------------------
|
| Name for the password protected admin_rest API displayed on login dialogs
|
|	E.g: My Secret admin_rest API
|
*/
$config['admin_rest_realm'] = 'admin_rest API';

/*
|--------------------------------------------------------------------------
| admin_rest Login
|--------------------------------------------------------------------------
|
| Is login required and if so, which type of login?
|
|	'' = no login required, 'basic' = unsecure login, 'digest' = more secure login,
|	'session' = check for PHP session variable. Set variable name below.
|
*/
$config['admin_rest_auth'] = false;

/*
|--------------------------------------------------------------------------
| admin_rest Login
|--------------------------------------------------------------------------
|
| Is login required and if so, which user store do we use?
|
|	'' = use config based users, 'ldap' = use LDAP authencation, 'library' = use a authentication library
|	If 'admin_rest_auth' is 'session' then set 'auth_source' to the name of the session variable to check for.
|
*/
$config['auth_source'] = 'ldap';

/*
|--------------------------------------------------------------------------
| admin_rest Login
|--------------------------------------------------------------------------
|
| If library authentication is used define the class and function name here
|
| The function should accept two parameters: class->function($username, $password)
| In other cases override the function _perform_library_auth in your controller
|
*/
$config['auth_library_class'] = '';
$config['auth_library_function'] = '';

/*
|--------------------------------------------------------------------------
| Override auth types for specific class/method
|--------------------------------------------------------------------------
|
| Set specific authentication types for methods within a class (controller)
|
| Set as many config entries as needed.  Any methods not set will use the default 'admin_rest_auth' config value.
|
| example:
|
|			$config['auth_override_class_method']['deals']['view'] = 'none';
|			$config['auth_override_class_method']['deals']['insert'] = 'digest';
|			$config['auth_override_class_method']['accounts']['user'] = 'basic';
|
| Here 'deals' and 'accounts' are controller names, 'view', 'insert' and 'user' are methods within. (NOTE: leave off the '_get' or '_post' from the end of the method name)
| Acceptable values are; 'none', 'digest' and 'basic'.
|
*/
// $config['auth_override_class_method']['deals']['view'] = 'none';
// $config['auth_override_class_method']['deals']['insert'] = 'digest';
// $config['auth_override_class_method']['accounts']['user'] = 'basic';

/*
|--------------------------------------------------------------------------
| admin_rest Login usernames
|--------------------------------------------------------------------------
|
| Array of usernames and passwords for login, if ldap is configured this is ignored
|
|	array('admin' => '1234')
|
*/
$config['admin_rest_valid_logins'] = array('admin' => '1234');

/*
|--------------------------------------------------------------------------
| Global IP Whitelisting
|--------------------------------------------------------------------------
|
| Limit connections to your admin_rest server to whitelisted IP addresses.
|
| Usage:
| 1. Set to true *and* select an auth option for extreme security (client's IP
|	 address must be in whitelist and they must also log in)
| 2. Set to true with auth set to false to allow whitelisted IPs access with no login.
| 3. Set to false here but set 'auth_override_class_method' to 'whitelist' to
|	 admin_restrict certain methods to IPs in your whitelist
|
*/
$config['admin_rest_ip_whitelist_enabled'] = false;

/*
|--------------------------------------------------------------------------
| admin_rest IP Whitelist
|--------------------------------------------------------------------------
|
| Limit connections to your admin_rest server to a comma separated
| list of IP addresses
|
| Example: $config['admin_rest_ip_whitelist'] = '123.456.789.0, 987.654.32.1';
|
| 127.0.0.1 and 0.0.0.0 are allowed by default.
|
*/
$config['admin_rest_ip_whitelist'] = '';

/*
|--------------------------------------------------------------------------
| Global IP Blacklisting
|--------------------------------------------------------------------------
|
| Prevent connections to your admin_rest server from blacklisted IP addresses.
|
| Usage:
| 1. Set to true *and* add any IP address to "admin_rest_ip_blacklist" option
|
*/
$config['admin_rest_ip_blacklist_enabled'] = false;

/*
|--------------------------------------------------------------------------
| admin_rest IP Blacklist
|--------------------------------------------------------------------------
|
| Block connections from these IP addresses.
|
| Example: $config['admin_rest_ip_blacklist'] = '123.456.789.0, 987.654.32.1';
|
|
*/
$config['admin_rest_ip_blacklist'] = '';

/*
|--------------------------------------------------------------------------
| admin_rest Database Group
|--------------------------------------------------------------------------
|
| Connect to a database group for keys, logging, etc. It will only connect
| if you have any of these features enabled.
|
|	'default'
|
*/
$config['admin_rest_database_group'] = 'default';

/*
|--------------------------------------------------------------------------
| admin_rest API Keys Table Name
|--------------------------------------------------------------------------
|
| The table name in your database that stores API Keys.
|
|	'keys'
|
*/
$config['admin_rest_keys_table'] = 'keys';

/*
|--------------------------------------------------------------------------
| admin_rest Enable Keys
|--------------------------------------------------------------------------
|
| When set to true admin_rest_Controller will look for a key and match it to the DB.
| If no key is provided, the request will return an error.
|
|	FALSE

	CREATE TABLE `keys` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `key` varchar(40) NOT NULL,
	  `level` int(2) NOT NULL,
	  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
	  `is_private_key` tinyint(1)  NOT NULL DEFAULT '0',
	  `ip_addresses` TEXT NULL DEFAULT NULL,
	  `date_created` int(11) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
|
*/
$config['admin_rest_enable_keys'] = FALSE;

/*
|--------------------------------------------------------------------------
| admin_rest Table Key Column Name
|--------------------------------------------------------------------------
|
| If you are not using the default table schema as shown above, what is the
| name of the db column that holds the api key value?
|
*/
$config['admin_rest_key_column'] = 'key';

/*
|--------------------------------------------------------------------------
| admin_rest Key Length
|--------------------------------------------------------------------------
|
| How long should created keys be? Double check this in your db schema.
|
|	Default: 32
|	Max: 40
|
*/
$config['admin_rest_key_length'] = 40;

/*
|--------------------------------------------------------------------------
| admin_rest API Key Variable
|--------------------------------------------------------------------------
|
| Which variable will provide us the API Key
|
| Default: X-API-KEY
|
*/
$config['admin_rest_key_name'] = 'X-API-KEY';

/*
|--------------------------------------------------------------------------
| admin_rest API Logs Table Name
|--------------------------------------------------------------------------
|
| The table name in your database that stores logs.
|
|	'logs'
|
*/
$config['admin_rest_logs_table'] = 'logs';

/*
|--------------------------------------------------------------------------
| admin_rest Enable Logging
|--------------------------------------------------------------------------
|
| When set to true admin_rest_Controller will log actions based on key, date,
| time and IP address. This is a general rule that can be overridden in the
| $this->method array in each controller.
|
|	FALSE
|
	CREATE TABLE `logs` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `uri` varchar(255) NOT NULL,
	  `method` varchar(6) NOT NULL,
	  `params` text DEFAULT NULL,
	  `api_key` varchar(40) NOT NULL,
	  `ip_address` varchar(45) NOT NULL,
	  `time` int(11) NOT NULL,
	  `rtime` float DEFAULT NULL,
	  `authorized` tinyint(1) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
|
*/
$config['admin_rest_enable_logging'] = FALSE;


/*
|--------------------------------------------------------------------------
| admin_rest API Access Table Name
|--------------------------------------------------------------------------
|
| The table name in your database that stores the access controls.
|
|	'access'
|
*/
$config['admin_rest_access_table'] = 'access';

/*
|--------------------------------------------------------------------------
| admin_rest Method Access Control 
|--------------------------------------------------------------------------
|
| When set to true admin_rest_Controller will check the access table to see if 
| the API KEY can access that controller.  admin_rest_enable_keys *must* be enabled
| to use this. 
|
|	FALSE
|
CREATE TABLE `access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
|
*/
$config['admin_rest_enable_access'] = FALSE;


/*
|--------------------------------------------------------------------------
| admin_rest API Param Log Format
|--------------------------------------------------------------------------
|
| When set to true API log params will be stored in the database as JSON,
| when false they will be php serialized.
|
*/
$config['admin_rest_logs_json_params'] = FALSE;

/*
|--------------------------------------------------------------------------
| admin_rest API Limits Table Name
|--------------------------------------------------------------------------
|
| The table name in your database that stores limits.
|
|	'logs'
|
*/
$config['admin_rest_limits_table'] = 'limits';

/*
|--------------------------------------------------------------------------
| admin_rest Enable Limits
|--------------------------------------------------------------------------
|
| When set to true admin_rest_Controller will count the number of uses of each method
| by an API key each hour. This is a general rule that can be overridden in the
| $this->method array in each controller.
|
|	FALSE
|
	CREATE TABLE `limits` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `uri` varchar(255) NOT NULL,
	  `count` int(10) NOT NULL,
	  `hour_started` int(11) NOT NULL,
	  `api_key` varchar(40) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
|
*/
$config['admin_rest_enable_limits'] = FALSE;

/*
|--------------------------------------------------------------------------
| admin_rest Ignore HTTP Accept
|--------------------------------------------------------------------------
|
| Set to TRUE to ignore the HTTP Accept and speed up each request a little.
| Only do this if you are using the $this->admin_rest_format or /format/xml in URLs
|
|	FALSE
|
*/
$config['admin_rest_ignore_http_accept'] = FALSE;

/*
|--------------------------------------------------------------------------
| admin_rest AJAX Only
|--------------------------------------------------------------------------
|
| Set to TRUE to only allow AJAX requests. If TRUE and the request is not
| coming from AJAX, a 505 response with the error message "Only AJAX
| requests are accepted." will be returned. This is good for production
| environments. Set to FALSE to also accept HTTP requests.
|
|	FALSE
|
*/
$config['admin_rest_ajax_only'] = FALSE;

/* End of file config.php */
/* Location: ./system/application/config/admin_rest.php */
