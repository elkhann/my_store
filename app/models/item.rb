class Item < ApplicationRecord
  validates :price,
              numericality: { greater_than: 0, allow_nil: true} #Цена не может быть 0, монж создать пустую
  validates :name, :description, presence: true # Обязательно должно быть задано


  after_initialize { } # Item.new; Item.first
  after_save       { } # Item.save; Item.create; item.update_attributes ()
  after_create     { }
  after_update     { }
  after_destroy    { } # item.destroy


end
