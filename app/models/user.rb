class User < ActiveRecord::Base
	include Met
	validates :username, :password, :role, :first_name, :last_name, presence: true
	def self.permitted_params
  	[:username, :first_name, :last_name, :idTrello, :role_id, :password,  :password_confirmation]
  end
end
