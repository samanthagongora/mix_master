require 'rails_helper'

RSpec.feature "User visits artist songs page" do
  scenario "creates an artist song" do
    artist1 = create(:artist)
    song1 = create(:song, title: 'Old Song Name', artist: artist1)

    visit "/artists/#{artist1.id}"
    click_on 'New Song'
    fill_in 'Title', with: 'New Song Name'
    click_on 'Create Song'

    expect(page).to have_content 'New Song Name'
    # binding.byebug
    expect(page).to have_link("#{artist1.name}", href: artist_path(artist1))
  end
end
