require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
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
      @user = User.new({
        name: "David",
        email: "David@email.com",
        password: "password",
        password_confirmation: "password"
      })
      @user.save
      
    end
    
    scenario "They can add to product cart" do
      # ACT
      visit root_path
      visit '/login'
      email = "David@email.com"
      password = "password"
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      click_button('Submit')
      first('.product').click_on('Add')
  
  
      expect(page).to have_content "My Cart (1)"
  
      puts page.html

    save_screenshot

    end
end