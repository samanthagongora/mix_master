require 'rails_helper'

RSpec.feature "User visits artist show page" do
  scenario "can edit artist information" do
    artist1 = create(:artist)

    visit '/artists'
    click_on '4Band Name'
    click_on 'Edit'
    fill_in 'artist_name', with: 'new band'
    click_on 'Update Artist'

    expect(page).to have_content('new band')
    expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
  end
end



# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
#
