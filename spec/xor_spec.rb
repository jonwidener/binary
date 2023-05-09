require_relative '../app/xor'

RSpec.describe 'Binary XOR' do
  (1..10).each do |i|
    length = rand(2..4)
    args = []
    (0...length).each do |j|
      args << rand(0..100) 
    end
    answer = args.reduce { |el, res| el ^ res }
    it "[#{args.map { |el| el.to_s 2}.join(', ')}]: #{answer.to_s 2}" do
      expect(Binary.xor(*args.map { |arg| arg.to_s(2) })).to eq answer.to_s(2)
    end
  end
end
  
