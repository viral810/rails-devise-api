class EnablePgExtensions < ActiveRecord::Migration[6.1]
  def change
    enable_extension "citext"
    enable_extension 'pgcrypto'
  end
end
