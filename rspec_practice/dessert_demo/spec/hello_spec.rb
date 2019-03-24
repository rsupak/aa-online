require 'rspec'
require 'hello'

describe '#hello world' do
  it "returns 'Hello, World'" do
    expect(say_hello).to eq('Hello, World')
  end
end
