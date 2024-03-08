c.url.searchengines["DEFAULT"] = "https://google.com/search?q={}"
c.url.start_pages = "https://google.com"
c.url.default_page = "https://google.com"
c.aliases["goog"] = "open google.com"
c.aliases["gpt"] = "open chat.openai.com"
c.aliases["cedt"] = "config-edit"
c.aliases["csrc"] = "config-source"
c.aliases["q"] = "tab-close"

config.load_autoconfig()
