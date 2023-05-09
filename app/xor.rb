require_relative "./binary"

class BinaryXor < Binary
  def exec i
    @args.map { |arg| arg[i] }.reduce { |arg, res = '0'| (arg != res and [arg, res].include? '1') ? '1' : '0' } == '1'
  end
end

