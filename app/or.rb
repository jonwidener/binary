require_relative "./binary"

class BinaryOr < Binary
  def exec i
    @args.map { |arg| arg[i] }.any? '1'
  end
end

if __FILE__ == $0
  Binary.and('101', '11')
end
