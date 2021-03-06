class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :origin_destination_routes, class_name: 'OriginDestinationRoute'
  # validates :date, uniqueness: { scope: [:user] }

  DEPARTURE_TIME = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]

  after_create :call_flater

  private

  def call_flater
    if self.user.id != 1
      FlaterJob.perform_later(self.user.id)
    end
  end
end
