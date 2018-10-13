require 'uri'
require 'net/http'


class TrelloJob < ApplicationJob
  queue_as :default

  def perform(lead_id)
    lead = Lead.find(lead_id)
    list_id = "5bc1bbabe26acc72d7d41634"
    token = ENV["TRELLO_TOKEN"]
    key = ENV["TRELLO_KEY"]
    card_name = lead.brand
    created_at = "created_at:" + " " + "#{lead.created_at}"
    contact_person = "contact_name:" + " " + lead.contact_person
    email = "email:" + " " + lead.email
    phone = "phone:" + " " + lead.phone
    referal = "referal:" + " " + lead.referal

    url = URI("https://api.trello.com/1/cards?idList=#{list_id}&name=#{card_name}&desc=#{created_at} %0A #{contact_person} %0A #{email} %0A #{phone} %0A #{referal}&key=#{key}&token=#{token}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)

    response = http.request(request)
    puts response.read_body


  end
end
