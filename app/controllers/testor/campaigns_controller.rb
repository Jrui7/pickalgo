module Testor
 class CampaignsController < ApplicationController
  skip_after_action :verify_authorized, only: [:show]


 def index
   @categories = Category.all
   if params[:category].present?
     @filter = Category.friendly.find(params[:category])
     @campaigns = policy_scope(Campaign).where(category: @filter)
   else
     @campaigns = policy_scope(Campaign)
   end
 end

   def show
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
   end

 end
end
