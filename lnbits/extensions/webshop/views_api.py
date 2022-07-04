# import httpx
from . import webshop_ext

@webshop_ext.get("/api/v1/webshop/products")
async def get_products():
    products = [
        {
            "name": "coin",
            "price": "100",
            "image": "lol.jpg",
        },
    ]
    return products
