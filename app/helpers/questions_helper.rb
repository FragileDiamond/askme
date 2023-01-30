# frozen_string_literal: true

module QuestionsHelper
  def question_author(question)
    if question.author
      link_to display_nickname(question.author), user_path(question.author)
    else
      content_tag :i, 'Аноним'
    end
  end

  def render_with_hashtags(body)
    body.gsub(/#\w+/){|word| link_to word, "/questions/hashtag/#{word.delete('#')}"}.html_safe
  end
end
