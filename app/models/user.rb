# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true,
    format: { with: /\A\w+\z/ }, length: { maximum: 40 }

  def downcase_nickname
    nickname.downcase!
  end
end
