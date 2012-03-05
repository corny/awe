class User < ActiveRecord::Base

  belongs_to :course
  belongs_to :group
  
  scope :without_course, where(:course_id => nil)
  scope :without_group, where(:group_id => nil)
  

  devise :openid_authenticatable

# attr_accessible :role, :as => :admin

  def self.build_from_identity_url(identity_url)
    User.new(identity_url: identity_url)
  end

  def self.openid_required_fields
    %w(
      http://openid.tzi.de/spec/schema/displayName
      http://openid.tzi.de/spec/schema/mail
      http://openid.tzi.de/spec/schema/matriculationNumber
    )
  end

  def self.openid_optional_fields
    %w(
      http://openid.tzi.de/spec/schema/degreeProgram
    )
  end

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
