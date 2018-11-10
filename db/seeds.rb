# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.destroy_all
images = [{ url: 'https://images.pexels.com/photos/850602/pexels-photo-850602.jpeg',
            tags: 'dogs' },
          { url: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg',
            tags: 'dogs, puppies' },
          { url: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/AED9/production/_103316744_d5r9r4.jpg',
            tags: 'simpsons, homer' },
          { url: 'https://images.pexels.com/photos/8769/pen-writing-notes-studying.jpg',
            tags: 'test, sat' },
          { url: 'https://images.pexels.com/photos/459793/pexels-photo-459793.jpeg',
            tags: 'test' },
          { url: 'https://images.pexels.com/photos/163016/crash-test-collision-60-km-h-distraction-163016.jpeg',
            tags: 'crash, cars, car' },
          { url: 'https://images.pexels.com/photos/263194/pexels-photo-263194.jpeg',
            tags: '' },
          { url: 'https://images.pexels.com/photos/46173/diabetes-blood-sugar-diabetic-medicine-46173.jpeg',
            tags: 'test, needle' },
          { url: 'https://images.pexels.com/photos/207585/pexels-photo-207585.jpeg',
            tags: 'tomato, test, needle' },
          { url: 'https://images.pexels.com/photos/159483/animal-mouse-experiment-laboratory-159483.jpeg',
            tags: 'mouse, test' },
          { url: 'https://images.pexels.com/photos/928475/pexels-photo-928475.jpeg',
            tags: 'donut, pink' },
          { url: 'https://images.pexels.com/photos/696179/pexels-photo-696179.jpeg',
            tags: 'coffee, donut, book' },
          { url: 'https://images.pexels.com/photos/1166418/pexels-photo-1166418.jpeg',
            tags: 'donut, sprinkles' },
          { url: 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg',
            tags: 'coffee, latte, barista' },
          { url: 'https://images.pexels.com/photos/34085/pexels-photo.jpg',
            tags: 'coffee beans, coffee' },
          { url: 'https://images.pexels.com/photos/867470/pexels-photo-867470.jpeg',
            tags: 'coffee, heart' },
          { url: 'https://images.pexels.com/photos/296888/pexels-photo-296888.jpeg',
            tags: 'coffee, machine' },
          { url: 'https://images.pexels.com/photos/681847/pexels-photo-681847.jpeg',
            tags: 'beer, bar' },
          { url: 'https://images.pexels.com/photos/8800/snow-restaurant-mountains-sky.jpg',
            tags: 'beer, mountains' },
          { url: 'https://images.pexels.com/photos/767239/pexels-photo-767239.jpeg',
            tags: 'beer, beach' }]

images.each do |image|
  img = Image.new(url: image[:url], tag_list: image[:tags])
  img.save!
end
