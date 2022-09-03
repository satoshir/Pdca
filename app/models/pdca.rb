class Pdca < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: { maximum: 50 }
    validates :user_id, presence: true
    validates :plan, presence: true, length: { in: 5..300 }
    validates :do, presence: true, length: { in: 5..300 }
    validates :check, presence: true, length: { in: 5..300 }
    validates :adjust, presence: true, length: { in: 5..300 }
end
