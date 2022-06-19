class HabilitySerializer
  include JSONAPI::Serializer
  attributes :id, :hability, :image_url, :body, :score
end
