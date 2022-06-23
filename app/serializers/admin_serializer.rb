class AdminSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :user_type, :email, :token, :image_url, :role,
             :user_id, :lada, :cover

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

  def lada
    object.user.lada
  end
end
