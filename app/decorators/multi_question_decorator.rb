class MultiQuestionDecorator < SimpleDelegator
  def requirement
    required? ? 'Required' : 'Not required'
  end

  def selection_type
    multipart? ? 'Select multiple' : 'Select one'
  end
end