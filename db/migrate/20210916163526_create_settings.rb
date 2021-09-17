class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.references :church, foreign_key: true
      t.text :app_name, default: Rails.application.config.site[:name]
      t.text :devise, default: "F cfa"
      t.boolean :navbar_border, default: false
      t.boolean :body_small_text, default: false
      t.boolean :navbar_small_text, default: false
      t.boolean :sidebar_small_text, default: false
      t.boolean :footer_small_text, default: false
      t.boolean :sidebar_nav_flat_style, default: false
      t.boolean :sidebar_nav_legacy_style, default: false
      t.boolean :sidebar_nav_compact, default: false
      t.boolean :sidebar_nav_child_indent, default: false
      t.boolean :sidebar_nav_hide_on_collapse, default: false
      t.boolean :sidebar_disable_auto_expand, default: false
      t.boolean :brand_small_text, default: false
      t.text :navbar_color, default: "navbar-white"
      t.text :accent_color, default: " " 
      t.text :sidebar_color, default: "sidebar-dark-primary"
      t.boolean :dark_navbar, default: false
      t.boolean :dark_sidebar, default: false
      t.text :brand_logo_color, default: "primary"
    end
  end
end
