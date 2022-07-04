from pydantic import BaseModel

class Shop(BaseModel):
   id: str
   name: str
   url: str
   wallet: str
   timestamp: int

class Product(BaseModel):
   id: str
   webshop: str
   name: str
   image: str
   price: float
   timestamp: int
