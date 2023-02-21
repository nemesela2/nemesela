module Api
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken

    respond_to :json
  end
end
