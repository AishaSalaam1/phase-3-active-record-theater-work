class Role < ApplicationRecord
    has_many :auditions
  
    def actors
      auditions.pluck(:actor)
    end
  
    def locations
      auditions.pluck(:location)
    end
  
    def lead
      hired_audition = auditions.find_by(hired: true)
      hired_audition || 'No actor has been hired for this role'
    end
  
    def understudy
      hired_auditions = auditions.where(hired: true)
      hired_auditions.second || 'No actor has been hired for understudy for this role'
    end
  end
  