# == Class: foreman::install
#
# === Authors
#
# Raymond Kristiansen <raymond@uib.no>
#
class foreman::install(
  $packages       = $foreman::packages,
  $web_service    = $foreman::web_service
) {

  package {
    $packages:
      ensure => latest,
      notify => Exec['foreman-rake'],
  }

  exec { 'foreman-rake':
    provider => 'shell',
    command => 'foreman-rake db:migrate && foreman-rake db:seed && foreman-rake tmp:cache:clear && foreman-rake tmp:sessions:clear',
    user => 'root',
    path => '/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
    refreshonly => true,
    notify => $web_service? { false => undef, default => Service[$web_service] }
  }

}
