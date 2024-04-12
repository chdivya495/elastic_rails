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
