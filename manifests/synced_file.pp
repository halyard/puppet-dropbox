# Type for confirming if a synced file exists
define dropbox::synced_file (String[1] $path = $title) {
  $full_path = "${dropbox::dropbox_root}/${path}"
  exec { "Check for sync of ${path}":
    onlyif => "test -e '${path}'",
    cmd    => 'uptime'
  }
}
