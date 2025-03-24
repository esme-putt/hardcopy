# Clear existing data
puts "Cleaning database..."
Product.destroy_all
Post.destroy_all
User.destroy_all
Subscriber.destroy_all

# Create test products
product = Product.create!(
    title: "Sony DSC-20 Digicam",
    price: 199,
    stock: 1,
    featured: true,
    description: "An awesome digicam from 2007, rescued and restored from an op shop cabinet."
)

product.images.attach(io: File.open(Rails.root.join("app/assets/sample_images/DSC-T20.jpeg")), filename: "DSC-T20.jpeg", content_type: "image/jpeg")

puts "Created #{Product.count} products"

# Create test blog posts
5.times do |i|
Post.create!(
    title: "Test Blog Post #{i+1}",
    content: "This is test content for blog post #{i+1}. It contains some sample text to display on the blog page.",
    published: true,
    published_at: Time.now - i.days
)
end

puts "Created #{Post.count} blog posts"