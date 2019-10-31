class Trademark < ApplicationRecord
  belongs_to :provider

  def to_s
  	name + " (" + provider.to_s + ")"
  end

end
