# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "MyString"
    description "MyText"
    project nil
  end
end
