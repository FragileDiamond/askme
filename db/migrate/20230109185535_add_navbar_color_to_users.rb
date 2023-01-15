# frozen_string_literal: true

class AddNavbarColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :navbar_color, :string, default: 'dark-red'
  end
end
