module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('a.js-image-tag').map(&:text)
      end

      def click_tag!(tag_name)
        associated_tag = node.all('a.js-image-tag').select { |tag| tag.text == tag_name }
        associated_tag[0].click if associated_tag.count.positive?
        window.change_to(IndexPage)
      end
    end
  end
end
