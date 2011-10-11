class TestSchema < ActiveRecord::Migration
  def self.up
    create_table :foos do |t|
      t.integer :bar_id
    end

    create_table :bars do |t|
    end

    create_table :quxs do |t|
      t.integer :foo_id
    end

    create_table :quuxs do |t|
      t.integer :foo_id
    end

    create_table :corges do |t|
    end

    create_table :foos_corges do |t|
      t.integer :foo_id
      t.integer :corge_id
    end


  end
end
