module User::Authentication
  extend ActiveSupport::Concern
  
  included do
    devise :openid_authenticatable
  end

  module ClassMethods
    def build_from_identity_url(identity_url)
      User.new(identity_url: identity_url)
    end
  
    def openid_required_fields
      %w(
        http://openid.tzi.de/spec/schema/displayName
        http://openid.tzi.de/spec/schema/mail
        http://openid.tzi.de/spec/schema/matriculationNumber
      )
    end
  
    def openid_optional_fields
      %w(
        http://openid.tzi.de/spec/schema/degreeProgram
      )
    end
  end
  
  module InstanceMethods
    def openid_fields=(fields)
      logger.debug fields
  
      fields.each do |key, value|
        # Some AX providers can return multiple values per key
        if value.is_a? Array
          value = value.first
        end
  
        case key.to_s
          when 'http://openid.tzi.de/spec/schema/displayName'
            self.name = value
          when 'http://openid.tzi.de/spec/schema/mail'
            self.email = value
          when 'http://openid.tzi.de/spec/schema/degreeProgram'
            self.degree_program = value
          when 'http://openid.tzi.de/spec/schema/matriculationNumber'
            self.matriculation = value.to_i
          else
            logger.error "Unknown OpenID field: #{key}"
        end
      end
    end
  end
  
end