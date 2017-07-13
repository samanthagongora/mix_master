require 'rails_helper'

RSpec.feature "User visits artist show page" do
  scenario "can edit artist information" do
    artist1 = create(:artist)

    visit '/artists'
    click_on artist1.name
    click_on 'Edit'
    fill_in 'artist_name', with: 'new band'
    click_on 'Update Artist'

    expect(page).to have_content('new band')
    expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
  end

  scenario "can delete an artist" do
    artist1 = create(:artist)
    artist2 = create(:artist)

    visit '/artists'

    expect(page).to have_link(artist1.name)
    expect(page).to have_link(artist2.name)

    click_on artist1.name
    click_on 'Delete'

    expect(page).to have_no_link(artist1.name)
    expect(page).to have_link(artist2.name)
  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
