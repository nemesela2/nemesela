class CustomDeviseTokenAuth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_user!, only: [:create]
end