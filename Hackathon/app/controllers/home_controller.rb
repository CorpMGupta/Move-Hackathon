class HomeController < ApplicationController

  require 'string_to_sha1'

  def index
  end

  def login

    @currentName = params[:username].to_s
    @currentPass = params[:password].to_s

    @currentPass = @currentPass.to_sha1()

    @users = Judge.all

    @users.each do |rec|
      if(rec.name.eql?(@currentName) && rec.password.eql?(@currentPass))
        session[:user_id] = @currentName
        redirect_to :action => 'homepage'
      else
        redirect_to home_index_url
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'homepage'
  end

  def homepage
    @teams = Team.all
  end

end
