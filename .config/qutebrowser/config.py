## Autogenerated config.py
## Documentation:
##   qute://help/configuring.html
##   qute://help/settings.html

## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig()
#searchengine
c.url.searchengines = {'DEFAULT': "https://www.google.com/search?q={}"}

# overload open
config.bind('o', 'set-cmd-text -s :open -t')

#editor
config.bind('<ctrl+e>', 'open-editor', mode='insert')
config.bind('<ctrl+n>', 'nop')
c.editor.command = [ "alacritty","-e","nvim", "{}" ]

#moving between tabs
config.bind('<ctrl+s>', 'tab-next')
config.bind('<ctrl+h>', 'tab-prev')
c.tabs.position = 'right'
c.tabs.show = 'switching'
c.tabs.show_switching_delay = 2000

c.url.start_pages = ["https://calendar.google.com/calendar/r"]

#quick exit
config.bind('<ctrl+a>', 'quit')

