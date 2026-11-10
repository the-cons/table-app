data = [
  { name: "Beim Musel", slug: "beim-musel", items: [
    ["Bouneschlupp", "9.80"], ["Judd mat Gaardebounen", "24.50"], ["Kniddelen", "16.00"]
  ] },
  { name: "Léweck", slug: "leweck", items: [
    ["Gromperekichelcher", "8.50"], ["Rieslingspaschtéit", "14.90"]
  ] },
  { name: "Hotel Theis", slug: "hotel-theis", items: [
    ["Quetschentaart", "7.50"], ["Träipen", "15.20"], ["Fritten", "4.50"]
  ] }
]

data.each do |attrs|
  restaurant = Restaurant.find_or_create_by!(slug: attrs[:slug]) do |r|
    r.name = attrs[:name]
  end

  attrs[:items].each do |name, price|
    restaurant.menu_items.find_or_create_by!(name: name) do |item|
      item.price = price
    end
  end
end

puts "Seeded #{Restaurant.count} restaurants, #{MenuItem.count} menu items"
