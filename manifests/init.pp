# == Class: dropbox
#
# Full description of class dropbox here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class dropbox (
  $install_path = "/Users/${::boxen_user}/Applications/Dropbox.app"
) {
  package { 'dropbox-halyard':
    provider    => 'brewcask',
    require     => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { 'Dropbox':
    hidden => true,
    path   => $install_path
  } ~>
  exec { "launch dropbox":
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
