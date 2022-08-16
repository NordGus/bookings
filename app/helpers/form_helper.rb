module FormHelper
  def has_errors(object, attribute)
    if object.errors.details[attribute].present?
      " is-danger"
    else
      ""
    end
  end

  def attribute_errors(object, attribute)
    object.errors.full_messages_for(attribute)
  end
end