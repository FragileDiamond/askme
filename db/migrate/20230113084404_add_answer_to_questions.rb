# frozen_string_literal: true

class AddAnswerToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer, :text
  end
end
