# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true,
                       format: { with: /\A\w+\z/ }, length: { maximum: 40 }

  has_many :questions, dependent: :delete_all
  has_many :asked_questions, class_name: 'Question', foreign_key: :author_id,
           dependent: :nullify

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def to_param
    nickname
  end

  private
  def downcase_nickname
    nickname.downcase!
  end
end
