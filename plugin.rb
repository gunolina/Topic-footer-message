# name: topic-footer-message
# about: Adds a message to the end of the first post in every topic
# version: 0.2
# authors: milenski

enabled_site_setting :topic_footer_message_enabled

register_asset "stylesheets/common/topic-footer-message.scss"

after_initialize do
  on(:post_process_cooked) do |doc, post|
    if SiteSetting.topic_footer_message_enabled &&
       post.post_number == 1 &&
       post.topic.present? &&
       SiteSetting.topic_footer_custom_message.present?

      cooked_html = doc.at_css("body") || doc

      message_html = <<~HTML
        <div class="topic-footer-message">
          #{SiteSetting.topic_footer_custom_message}
        </div>
      HTML

      cooked_html.inner_html += message_html
    end
  end
end
