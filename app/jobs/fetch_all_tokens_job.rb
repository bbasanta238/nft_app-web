class FetchAllTokensJob < ApplicationJob
  queue_as :default

  def perform(contractAddress)
    @tokens = `python3 lib/assets/python/fetchTokenScript.py "#{contractAddress}"`
  end
end
