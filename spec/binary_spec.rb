require_relative '../app/binary'

RSpec.describe Binary do
  it 'does not initialize with 1 input' do
    begin
      Binary.new('1')
    rescue Exception => e
      expect(e.message).to eq 'Not enough args'
    end
  end

  it 'initializes with 2 inputs' do
    Binary.new '1', '0'
  end

  it 'initializes with 3 inputs' do
    Binary.new '1', '0', '11'
  end

  it 'initializes with an array of inputs' do
    Binary.new ['1', '0', '11']
  end

  it 'initializes with a splatted array of inputs' do
    Binary.new *['1', '1', '1']
  end

  it 'initializes with binary strings' do
    Binary.new '101', '1'
  end

  it 'initializes with integers' do
    pending 'Not yet implemented'
    Binary.new 1, 2
  end

  context 'AND' do
    (1..10).each do |i|
      length = rand(2..4)
      args = []
      (0...length).each do |j|
        args << rand(0..100) 
      end
      answer = args.reduce { |el, res| el & res }
      it "[#{args.map { |el| el.to_s 2}.join(', ')}]: #{answer.to_s 2}" do
        expect(Binary.and(args.map { |arg| arg.to_s(2) })).to eq answer.to_s(2)
      end
    end
  end

  context 'OR' do
  (1..10).each do |i|
    length = rand(2..4)
    args = []
    (0...length).each do |j|
      args << rand(0..100) 
    end
    answer = args.reduce { |el, res| el | res }
    it "[#{args.map { |el| el.to_s 2}.join(', ')}]: #{answer.to_s 2}" do
      expect(Binary.or(*args.map { |arg| arg.to_s(2) })).to eq answer.to_s(2)
    end
  end
end
 
end

