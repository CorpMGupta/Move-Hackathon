class HomeController < ApplicationController

  def index
  end

  def login

    @currentPass = params[:password].to_s

    @user = Judge.where('name = ? AND password = ?', params[:name], @currentPass.to_sha1())

    if @user.blank?
      flash[:notice] = 'Invalid username or password.'
      redirect_to home_index_url
    else
      redirect_to team_list_url
    end

  end
end
