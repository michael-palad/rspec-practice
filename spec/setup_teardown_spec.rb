require "blog"

describe "Callbacks" do
  let(:blog) { Blog.new }
  
  before(:example) do |example| # values = each, all, context, example
    blog.populate!
	# puts example.inspect
  end
  
  it "has one post" do
    expect(blog.posts_count).to eq 1
  end
  
  it "has one post" do
    expect(blog.posts_count).to eq 1
  end
end