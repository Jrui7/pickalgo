class PagesController < ApplicationController
  before_action :set_page_action, only: [:faq, :contact, :mentions_legales, :cgu]

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
    @welcome = "Bonjour #{current_user.first_name}"
  end

  def set_page_action
    @page = params["action"]
  end

end
