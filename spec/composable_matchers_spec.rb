describe "Composable Matchers" do
  it "works with nested data" do
    class Product
	  def initialize id, name, category
	    @id = id
	    @name = name
		@category = category
	  end
	  
	  def serial_data
	    [
		  "X-",
		  @name[0],
		  @category[0],
		  @id
		]
	  end
	end
	  
	product = Product.new 2456, "Tomato", "Fruit"
	  
	expect(product.serial_data).to match [
	  a_string_starting_with("X-"),
	  a_string_starting_with("T"),
	  a_string_starting_with("F"),
	  a_value < 5000
	]
	
	# Matchers
	# ------------------------
	# change
	# contain_exactly
	# include
	# yield_with_args(a_string_starting_with, a_hash_including())
	#
	# Matchers arguments
	# ------------------------
	# a_string
	# a_string_starting_with/ending_with
	# a_hash
	# a_hash_including
	# a_value
	# a_value_within(0.5).of(3.145) # 3.14 3.15
	# an_instance_of(Array)
	
  end
  
  it "testing" do
    a = [1, 2, '3']
	
	expect(a).to contain_exactly 1, 2, '3'
  end
  
  it "compound matcher" do
    string = "erick"
	
	expect(string).to start_with('e').and end_with('k')
	expect(string).to start_with('q').or start_with('e')
	expect(50).to eq(50).or eq(100)
  end

end