require 'uri'
require 'net/http'


class TrelloJob < ApplicationJob
  queue_as :default

  def perform(lead_id)
    lead = Lead.find(lead_id)
    created_at = "created_at:" + " " + "#{lead.created_at}"
    contact_person = "contact_name:" + " " + lead.contact_person
    email = "email:" + " " + lead.email
    phone = "phone:" + " " + lead.phone
    referal = "referal:" + " " + lead.referal

    desc = created_at + "\r\n" + contact_person + "\r\n" + email + "\r\n" + phone + "\r\n" + referal


    query_s = {idList: "5bc1bbabe26acc72d7d41634", name: lead.brand, desc: "#{desc}", key: ENV["TRELLO_KEY"], token: ENV["TRELLO_TOKEN"]}.to_query

    url = URI("https://api.trello.com/1/cards?#{query_s}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)

    response = http.request(request)
    puts response.read_body


  end
end
