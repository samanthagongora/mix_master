require 'rails_helper'

RSpec.feature "User visits playlist show page" do
  scenario "can edit a playlist" do
    song1 = create(:song)
    song2 = create(:song)
    song3 = create(:song)
    playlist1 = create(:playlist, name: "Old Name", song: song1)
    playlist2 = create(:playlist)

    visit "/playlist/#{playlist1.id}"
    click_on 'Edit'
    fill_in 'name', with: "New Name"
    check("song-#{song2.id}")
    uncheck("song-#{song1.id}")
    click_on 'Update Playlist'

    expect(page).to have_content 'New Name'
    expect(page).to have_content song2.name
    expect(page).to not_have_content song1.name
  end
end
