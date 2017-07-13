FactoryGirl.define do
  factory :song do
    sequence :title do |i|
      "#{i}Song Name"
    end
    sequence :artist do |i|
      "#{i}Band Name"
    end
  end
end
