module SurveysHelper
  def have_checked?(response, answer_template, val)
    if response.present? and response.value.present? and response.value[answer_template.id].present?
      saved_val = response.value[answer_template.id]

      if saved_val.is_a?(Array)
        saved_val.include? val
      else
        saved_val == val
      end
    else
      false
    end

  end
end
