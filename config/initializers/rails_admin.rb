#encoding: utf-8
# RailsAdmin config file. Generated on September 10, 2012 23:20
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  #config.authenticate_with do
  #  # Use sorcery's before filter to auth users
  #  require_login
  #end

  config.current_user_method { current_user } # auto-generated

  config.authorize_with{
    redirect_to main_app.root_path, :alert => "Вы не обладаете достаточными правами для доступа к данной странице" unless current_user && current_user.admin?
  }

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de  
  
  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['sravni-ka', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  #config.excluded_models = [ShopProduct] #, UserShop Ckeditor::AttachmentFile, Ckeditor::Picture, Ckeditor::Asset]
  
  config.model Area do
    object_label_method do
      "#{bindings[:view].city.name if bindings[:view].city != nil}"
    end
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
    #list do
    #  configure :id, :integer
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
    #end
  end

  config.model Article do
    # Found associations:
      #configure :parent, :belongs_to_association 
      #configure :special_offers, :has_many_association 
      #configure :children, :has_many_association   #   # Found columns:      
      configure :id, :integer       
      configure :title, :string 
      configure :body, :text       
      #configure :created_at, :datetime 
      #configure :updated_at, :datetime 
      configure :slug, :string       
      #configure :parent_id, :integer         # Hidden       
      #configure :lft, :integer 
      #configure :rgt, :integer 
      #configure :depth, :integer   #   # Sections:
      #configure :special_offer, :boolean 
      #configure :meta_title, :string 
      #configure :help_info, :boolean   #   # Sections:
    list do; end
    export do; end
    show do; end
    edit do
      #field :parent
      #field :parent_id, :integer do
      #  visible false
      #end
      #field :parent, :belongs_to_association
      field :title, :string 
      field :body, :text do
        ckeditor do 
          true
        end
      end
    end
    create do; end
    update do; end
  end

  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [City, User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [City, User]

  # Application wide tried label methods for models' instances
  #config.label_methods << :to_label # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model City do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :username, :string 
  #     configure :email, :string 
  #     configure :crypted_password, :string 
  #     configure :salt, :string 
  #     configure :shop_id, :integer 
  #     configure :city_id, :integer 
  #     configure :admin, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :remember_me_token, :string 
  #     configure :remember_me_token_expires_at, :datetime 
  #     configure :reset_password_token, :string 
  #     configure :reset_password_token_expires_at, :datetime 
  #     configure :reset_password_email_sent_at, :datetime 
  #     configure :activation_state, :string 
  #     configure :activation_token, :string 
  #     configure :activation_token_expires_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
