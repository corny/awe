module User::Authentication
  extend ActiveSupport::Concern
  
  included do
    devise :omniauthable
  end
  
  module ClassMethods
    def find_for_open_id(access_token, params, signed_in_resource=nil)
      token = access_token.info
      logger.debug token.to_hash

      if user = User.where(email: token['email']).first
        user
      else
        User.create! \
          email: token['email'],
          name: token['name'],
          openid_url: params['openid_url']
      end
    end
  end
  
end
