require 'uri'
require 'net/http'


class TrelloJob < ApplicationJob
  queue_as :default

  def perform
    list_id = "5bc1bbabe26acc72d7d41634"
    token = ENV["TRELLO_TOKEN"]
    key = ENV["TRELLO_KEY"]
    card_name = "FB"

    # url = URI("https://api.trello.com/1/boards/#{id}/cards?url&key=#{key}&token=#{token}")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # request = Net::HTTP::Get.new(url)

    # response = http.request(request)
    # puts response.read_body

    # puts token
    # puts url


    url = URI("https://api.trello.com/1/cards?idList=#{list_id}&name=#{card_name}&key=#{key}&token=#{token}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)

    response = http.request(request)
    puts response.read_body


  end
end
