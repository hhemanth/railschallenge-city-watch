class EmergencySerializer < ActiveModel::Serializer
  attributes :id, :code, :medical_severity, :fire_severity, :police_severity
end