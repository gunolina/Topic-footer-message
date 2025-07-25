import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "topic-footer-message",

  initialize() {
    withPluginApi("1.20.0", (api) => {
      api.decorateWidget("post:after-cooked", (dec) => {
        const post = dec.getModel();

        // Само под първия пост
        if (
          post.post_number === 1 &&
          settings.topic_footer_message_enabled &&
          settings.topic_footer_custom_message
        ) {
          return dec.h("div.topic-footer-message", {
            innerHTML: settings.topic_footer_custom_message,
          });
        }
      });
    });
  },
};
