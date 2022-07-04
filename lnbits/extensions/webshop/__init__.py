from fastapi import APIRouter

from lnbits.db import Database
from lnbits.helpers import template_renderer

db = Database("ext_webshop")

webshop_ext: APIRouter = APIRouter(prefix="/webshop", tags=["webshop"])


def webshop_renderer():
    return template_renderer(["lnbits/extensions/webshop/templates"])


from .views import *  # noqa
from .views_api import *  # noqa
