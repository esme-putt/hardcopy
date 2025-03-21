# Create test products
5.times do |i|
    Product.create!(
      title: "Test Product #{i+1}",
      price: rand(10.0..100.0).round(2),
      stock: rand(1..20),
      featured: [true, false].sample,
      description: "This is a test product description for product #{i+1}"
    )
  end
  
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