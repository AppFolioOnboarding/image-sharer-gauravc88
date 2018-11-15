require 'page_objects/images/image_card'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '.card-columns', item_locator: '.card', contains: ImageCard do
        def view!
          node.find('a.js-card-img-link').click
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.find('a#new-image-tab').click
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |card|
          card.url == url &&
            (tags.blank? || card.tags == tags)
        end
      end

      def clear_tag_filter!
        filter_text_field = node.find('input#tag-search-field')
        filter_text_field.set('')
        tag_search_button = node.find('input#tag-search-submit-button')
        tag_search_button.click
        window.change_to(IndexPage)
      end
    end
  end
end
