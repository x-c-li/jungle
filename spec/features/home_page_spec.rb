require 'rails_helper'

#feature block is similar to RSpec's describe block 
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  #senario is similar to RSpec's it block
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot

    #sets expectation of content the user should see on the page, should see at least one product
    #if you don't see anything it's okay bc each test starts with an empty database
    expect(page).to have_css 'article.product', count: 10

  end

end