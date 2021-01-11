describe Commands::Dai do
  subject(:command) { described_class.new(Logger.new(STDOUT)) }

  let(:price) { '162.3' }
  let(:message) { MessageMock.new("/dai #{price}", ChatMock.new(123)) }
  let(:client) { Redis.new }

  after do
    client.del(described_class::KEY)
  end

  it 'registers the price' do
    command.call(message)
    expect(client.get(described_class::KEY)).to eq({ 123 => { price: price }}.to_json)
  end
end
