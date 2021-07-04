c.content.blocking.enabled = True
c.content.blocking.method = 'both'

c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://gitcdn.xyz/repo/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://cdn.statically.io/gh/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssets@master/filters/resource-abuse.txt",
    "https://combinatronics.io/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "file://" + str(config.configdir / "adblock.txt")
]

c.content.blocking.hosts.lists = [
    "https://gitcdn.xyz/repo/StevenBlack/hosts/master/hosts",
    "https://gitcdn.xyz/repo/curbengh/urlhaus-filter/master/urlhaus-filter-online.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
]
