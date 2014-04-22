class HomeController < ApplicationController

  require 'string_to_sha1'

  def index
  end

  def login

    @currentName = params[:name].to_s
    @currentPass = params[:password].to_s

    @user = Judge.where('name = ? AND password = ?', @currentName, @currentPass.to_sha1())

    if @user.nil?
      redirect_to home_index_url
    else
      redirect_to team_list_url
    end

  end
end
