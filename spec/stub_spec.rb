class Product
  attr_reader :price
end

class PriceCalculator
  def add product
    products << product
  end
  
  def products
    @products ||= []
  end
  
  def final_price
    @products.map(&:price).inject(&:+)
  end
end

describe "Stubs" do
  let(:calculator) { PriceCalculator.new }

  it "provides stubs to simulate state" do
	# calculator.add double(price: 1.00)
	# calculator.add double(price: 100.25)
	
	product_stub = instance_double("Product")
	allow(product_stub).to receive(:price).and_return(1.00, 100.25)
	#allow(first_product).to receive(:price) { 1.00 }
	calculator.add product_stub
	calculator.add product_stub
	#calculator.add instance_double("Product", price: 100.25)
	
	expect(calculator.final_price).to eq 101.25
  end
  
  it "provides mocks to assert on message passing" do
    product_mock = double("Product")
	# #expect(product_mock).to receive(:price).with(no_args)
	# #expect(product_mock).to receive(:price).with(2, 1) # with(any_args), with(no_args)
	# #expect(product_mock).to receive(:price).once
	# #expect(product_mock).to receive(:price).twice
	# #expect(product_mock).to receive(:price).exactly(5).times.and_return(5)
	expect(product_mock).to receive(:price).at_least(3).times.and_return(5)
	
	calculator.add product_mock
	calculator.add product_mock
	calculator.add product_mock
	calculator.add product_mock
	calculator.add product_mock
	
	calculator.final_price
  end
  
  # it "provides mocks to assert on message passing" do
	# #expect_any_instance_of(Product).to receive(:price) { 5 
	# allow_any_instance_of(Product).to receive(:price) { 5 }
	
    # product = Product.new
	# puts product.price
  # end
  
end