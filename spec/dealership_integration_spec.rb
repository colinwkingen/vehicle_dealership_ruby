# require("capybara/rspec")
# require("./app")
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe('the places been path', {:type => :feature}) do
#   it('receives user input on Submit button click') do
#     visit('/')
#     fill_in('description', :with => 'Pairis, Epicoda')
#     click_button('Submit')
#     click_link('Back')
#     expect(page).to have_content('Pairis, Epicoda')
#   end
# end
