class FavoriteRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :technique
end
