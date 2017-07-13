require 'rails_helper'

RSpec.feature "User visits playlist index" do
  scenario "sees all playlists with link" do
    playlist1 = create(:playlist)
    playlist2 = create(:playlist)

    visit '/playlists'

    expect(page).to have_link(playlist1.name, playlist_path(playlist1))
    expect(page).to have_link(playlist2.name, playlist_path(playlist2))
  end
end
