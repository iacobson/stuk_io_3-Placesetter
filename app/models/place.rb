class Place < ActiveRecord::Base
  belongs_to  :user
  has_many    :reviews, dependent: :destroy

  validates_presence_of :name, :phone, :website, :user_id, :address

  geocoded_by :address
  after_validation :geocode
end
