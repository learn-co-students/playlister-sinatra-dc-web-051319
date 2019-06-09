# frozen_string_literal: true

class CreateTableGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
    end
  end
end
