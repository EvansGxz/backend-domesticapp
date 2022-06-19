class OfficeSerializer < ActiveModel::Serializer
  attributes :id, :job_category

  has_many :employee
  def job_category
    object.job.job_category
  end
end
