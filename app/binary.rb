class Binary
  attr_reader :length

  def initialize(*args)
    args = args[0] if args.length == 1 and args[0].kind_of?(Array)
    raise 'Not enough args' if args.length < 2
    args.each do |arg|
      raise "Arg: #{arg} is not an allowed type" unless arg.kind_of?(String) or arg.kind_of?(Integer)
      raise "Arg: #{arg} not binary string" unless not arg.kind_of?(String) or arg.match(/^[01]+$/)
    end
    
    args.map! { |arg| arg.kind_of?(String) ? arg : arg.to_s(2) }

    @length = args.map(&:length).max
    @args = args.map { |arg| arg.rjust(@length, '0') }
  end

  def self.method_missing *args
    require_relative "./#{args[0]}"
    bin = Object.const_get("Binary#{args[0].capitalize}").new args[1..-1].flatten
    result = ''
    (0...bin.length).each do |i|
      if bin.exec i 
        result << '1'
      else
        result << '0'
      end
    end
    result.match(/^0*([01]+)$/)[1]
  end
end
