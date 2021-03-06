ActiveAdmin.register Product do
  scope :all, :default => true
  #scope :available do |products|
    #products.where("available_on < ?", Date.today)
  #end
  #scope :drafts do |products|
  #  products.where("available_on > ?", Date.today)
  #end
  #scope :featured_products do |products|
  #  products.where(:featured => true)
  #end

  index :as => :grid do |product|
    div do
      a :href => admin_product_path(product) do
        link_to(image_tag(product.photo.url(:thumb)), admin_product_path(product))
        #image_tag("products/" + product.photo_file_name)
      end
    end
    a truncate(product.ingredient.name), :href => admin_product_path(product)
  end

show do |product|
      attributes_table do
        row :ingredient_id
        row :image do
          image_tag(product.photo.url(:thumb))
        end
      end
      active_admin_comments
    end
  

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row("Total Sold")  { Order.find_with_product(resource).count }
      #row("Dollar Value"){ number_to_currency LineItem.where(:product_id => resource.id).sum(:total_price) }
    end
  end

  sidebar :recent_orders, :only => :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end

  sidebar "Active Admin Demo" do
    render('/admin/sidebar_links', :model => 'products')
  end
end
