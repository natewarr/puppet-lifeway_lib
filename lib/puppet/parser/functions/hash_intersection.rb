module Puppet::Parser::Functions
  newfunction(:hash_intersection, :type => :rvalue, :doc => <<-EOS
This function returns the subset of hash a which includes only the 
keys of hash b or values of array b.

*EXAMPLES:*

  hash_intersection({a => 123, b => "string", c => "string1"}, {b => 123, c => "mystring"} )

Would return: {b => "string", c => "string1"}

Similiarly:

  hash_intersection({a => 123, b => "string", c => "string1"}, [b, c] )

Would return: {b => "string", c => "string1"}
    EOS
  ) do |args|

    #Two arguments required
    raise(Puppet::ParseError, "hash_intersection(): Wrong number of arguments " +
      "given (#{args.size} for 2)") if args.size != 2

    first = args[0]
    second = args[1]

    unless first.is_a?(Hash) && second.is_a?(Hash) || second.is_a?(Array)
      raise(Puppet::ParseError, 'hash_interesection(): Requires (Hash, Hash) or (Hash, Array)')
    end

    keepkeys = first.keys & ( second.is_a?(Array) ? second : second.keys )

    returnHash = {}

    keepkeys.each {|k| returnHash[k]=first[k]}

    return returnHash

  end
end
