require 'rails_helper'

RSpec.feature "User visits artist songs page" do
  scenario "creates an artist song" do
    artist1 = create(:artist)
    song1 = create(:song, title: 'New Song Name')

    visit "/artist/#{artist1.id}"
    click_on 'New Song'
    fill_in 'Title', with: 'New Song Name'
    click_on 'Create Song'

    expect(page).to have_content 'New Song Name'
    expect(page).to have_current_path("/artist/#{artist1.id}/songs/#{song1.id}")
    expect(page).to have_link("#{artist1.name}", href: artist_path(artist1))
  end
end
