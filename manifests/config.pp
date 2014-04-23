# == Class: foreman::config
#
# === Authors
#
# Raymond Kristiansen <raymond@uib.no>
#
class foreman::config(
  $settings = $foreman::settings,
  $email = $foreman::email,
  $web_service = $foreman::web_service
) {

  file { "settings.yaml":
    path    => "/etc/foreman/settings.yaml",
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/settings.yaml.erb"),
    notify  => $web_service? { false => undef, default => Service[$web_service] }
  }

  if $email {
    file { "foreman/email.yaml":
      path    => "/etc/foreman/email.yaml",
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => "puppet:///modules/${module_name}/email.${email}.yaml",
      notify  => $web_service? { false => undef, default => Service[$web_service] }
    }
  } else {
    file { "foreman/email.yaml":
      path    => "/etc/foreman/email.yaml",
      ensure  => absent
    }
  }

}