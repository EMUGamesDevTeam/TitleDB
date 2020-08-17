"""
Every table must contain these columns:
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),

File-based tables (check models.py to find them) must also contain these columns:
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),

"""

print("Starting up...")
from marshmallow import Schema, fields

from pyramid.security import Allow, Everyone

from sqlalchemy import (
    MetaData,
    Boolean,
    Column,
    DateTime,
    Integer,
    Binary,
    String,
    Text,
    Unicode,
    ForeignKey,
    Table,
    create_engine
)
meta = MetaData()

from sqlalchemy.ext.declarative import ( AbstractConcreteBase, declarative_base, declared_attr )

from sqlalchemy.ext.hybrid import hybrid_property

from sqlalchemy.orm import (
    relationship,
    scoped_session,
    sessionmaker,
    column_property
)

from sqlalchemy.sql import ( select, func, cast )

db_user = input("Enter your MySQL user name (do NOT use root!): ")
db_pass = input("Enter your MySQL user password: ")
db_name = input("Enter your MySQL database name: ")
print("Okay, inserting data into database...")
engine = create_engine(f"mysql://{db_user}:{db_pass}@localhost/{db_name}?charset=utf8&use_unicode=1", echo=True)

url = Table("url", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("url", String(1024), index=True),
    Column("filename", String(256)),
    Column("version", String(64)),
    Column("etag", String(512)),
    Column("mtime", DateTime),
    Column("content_type", String(64)),
    Column("size", Integer),
    Column("sha256", String(64))
)

entry = Table("entry", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("category_id", Integer, ForeignKey('category.id')),
    Column("name", String(128)),
    Column("author", String(128)),
    Column("headline", String(128)),
    Column("description", Text),
    Column("url", String(2048))
)

cia = Table("cia", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("entry_id", Integer, ForeignKey('entry.id')),
    Column("assets_id", Integer, ForeignKey('assets.id')),
    Column("url_id", Integer, ForeignKey('url.id')),
    Column("titleid", String(16)),
    Column("name_s", Unicode(64)),
    Column("name_l", Unicode(128)),
    Column("publisher", Unicode(64)),
    Column("icon_s", String(1536)),
    Column("icon_l", String(6144))
)

tdsx = Table("tdsx", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("entry_id", Integer, ForeignKey('entry.id')),
    Column("smdh_id", Integer, ForeignKey('smdh.id')),
    Column("xml_id", Integer, ForeignKey('xml.id')),
    Column("assets_id", Integer, ForeignKey('assets.id')),
    Column("url_id", Integer, ForeignKey('url.id'))
)

smdh = Table("smdh", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("name_s", Unicode(64)),
    Column("name_l", Unicode(128)),
    Column("publisher", Unicode(64)),
    Column("icon_s", String(1536)),
    Column("icon_l",String(6144))
)

xml = Table("xml", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64))
)

arm9 = Table("arm9", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("entry_id", Integer, ForeignKey('entry.id')),
    Column("url_id", Integer, ForeignKey('url.id')),
    Column("assets_id", Integer, ForeignKey('assets.id'))
)

assets = Table("assets", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("mapping", Text)
)
screenshot = Table("screenshot", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("version", String(64)),
    Column("size", Integer),
    Column("mtime", DateTime),
    Column("path", String(512)),
    Column("sha256", String(64)),
    Column("entry_id", Integer, ForeignKey('entry.id'))
)

category = Table("category", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("name", String(128))
)

status = Table("status", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("name", String(128))
)

submission = Table ("submission", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean, default=True),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("url", String(1024)),
    Column("status", String(1024)),
    Column("client_addr", String(45)) # IPv4-mapped IPv6 maximum
)

users = Table("users", meta, 
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("name", String(64)),
    Column("password", String(64)),
    Column("email", String(256))
)

groups = Table("groups", meta,
    Column("id", Integer, primary_key=True),
    Column("active", Boolean),
    Column("created_at", DateTime, server_default=func.now()),
    Column("updated_at", DateTime, server_default=func.now(), onupdate=func.now()),
    Column("name", String(64))
)

meta.create_all(engine)