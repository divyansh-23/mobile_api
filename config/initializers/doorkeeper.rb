Doorkeeper.configure do
  grant_flows %w[password]


  resource_owner_from_credentials do
    User.find_by(email: params[:username])
       &.authenticate(params[:password]) || nil
  end
end
