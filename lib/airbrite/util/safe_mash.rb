module Hashie
  class SafeMash < Hashie::Mash
    protected
    def convert_value(val, duping=false) #:nodoc:
      case val
        when self.class
          val.dup
        when Hash
          duping ? val.dup : val
        when ::Hash
          val = val.dup if duping

          # by default, Mash self-propagates the current class
          # this is pretty undesirable behavior IMO
          Hashie::SafeMash.new(val)

          # this is how the code normally looks here:
          # self.class.new(val)
        when Array
          val.collect{ |e| convert_value(e) }
        else
          val
      end
    end
  end
end
