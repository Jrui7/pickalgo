categories = %w(Mode Beauté Sport Tech Loisirs Maison Enfants Animaux)
categories.each do |category|
  Category.create!(name: category, slug: category)
end
puts "----------------------------------"
puts "Categories created"
