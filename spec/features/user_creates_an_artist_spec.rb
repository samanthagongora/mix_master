require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they enter data to create a new artist" do
    image_path = 'http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg'
    name = 'Bob Marley'

    visit artists_path
    click_on 'New Artist'
    fill_in 'artist_name', with: name
    fill_in 'artist_image_path', with: image_path
    click_on 'Create Artist'

    expect(page).to have_content name
    expect(page).to have_css("img[src=\"#{image_path}\"]")
  end

  context "they forget to enter a name" do
    scenario "they see an error message" do
      image_path = 'http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg'

      visit '/artists'
      click_on 'New Artist'
      fill_in 'artist_image_path', with: image_path
      click_on 'Create Artist'

      expect(page).to have_content("Name can't be blank")
    end
  end
end
