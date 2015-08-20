define dropbox::synced_file (String[1] $path = $title) {
  exec { "Check for sync of $path":
    onlyif => "test -e '$path'",
    cmd    => 'true'
  }
}
