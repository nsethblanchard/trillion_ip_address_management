class Cidrblock < ApplicationRecord
    has_many :ipaddresses, dependent: :destroy
end
