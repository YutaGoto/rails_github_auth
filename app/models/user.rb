class User < ApplicationRecord
  def self.find_or_create_with_omniauth!(auth)
    user = find_by(uid: auth['uid'])
    return user if user.present?
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['nickname']
      user.oauth_token = auth['credentials']['token']
    end
  end
end
