class ItemsMailer < ApplicationMailer
  default from: 'info@my_store.com', template_path: 'mailers/items'

  def item_destroyed(item)
    @item = item
    mail to: '7495500@gmail.com', subject: 'Item destroyed'
  end
end
