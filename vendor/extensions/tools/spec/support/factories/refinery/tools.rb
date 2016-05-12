
FactoryGirl.define do
  factory :tool, :class => Refinery::Tools::Tool do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

