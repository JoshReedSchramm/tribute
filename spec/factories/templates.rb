# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template do
    name "MyString"
    class_name "MyString"
    description "MyText"
    created_by_id 1
  end
end
