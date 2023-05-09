require_relative "./binary"

class BinaryOr < Binary
  def exec i
    @args.map { |arg| arg[i] }.any? '1'
  end
end

