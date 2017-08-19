class User < ActiveRecord::Base
  validates_presence_of  :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  before_save :downcase_email
  before_create : confirmation_instructions


  def downcase_emai
    self.email = self.email.delete('')
  end

  def generate_confirmation
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end

end
