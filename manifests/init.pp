# == Class: dropbox
#
# Install and configure Dropbox
#
# === Parameters
#
class dropbox (
  $install_path = "/Users/${::boxen_user}/Applications/Dropbox.app",
  $dropbox_root = "/Users/${::boxen_user}/Dropbox"
) {
  package { 'dropbox-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { 'Dropbox':
    hidden => true,
    path   => $install_path
  } ~>
  exec { 'launch dropbox':
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
