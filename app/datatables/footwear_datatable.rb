class FootwearDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :content_tag
  def_delegator :@view, :fa_icon
  def_delegator :@view, :edit_footwear_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      sku: { source: "Footwear.sku", cond: :like, searchable: true, orderable: true },
      article: { source: "Footwear.article", cond: :like, searchable: true, orderable: true },
      color: { source: "Footwear.color", searchable: false, orderable: false },
      size: { source: "Footwear.size", searchable: false, orderable: false },
      category: { source: "Footwear.category", cond: :like, searchable: false, orderable: false },
      stock: { source: "Footwear.stock"},
    }
  end

  def data
    records.map do |record|
      {
        sku: record.sku,
        article: record.article,
        color: content_tag(:span, "", class: ["dot"], style: ["background-color:"+ record.color.hex_code + ";width:15px;height: 15px;border: 1px solid black;"]),
        size: record.size.to_s,
        category: record.category.name,
        stock: record.stock,
        options: (link_to((fa_icon "eye"), record) + link_to((fa_icon "pencil"), edit_footwear_path(record)) + link_to((fa_icon "trash-o"), record, method: :delete, data: { confirm: '¿Esta seguro que desea eliminar?' }))
      }
    end
  end

  def get_raw_records
    # insert query here
    Footwear.all
    #Footwear.includes(:trademark, :category).all
  end

end
