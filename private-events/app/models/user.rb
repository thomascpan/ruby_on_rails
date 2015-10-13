class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"

  has_many :invitations, :foreign_key => :attendee_id
  has_many :attended_events, :through => :invitations

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
  	SecureRandom.urlsafe_base64
  end

  def remember
  	self.remember_token = User.new_token
  	update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
  	update_attribute(:remember_digest, nil)
  end

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.invitations.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.invitations.find_by(attended_event_id: event.id).destroy
  end

  def upcoming_events
    self.attended_events.upcoming
  end

  def past_events
    self.attended_events.past
  end
end
