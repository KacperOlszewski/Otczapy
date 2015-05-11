class AccessController < ApplicationController

  layout "admin"

  before_action :user_check, :except => [:login, :logowanie, :logout]

  def index
  end

  def login
  end

  def logowanie

    if params[:user].present? && params[:password].present?
      user_check = User.where(:user => params[:user]).first
      if user_check
        user_authenticate = user_check.authenticate(params[:password])
      end
    end

    if user_authenticate
      session[:user_id] = user_authenticate.id
      session[:user] = user_authenticate.user
      session[:user_name] = user_authenticate.name
        if user_authenticate.name == "Kuba" || user_authenticate.name == "Jakub" 
        flash[:notice] = "Cześć Wiącek, Ty geju... Zostałeś poprawnie zalogowany."
        elsif user_authenticate.id == 10
        flash[:notice] = "Cześć, utwórz swoje własne konto -> Użytkownicy -> dodaj nowego"
        else
        flash[:notice] = "Cześć #{user_authenticate.name}! Witaj w panelu."
        end
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Błąd: niepoprawna nazwa użytkownika lub hasło."
      redirect_to(:action => 'login')
    end

  end


  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = "Wylogowano z powodzeniem"
    redirect_to(:action => "login")
  end


end