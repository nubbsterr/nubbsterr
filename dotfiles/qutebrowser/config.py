# python /usr/share/qutebrowser/scripts/importer.py bookmarks.html >> .config/qutebrowser/quickmarks to import bookmarks, make sure to have bs4 module installed in ur python venv

# Core goodies
c.auto_save.session = True
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']


# Adblock goodies
c.content.blocking.enabled = True
c.content.blocking.method = 'auto'  # Uses python-adblock if installed
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt']
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",  # Base hosts block
]

# Privacy goodies
c.content.cookies.store = True  # Store cookies for sessions
c.content.headers.do_not_track = True  # Send DNT header to block trackers
c.content.canvas_reading = False  # Prevent fingerprinting via canvas 
c.content.webgl = False  # Disable WebGL fingerprinting
c.content.geolocation = False

# Themes goodies
c.fonts.default_family = ["JetBrains Mono Nerd Font"]
c.fonts.default_size = "16pt"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
c.tabs.width = '7%'

# Pywal integration, is edited to have transparent backgrounds
#config.source('qutewal.py')

config.load_autoconfig(True)
