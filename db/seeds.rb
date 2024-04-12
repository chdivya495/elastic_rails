verticals_data = [
  { name: "Health & Fitness" },
  { name: "Business" },
  { name: "Music" }
]

Vertical.create!(verticals_data)


categories_data = [
  { name: "Booty & Abs", state: "active", vertical_id: Vertical.find_by(name: "Health & Fitness").id },
  { name: "Full Body", state: "active", vertical_id: Vertical.find_by(name: "Health & Fitness").id },
  { name: "Advertising", state: "active", vertical_id: Vertical.find_by(name: "Business").id },
  { name: "Writing", state: "active", vertical_id: Vertical.find_by(name: "Business").id },
  { name: "Singing", state: "active", vertical_id: Vertical.find_by(name: "Music").id },
  { name: "Music Fundamentals", state: "active", vertical_id: Vertical.find_by(name: "Music").id }
]

Category.create!(categories_data)

courses_data = [
  { name: "Loose the Gutt, keep the Butt", author: "Anowa", state: "active", category_id: Category.find_by(name: "Booty & Abs").id },
  { name: "BrittneBabe Fitness Transformation", author: "Brittnebabe", state: "active", category_id: Category.find_by(name: "Booty & Abs").id },
  { name: "BTX: Body Transformation Extreme", author: "Barstarzz", state: "active", category_id: Category.find_by(name: "Full Body").id },
  { name: "Facebook Funnel Marketing", author: "Russell Brunson", state: "active", category_id: Category.find_by(name: "Advertising").id },
  { name: "Build a Wild Audience", author: "Tim Nilson", state: "active", category_id: Category.find_by(name: "Advertising").id },
  { name: "Editorial Writing Secrets", author: "J. K. Rowling", state: "active", category_id: Category.find_by(name: "Writing").id },
  { name: "Scientific Writing", author: "Stephen Hawking", state: "active", category_id: Category.find_by(name: "Writing").id },
  { name: "Vocal Training 101", author: "Linkin Park", state: "active", category_id: Category.find_by(name: "Singing").id },
  { name: "Music Production", author: "Lady Gaga", state: "active", category_id: Category.find_by(name: "Singing").id },
  { name: "Learn the Piano", author: "Lang Lang", state: "active", category_id: Category.find_by(name: "Music Fundamentals").id },
  { name: "Become a guitar hero", author: "Jimmy Page", state: "active", category_id: Category.find_by(name: "Music Fundamentals").id }
]

Course.create!(courses_data)
