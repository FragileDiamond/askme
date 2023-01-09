# frozen_string_literal: true

module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end
end
