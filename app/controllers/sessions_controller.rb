class SessionsController < Inheritance::SessionsController
	private
	  def session_paths(role_name)
	  	{'Admin' => users_path}[role_name] || root_path
	  end
end
