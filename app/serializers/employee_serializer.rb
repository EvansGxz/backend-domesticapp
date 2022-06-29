class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :country, :region, :document_id, :document_type, :contact, :created_at,
             :experience, :user_type, :email, :token, :image_url, :new, :contrato,
             :user_id, :phone, :biografy, :lada, :cover

  def user_type
    object.user.user_type
  end

  def email
    object.user.email
  end

  def token
    object.user.token
  end

  def user_id
    object.user.id
  end

  def phone
    object.user.phone
  end

  def lada
    object.user.lada
  end
end
