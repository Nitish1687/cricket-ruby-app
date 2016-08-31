FactoryGirl.define do
  factory :player do
    name 'testPlayer'
    brands { Array.new(1) { FactoryGirl.build(:brand) } }
  end
end