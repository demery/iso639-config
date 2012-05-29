FactoryGirl.define do
  factory :lang, class: Iso639Config::Lang do |f|
    f.sequence(:bib_code) do |n|
      "en#{n}"
    end
    f.display true
  end
end

# FactoryGirl.define do
#   factory :user do
#     first_name 'John'
#     last_name  'Doe'
#     age        { 1 + rand(100) }
#         
#     # Child of :user factory, since it's in the `factory :user` block
#     factory :admin do
#       admin true
#     end
#   end
# end
