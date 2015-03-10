def user_attributes(overrides = {})
  {
    first_name: "first_name",
    last_name: "last_name",
    email: "user@example.com",
    password: "password",
    admin: false
  }.merge(overrides)
end

def item_attributes(overrides = {})
  {
    name: "itemname",
    price: 1250,
    description: "description goes here.",
    image_file_name: "Beautiful image"
  }.merge(overrides)
end
