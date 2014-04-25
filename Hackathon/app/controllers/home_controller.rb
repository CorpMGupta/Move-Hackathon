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
        session[:user_id] = rec.id
        session[:user_name] = rec.name
      end
    end

    if(session[:user_id].nil?)
      flash[:message] = 'Invalid username and password.'
      redirect_to home_index_url
    else
      redirect_to home_homepage_url
    end

  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to :action => 'homepage'
  end

  def homepage
    @teams = Team.all
  end

  def adminpage
  end

end
