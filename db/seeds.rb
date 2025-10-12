puts "Seeding resources..."

resources = [
  {
    title: "Rails Guides",
    description: "Comprehensive guides for Ruby on Rails.",
    link: "https://guides.rubyonrails.org/"
  },
  {
    title: "Ruby Documentation",
    description: "Official Ruby language documentation.",
    link: "https://www.ruby-lang.org/en/documentation/"
  },
  {
    title: "PostgreSQL Tutorial",
    description: "Learn PostgreSQL with practical examples.",
    link: "https://www.postgresqltutorial.com/"
  },
  {
    title: "JSON API Specification",
    description: "A standard for building APIs in JSON.",
    link: "https://jsonapi.org/"
  }
]

resources.each do |resource_data|
  Resource.create!(resource_data)
end

puts "Seeding complete!"
