class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :document_id, :client_type, :birth_date, :region,
             :cod_refer, :country, :document_type, :user_type, :full_name, :cover,
             :token, :new, :image_url, :social_id, :encargado, :user_id, :lada, :created_at
  def user_type
    object.user.user_type
  end

  def email
    object.user.email
  end

  def token
    object.user.token
  end

  def phone
    object.user.phone
  end

  def social_id
    object.user.social_id
  end

  def user_id
    object.user.id
  end

  def lada
    object.user.lada
  end
end
