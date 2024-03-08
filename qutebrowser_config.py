# Make everything google (i prefer it)
c.url.searchengines["DEFAULT"] = "https://google.com/search?q={}"
c.url.start_pages = "https://google.com"
c.url.default_page = "https://google.com"

# Website shortcuts
c.aliases["goog"] = "open google.com"
c.aliases["gpt"] = "open chat.openai.com"
c.aliases["gh"] = "open github.com"

# Config aliases
c.aliases["cedt"] = "config-edit"
c.aliases["csrc"] = "config-source"

# As a vim user, I see this as necessary
c.aliases["q"] = "tab-close"

config.load_autoconfig()
