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
    expect(page).to have_link(artist1.name, href: artist_path(artist1))
    expect(page).to have_link(artist2.name, href: artist_path(artist2))
    expect(page).to have_link(artist3.name, href: artist_path(artist3))
  end
end
