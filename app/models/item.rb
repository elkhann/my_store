class Item < ApplicationRecord
  validates :price,
              numericality: { greater_than: 0, allow_nil: true} #Цена не может быть 0, монж создать пустую
  validates :name, :description, presence: true # Обязательно должно быть задано

  belongs_to :category

  after_initialize { } # Item.new; Item.first
  after_save       { } # Item.save; Item.create; item.update_attributes ()
  after_create     { category.inc(:items_count,  1) }
  after_update     { }
  after_destroy    { category.inc(:items_count, -1) } # item.destroy


end
