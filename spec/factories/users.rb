FactoryGirl.define do
  factory :user do
    name "Daniel Nedrud"
    email "dnedrud1@example.com"
    password "Password"
    password_confirmation "Password"
  end
  
  factory :another_user, :class => 'User' do
    name "Bill Buckson"
    email "bill@example.com"
    password "Password"
    password_confirmation "Password"
  end
end
