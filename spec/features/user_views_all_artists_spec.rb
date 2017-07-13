require 'rails_helper'

RSpec.feature "User visits artist index" do
  scenario "can see all artists and links" do
    artist1 = create(:artist)
    artist2 = create(:artist)
    artist3 = create(:artist)

    visit '/artists'

    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)
    expect(page).to have_content(artist3.name)
    expect(page).to have_link('1Band Name', href: artist_path(artist1))
    expect(page).to have_link('2Band Name', href: artist_path(artist2))
    expect(page).to have_link('3Band Name', href: artist_path(artist3))
  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
