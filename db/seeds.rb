require 'csv'
puts "Importing service category..."
CSV.foreach(Rails.root.join("categories.csv"), headers: true) do |row|
  Category.create! do |category|
    category.id = row[0]
    category.name = row[1]
  end
end

puts "Importing service subcategory..."
CSV.foreach(Rails.root.join("subcategories.csv"), headers: true) do |row|
  Subcategory.create! do |subcategory|
    subcategory.name = row[0]
    subcategory.category_id = row[1]
  end
end
