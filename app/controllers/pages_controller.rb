class PagesController < ApplicationController
    def index
    end

    def secret
      if !current_user
        redirect_to(login_path, alert: "Nope... gotta be logged in")
      end
    end
end
