# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroy existing records to avoid duplicates
Hobby.destroy_all
DietaryRestriction.destroy_all
Accessibility.destroy_all

# Seed Hobbies
Hobby.create([
               { name: 'Swimming' }, { name: 'Running' }, { name: 'Art' }, { name: 'History' },
               { name: 'Gaming' }, { name: 'Cycling' }, { name: 'Hiking' }, { name: 'Cooking' }, { name: 'Photography' },
               { name: 'Yoga' }, { name: 'Dancing' }, { name: 'Fishing' }, { name: 'Bird Watching' }, { name: 'Gardening' },
               { name: 'Traveling' }, { name: 'Writing' }, { name: 'Reading' }, { name: 'Music' }, { name: 'Fitness' },
               { name: 'Rock Climbing' }, { name: 'Skiing' }, { name: 'Snowboarding' }, { name: 'Surfing' }, { name: 'Scuba Diving' },
               { name: 'Martial Arts' }, { name: 'Pottery' }, { name: 'Woodworking' }, { name: 'Knitting' },
               { name: 'Baking' }, { name: 'Tennis' }, { name: 'Basketball' }, { name: 'Soccer' }, { name: 'Volleyball' },
               { name: 'Table Tennis' }, { name: 'Archery' }, { name: 'Horse Riding' }, { name: 'Camping' }, { name: 'Astronomy' },
               { name: 'Chess' }, { name: 'Golf' }, { name: 'Geocaching' }, { name: 'Kite Flying' }, { name: 'Origami' }, { name: 'Model Building' },
               { name: 'Drone Flying' }, { name: 'Sailing' }, { name: 'Kayaking' }, { name: 'Canoeing' }, { name: 'Wine Tasting' }, { name: 'Astrology' },
               { name: 'Meditation' }, { name: 'Calligraphy' }, { name: 'Magic Tricks' }, { name: 'Scrapbooking' }, { name: 'Metal Detecting' }, { name: 'Juggling' },
               { name: 'Parkour' }, { name: 'Bowling' }, { name: 'Lacrosse' }, { name: 'Rugby' }, { name: 'Fencing' }, { name: 'Ice Skating' },
               { name: 'BMX Riding' }, { name: 'Roller Skating' }, { name: 'Stand-Up Comedy' }, { name: 'Beer Brewing' }, { name: 'Cheese Making' }, { name: 'Soap Making' }
             ])

# Seed Dietary Restrictions
DietaryRestriction.create([
                            { name: 'None' }, { name: 'Nut allergy' }, { name: 'Gluten-free' }, { name: 'Dairy-free' },
                            { name: 'Halal' }, { name: 'Lactose intolerant' }, { name: 'Shellfish allergy' }, { name: 'Soy allergy' },
                            { name: 'Kosher' }, { name: 'Egg allergy' }, { name: 'Seafood allergy' }, { name: 'Low-sodium' },
                            { name: 'Vegan' }, { name: 'Low-carb' }, { name: 'Low-fat' }, { name: 'Diabetic' },
                            { name: 'Vegetarian' }, { name: 'No pork' }, { name: 'Pescatarian' }, { name: 'Paleo' },
                            { name: 'Keto' }, { name: 'FODMAP' }, { name: 'Organic only' }, { name: 'Peanut allergy' },
                            { name: 'Citrus allergy' }, { name: 'Sulfite allergy' }, { name: 'Fructose intolerance' }, { name: 'MSG sensitivity' },
                            { name: 'Raw food diet' }, { name: 'Nightshade allergy' }
                          ])

# Seed Accessibilities
Accessibility.create([
                       { name: 'None' }, { name: 'Wheelchair user' }, { name: 'Visual impairment' }, { name: 'Hearing impairment' },
                       { name: 'Cognitive disability' }, { name: 'Autism' }, { name: 'Dyslexia' }, { name: 'ADHD' },
                       { name: 'Mobility impairment' }, { name: 'Chronic pain' }, { name: 'Mental health condition' }, { name: 'Speech impairment' },
                       { name: 'Epilepsy' }, { name: 'Alzheimer\'s disease' }, { name: 'Parkinson\'s disease' }, { name: 'Down syndrome' },
                       { name: 'Chronic illness' }, { name: 'Spinal cord injury' }, { name: 'Cerebral palsy' }, { name: 'Muscular dystrophy' },
                       { name: 'Multiple sclerosis' }
                     ])

puts "Seeded #{Hobby.count} hobbies, #{DietaryRestriction.count} dietary restrictions, and #{Accessibility.count} accessibilities."
