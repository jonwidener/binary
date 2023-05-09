require_relative "./binary"

class BinaryAnd < Binary
  def exec i
    @args.map { |arg| arg[i] }.all? '1'
  end
end

