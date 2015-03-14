FactoryGirl.define do
  factory :dispensary do
    name Faker::Company.name

    factory :leafly_dispensary do
      leafly_slug 'green-orchard' #matches test_slug in LeaflyBridgeSpec
    end
  end

  factory :leafly_connection do
    app_id 'd2a4564b'
    app_key '99a0732ea84b0223388e630f5b3b7e21'
  end

end