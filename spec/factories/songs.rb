FactoryGirl.define do
  factory :song do
    sequence :title do |i|
      "#{i}Song Name"
    end

    artist
  end
end
