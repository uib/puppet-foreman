# TheForeman puppet module
Puppet module for management of a theforeman instance

The Foreman can be found at http://www.theforeman.org

## Usage
Simple bootstrap
<pre>
class { 'foreman': 
  web_service => 'httpd'
}
</pre>

## Not managed
This module does not manage:
* package repo (See http://yum.theforeman.org)
* database.yaml settings (default uses sqlite)
* mod_passenger and apache httpd with vhost config

## Tested
This module is tested with RHEL/CentOS 6.5 and theforeman version 1.3+

## Author
Raymond Kristiansen <raymond@uib.no>
