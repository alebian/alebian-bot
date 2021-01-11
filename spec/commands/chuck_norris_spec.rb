describe Commands::ChuckNorris do
  subject(:command) { described_class.new(Logger.new(STDOUT)) }

  let(:message) { nil }

  it 'returns a quote' do
    response = command.call(message)
    expect(response).to be_present
  end
end
