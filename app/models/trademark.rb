class Trademark < ApplicationRecord
  belongs_to :provider
  has_many :client

  validates_presence_of :provider

  def to_s
  	name + " (" + provider.to_s + ")"
  end

end
