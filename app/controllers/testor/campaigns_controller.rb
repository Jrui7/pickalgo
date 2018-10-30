module Testor
 class CampaignsController < ApplicationController

 def index
   @categories = Category.all
   if params[:category].present?
     @filter = Category.friendly.find(params[:category])
     @campaigns = policy_scope(Campaign).where(category: @filter)
   else
     @campaigns = policy_scope(Campaign)
   end
 end

 end
end
