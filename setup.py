from setuptools import setup

requires = [
    'pyramid',
    'pyramid_chameleon',
    'pyramid_debugtoolbar',
    'numpy',
    'marshmallow',
    'deform',
    'sqlalchemy',
    'pyramid_tm',
    'pillow',
    'bcrypt',
    'waitress',
    'rarfile',
    'libarchive-c',
    'zope.sqlalchemy',
    'requests',
    'mysqlclient'
]

setup(name='titledb',
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = titledb:main
      [console_scripts]
      initialize_titledb_db = titledb.initialize_db:main
      update_titledb_db = titledb.update_db:main
      titledb_cli = titledb.cli:main
      """,
)
