class Band < ApplicationRecord
    has_many :concerts
    has_many :crews

    enum band_type: %i[band girl_band boy_band]
end
