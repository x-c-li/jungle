require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  
  scenario "Navigate to product page by clicking on a product on the homepage" do
    # ACT
    visit root_path
    # puts page.html

    # DEBUG / VERIFY
    # save_screenshot

    # expect(page).to have_css 'article.product', count: 10
    puts page.html

    first('.product > header > a').click    
    puts "-----------------------"
    puts "PRODUCT PAGE "
    puts "-----------------------"

    puts page.html
    save_screenshot

  end


end
