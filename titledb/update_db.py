import os, sys, re, transaction, base64, zlib

from sqlalchemy import engine_from_config

from pyramid.paster import (
    get_appsettings,
    setup_logging,
)

from .models import (
    DBSession,
    CIA,
    Entry,
    User,
    Group,
    Base,
)

from .security import hash_password

def usage(argv):
    cmd = os.path.basename(argv[0])
    print('usage: %s <config_uri>\n'
          '(example: "%s development.ini")' % (cmd, cmd))
    sys.exit(1)


def main(argv=sys.argv):
    if len(argv) != 2:
        usage(argv)
    config_uri = argv[1]
    setup_logging(config_uri)
    settings = get_appsettings(config_uri)
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)

    with transaction.manager:
        for cia in DBSession.query(CIA).all():
            print(cia.icon_s)
            icons1 = base64.b64decode(cia.icon_s)
            try:
                icons2 = zlib.decompress(icons1)
            except zlib.error:
                icons2 = icons1
            iconl1 = base64.b64decode(cia.icon_l)
            try:
                iconl2 = zlib.decompress(iconl1)
            except zlib.error:
                iconl2 = iconl1
            cia.icon_s = base64.b64encode(icons2)
            cia.icon_l = base64.b64encode(iconl2)
            DBSession.query(CIA).filter_by(id=cia.id).update(dict(icon_s=cia.icon_s,icon_l=cia.icon_l))

    with transaction.manager:

        for cia in DBSession.query(CIA).all():
            m = re.search('(.*)#(.*)', cia.url.url)
            if m:
                cia.url  = m.group(1)
                cia.path = m.group(2)

