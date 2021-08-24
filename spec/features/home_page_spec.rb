require 'rails_helper'

#feature block is similar to RSpec's describe block 
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  #senario is similar to RSpec's it block
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
  end

end