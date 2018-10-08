class PagesController < ApplicationController
  before_action :set_page_action, only: [:faq, :contact, :mentions_legales, :cgu]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :faq, :contact, :mentions_legales, :cgu]

  def home
  end

  def faq
  end

  def contact
  end

  def mentions_legales
  end

  def cgu
  end

  def welcome
    @user = current_user
  end

  private

  def set_page_action
    @page = params["action"]
  end

end
