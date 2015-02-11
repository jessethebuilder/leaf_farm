lc = LeaflyConnection.new :app_id => 'd2a4564b', :app_key => '99a0732ea84b0223388e630f5b3b7e21', :app_name => 'Medical Marijuana Vendors'
lc.save!

s = Store.new :name => 'Medical Marijuana Vendors'
s.leafly_connection = lc
s.save!