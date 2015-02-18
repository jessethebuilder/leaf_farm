lc = LeaflyConnection.new :app_id => 'd2a4564b', :app_key => '99a0732ea84b0223388e630f5b3b7e21', :app_name => 'Medical Marijuana Vendors'
lc.save!

d = Dispensary.new :leafly_slug => 'green-orchard', :name => 'Leaf Farm Demo'
d.leafly_connection = lc
d.save!



puts 'ccccccccccccccccccccccccc'