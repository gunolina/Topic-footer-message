When I first heard about Discourse, I was impressed by the platform’s flexibility, its modern architecture and the possibilities of expanding through themes and plugins. As someone who likes to understand how things work from the inside and likes to add his own style and features, I naturally asked myself: How do you write a plugin for Discourse?


First steps – more obstacles than I expected

Honestly, I had a guess that it would be difficult, but I didn’t expect that I would face so many obstacles at the very first steps. I decided to install Discourse locally on my laptop so that I could safely test and develop without risking anything in a real forum. However, this turned out to be far from trivial.

The problems started with the setting of the environment – from the specific requirements for Ruby and Node.js versions, to different dependencies and configurations of PostgreSQL, Redis and ImageMagick. Some mistakes were confusing, others were downright demotivating. Luckily or not, I’m a stubborn person, and when I want to achieve something, sooner or later I do.

After a few days of trial and error, unburied GitHub issues, forums and documentation, Discourse is finally launched locally. And then came the real challenge – my first plugin.
The idea is simple but useful

I decided there was no need to start with anything too complicated. For the first project, it is important to be achievable, but also to actually do work. This is how the idea of a plugin was born to show a message under the first post of any topic – something simple, but with practical value.

The main idea was as follows:

    Every topic in Discourse starts with an initial post.
    Below this post, a personalized message may be displayed, which the forum administrator may change as desired.
    Suitable for forums that want to draw attention to rules, sponsors, promotion of participation or other important reminders.

The implementation – and it wasn’t easy here.

While reading Discourse’s documentation on the plugin architecture, I quickly realized that while the structure is well arranged, the platform itself is quite large-scale and requires an understanding of Ember.js (for the customer part), Ruby on Rails (for server logic), and quite specific hooks and templates.

I started with the main files:

    plugin.rbThe heart of the plugin.
    Folder assets/javascriptsfor the customer logic.
    initializers– to hook-in to existing components of the platform.
    settings.yml– so that the administrator can set the personalized message.

Initially, I tried to register a JavaScript file with register_asset, only to find that in new versions of Discourse this is no longer needed and is considered an outdated method. After a few errors in the console and an unnerving debugging, I was finally able to attach JavaScript to the right place via api.decorateWidgetI add the message to post-bottomThe part.

Then I added a setup in settings.ymlto allow the administrator to enter the message from the admin panel, and I used siteSettingsin the JS to visualize it.

The result – a small victory, great satisfaction

After many attempts, reading foreign plugins and experimenting, the plugin began to work! At each opening of a theme, the personalized message appeared under the first post. What seemed elementary at the beginning turned out to be not so trivial, but the feeling of satisfaction that I had done it myself was great.
What did I learn?

A lot! But here are the basic things I would share with anyone who starts:

    Discourse has a strict structure, but once you understand it, it becomes logical.
    Documentation helps, but it’s not always enough – don’t be afraid to read foreign plug-ins on GitHub and ask in the forums.
    Ember.js is not scary, but it takes time to get used to.
    Local development is challenging, especially under Windows, so consider using WSL or Ubuntu directly.
    The best learning is by doing.

Where to after that?

After this first successful experience, I already have ideas for more plugins – some more functional, others more visual. I want to try to create a slightly more complex plugin. The possibilities are huge.
The feeling is worth it

My first plugin for Discourse is not a revolutionary thing, but it is an important step in understanding and mastering this powerful platform. If you are wondering whether to start, do it! It won’t be easy, but it’ll be worth it. And the feeling when something you wrote yourself works – it’s irreplaceable.
