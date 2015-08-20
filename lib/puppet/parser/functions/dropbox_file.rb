Puppet::Parser::Functions::newfunction(:dropbox_file, :type => :rvalue) do |args|
  raise(Puppet::ParseError, 'Provide a single path') if args.size != 1
  path = lookupvar('dropbox::dropbox_root') + '/' + args.first
  File.read(path)
end
