class Store < ActiveRecord::Base
  has_one :leafly_connection, as: :leafly_connectable
end
