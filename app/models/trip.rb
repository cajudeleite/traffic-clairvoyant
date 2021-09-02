class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :origin_destination_routes, class_name: 'OriginDestinationRoute'
end
