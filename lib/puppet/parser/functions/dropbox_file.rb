Puppet::Parser::Functions::newfunction(:dropbox_file, :type => :rvalue) do |args|
  raise(Puppet::ParseError, 'Provide a single path') if args.size != 1
  File.read(args.first)
end
