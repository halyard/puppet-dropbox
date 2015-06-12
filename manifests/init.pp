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
) {
  package { 'dropbox-halyard':
    provider    => 'brewcask',
    require     => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { 'dropbox-halyard':
    hidden => true,
    path   => "/Users/${::boxen_user}/Applications/Dropbox.app"
  }
}
