# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name "MyString"
    tagline "MyString"
    description "MyText"
    main_image "MyString"
  end
end
