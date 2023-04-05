class CreateFormsUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :forms_uploads, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :form, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
