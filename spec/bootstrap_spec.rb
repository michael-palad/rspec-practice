require 'bootstrap'

describe Bootstrap do

  it "says Hello" do
    expect(Bootstrap.new.hello).to include "Hello"
  end

end