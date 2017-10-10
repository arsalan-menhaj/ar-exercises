class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

  # The password generator should be registered as a
  # before_create callback so that, if it fails, then
  # the entire employee creation process fails. This
  # is ideal, since we do not want a user to be created
  # without a password. Similarly, we do not want it to
  # be a before_save callback, since the save might fail,
  # leaving inconsistent data.
  before_create :generate_password

  private
    def generate_password
      self.password = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
    end
end

