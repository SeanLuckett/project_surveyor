class MultiQuestionDecorator < SimpleDelegator
  def requirement
    required? ? 'Required' : 'Not required'
  end

  def selection_type
    multipart? ? 'Select multiple' : 'Select one'
  end

  def display_html(num)
    text = required? ? '<span class="text-danger">* </span>' : ''
    text += "#{num}. #{body}"
    text.html_safe
  end
end