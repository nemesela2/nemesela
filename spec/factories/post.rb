FactoryBot.define do
  factory :post do |post|
    title {'New Post'}
    description {'Post Description'}
    user { create(:user) }
  end

  factory :comment do |comment|
    body { 'Cool post!'} 
    post { create(:post) }
  end
end
