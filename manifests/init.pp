# == Class: foreman
# 
# Install and setup for TheForeman from a package. The packages must be available before
# using this module. See yum.theforeman.org
# Require TheForeman version 1.3+
# 
# === Parameters
#
# [*packages*]
#   Array with all packages needed to run TheForeman. Packages for backend, providers, etc
#   must also be provided in this parameter.
#
# [*email*]
#   For local sendmail use 'exim' or 'sendmail'. For no email at all use false.
#
# [*web_service*]
#   Name of the web service used. E.G. httpd. Triggers notfiy on config change.
#
# [*settings*]
#   Should be all settings that need to be in settings.yaml.
#   Default values will not be used if this parameter is set.
#
# === Examples
#
#  class { 'foreman':
#    web_service => 'httpd'
#  }
#
# === Authors
#
# Raymond Kristiansen <raymond@uib.no>
#
class foreman(
  $packages               = ['foreman', 'foreman-sqlite', 'rubygem-passenger'],
  $email                  = false,
  $web_service            = false,
  $settings               = {
    'puppet_interval'                 => '30',
    'login'                           => 'true',
    'email_reply_address'             => 'Foreman-noreply@',
    'require_ssl'                     => 'false',
    'default_environment'             => 'production',
    'administrator'                   => "root@${::domain}",
    'update_environment_from_facts'   => 'false',
  }
) {

  class { 'foreman::install': } ->
  class { 'foreman::config': }
  
}