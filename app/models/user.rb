class User < ApplicationRecord
  has_many :observation_session

  before_create :generate_emoji_display_name

  private
    def generate_emoji_display_name
      name = ""
      path = Rails.root.join("app", "assets", "data", "emojis.json")
      e_list = JSON.parse(File.read(path))["emojis"]
      for i in 1..3 do
        name.concat(e_list.sample["html"])
      end
      self.display_name = name
    end
end
