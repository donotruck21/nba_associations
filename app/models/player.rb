class Player < ActiveRecord::Base
  	belongs_to :team

  	validates :first_name, :last_name,
  		presence: true
end
