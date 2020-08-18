from setuptools import setup

requires = [
    'pyramid==1.9.2',
    'pyramid_chameleon',
    'pyramid_debugtoolbar==4.4',
    'numpy==1.14.1',
    'marshmallow==2.21.0',
    'deform==2.0.5',
    'sqlalchemy==1.2.3',
    'pyramid_tm==2.2.1',
    'pillow==5.0.0',
    'bcrypt==3.1.4',
    'waitress==1.1.0',
    'rarfile==3.0',
    'libarchive-c==2.7',
    'zope.sqlalchemy==1.0',
    'requests==2.18.4',
    'mysqlclient==1.3.12'
]

setup(name='titledb',
      python_requires="==3.6.*",
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = titledb:main
      [console_scripts]
      install_titledb_db = titledb.insert_db:main
      initialize_titledb_db = titledb.initialize_db:main
      update_titledb_db = titledb.update_db:main
      titledb_cli = titledb.cli:main
      """,
)
