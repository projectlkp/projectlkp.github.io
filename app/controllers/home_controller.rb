class HomeController < ApplicationController
  def index
    if current_user
      @posts=[]
      @posts=current_user.blogs.first.posts if current_user.blogs.present?
      respond_to do |format|
        format.html { render 'index.html.erb' }
      end
    else
      respond_to do |format|
        format.html { render 'devise/registrations/new.html.erb' }
      end
    end
  end
end
