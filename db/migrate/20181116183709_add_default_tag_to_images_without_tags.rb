class AddDefaultTagToImagesWithoutTags < ActiveRecord::Migration[5.2]
  def up
    images_without_tags = Image.find_by_sql "SELECT * FROM images WHERE id NOT IN (
    SELECT DISTINCT taggable_id from taggings
    )"
    images_without_tags.each do |image|
      image.tag_list.add('[default-image-sharer-tag]')
      image.save
      puts image.inspect
    end
  end

  def down
    execute <<-SQL
      DELETE FROM taggings WHERE tag_id = (SELECT id FROM tags WHERE name = '[default-image-sharer-tag]')
      DELETE FROM tags WHERE name = '[default-image-sharer-tag]'
    SQL
  end
end
