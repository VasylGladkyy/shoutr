FactoryBot.define do
  factory :text_shout do
    body { Faker::Lorem.sentences }
  end
  
  factory :shout do
    user { create(:user) }
    content { create(:text_shout) }
  end
end
