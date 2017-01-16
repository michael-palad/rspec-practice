describe "Matchers" do
#fdescribe "Matchers" do  # focus on a group of tests
#xdescribe "Matchers" do  # skip a group of tests
  it "asserts on equality" do
    num = 10
	expect(num).to eq 10
  end
  
  it "asserts on mathematical operators" do
    num = 2
	expect(num).to be <= 5
  end
  
  it "asserts on matching a regular expression" do
    email = "hiya@something.com"
	pattern = /\w+@\w+\.[a-z]{3}/
	expect(email).to match pattern
  end
  
  it "asserts on types and classes" do
    num = 2.3
	#expect(num).to be_a Numeric
	#expect(num).to be_an Numeric
	expect(num).to be_an_instance_of Float
  end
  
  it "asserts on truthiness" do
    bool = true
	falsey = false
	nil_val = nil
	object = Class.new
	
	expect(bool).to be true
	expect(falsey).to be false
	expect(nil_val).to be_falsey
	expect(object).to be_truthy
  end
  
  it "expects errors" do
    expect do
	  raise ArgumentError
	end.to raise_error ArgumentError
  end
  
  it "expects throws" do
    #expect { throw :oops }.to throw_symbol
    expect { throw :oops }.to throw_symbol :oops
  end
  
  it "asserts on predicates" do
  #xit "asserts on predicates" do  # skip a specific test
  #it "asserts on predicates", skip: true do  # skip test no reason given
  #it "asserts on predicates", skip: "Not really important" do  # skip test with reason
   #pending  # another way to skip a test
	#skip  # skip a test without seeing result
    class A
	  def good?
	    true
		#raise ArgumentError
	  end
	end
	
	expect(A.new).to be_good
  end
  
  it "asserts on collections" do
    list = [
	  :one,
	  :two,
	  :three,
	  :four,
	  :five
	]
	
	expect(list).to include :five
	expect(list).to start_with :one
	expect(list).to end_with :five
	expect(list).to start_with [ :one ]
	expect(list).to end_with [ :five ]
  end
  
  it "negates asserts" do
    expect(2).not_to be 5
	expect(5).to_not be 20
  end
  
  it "is my very important test right now" do
  #fit "is my very important test right now" do  # focus on test with command rspec --tag focus
  #it "is my very important test right now", focus: true do  # another way to focus on test(s)
    expect(true).to be_truthy
  end
  
end