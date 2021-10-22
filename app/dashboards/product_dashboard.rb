require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    line_items: Field::HasMany,
    user: Field::BelongsTo,
    category: Field::BelongsTo,
    subcategory: Field::BelongsTo,
    #image_url_attachment: Field::HasOne,
    #image_url_blob: Field::HasOne,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    price: Field::Number.with_options(decimals: 2),
    image_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    delivered: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    line_items
    user
    category
    subcategory
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    line_items
    user
    category
    subcategory
    id
    title
    description
    price
    image_url
    created_at
    updated_at
    delivered
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    line_items
    user
    category
    subcategory
    title
    description
    price
    image_url
    delivered
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
