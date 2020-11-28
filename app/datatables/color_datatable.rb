class ColorDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :fa_icon
  def_delegator :@view, :edit_color_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Color.id", cond: :eq },
      name: { source: "Color.name", cond: :like, searchable: true, orderable: true },
      hex_code: { source: "Color.hex_code"},
      
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        name: record.name,
        swatch: ('<span class="dot" style="background-color:' + record.hex_code + '";>').html_safe,
        hex_code: record.hex_code,
        options:  (link_to((fa_icon "eye"), record) + link_to((fa_icon "pencil"), edit_color_path(record)) + link_to((fa_icon "trash-o"), record, method: :delete, data: { confirm: '¿Esta seguro que desea eliminar?' }) ),
      }
    end
  end

  def get_raw_records
    # insert query here
    Color.all
  end

end
