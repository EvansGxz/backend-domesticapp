class HabilityEmployeeSerializer < ActiveModel::Serializer
  attributes :id, :hability_id, :employee_id, :hability, :icon, :body, :score, :employee_name

  def hability
    object.hability.hability
  end

  def icon
    object.hability.image_url
  end

  def body
    object.hability.body
  end

  def score
    object.hability.score
  end

  def employee_name
    object.employee.full_name
  end
end
