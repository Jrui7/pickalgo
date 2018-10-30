module Testor
 class CampaignsController < ApplicationController

 def index
  @campaigns = policy_scope(Campaign)
 end

 end
end
