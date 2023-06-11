class Audition < ApplicationRecord
  belongs_to :role

  def call_back
    update(hired: true)
  end

  def role
    Role.find(role_id)
  end
end
