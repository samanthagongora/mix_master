FactoryGirl.define do
  factory :artist do
    sequence :name do |i|
      "#{i}Band Name"
    end

    sequence :image_path do |i|
      "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038#{i}.jpg"
    end
  end
end
