class Cidrblock < ApplicationRecord
    has_many :ipaddresses, dependent: :destroy

    validates :name, presence: true
end
