require_relative "./binary"

class BinaryAnd < Binary
  def exec i
    @args.map { |arg| arg[i] }.all? '1'
  end
end

if __FILE__ == $0
  Binary.and('101', '11')
end
