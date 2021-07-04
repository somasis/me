import glob

config.load_autoconfig(True)

for file in glob.iglob(str(config.configdir / 'config.d/*.py')):
    if file.endswith('.py'):
        config.source(file)
