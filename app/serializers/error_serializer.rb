class ErrorSerializer < ActiveModel::Serializer
  attributes :message, :status

  def message
    object.message
  end

  def status
    object.status || 500
  end
end
