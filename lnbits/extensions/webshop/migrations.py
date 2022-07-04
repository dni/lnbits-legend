async def m001_initial(db):
   await db.execute(
       f"""
       CREATE TABLE webshop.webshop (
           id TEXT PRIMARY KEY,
           name TEXT NOT NULL,
           url TEXT NOT NULL,
           wallet TEXT NOT NULL,
           time TIMESTAMP NOT NULL DEFAULT {db.timestamp_now}
       );
   """
   )
   await db.execute(
       f"""
       CREATE TABLE webshop.products (
           id TEXT PRIMARY KEY,
           webshop TEXT NOT NULL,
           name TEXT NOT NULL,
           image TEXT NOT NULL,
           price FLOAT NOT NULL,
           time TIMESTAMP NOT NULL DEFAULT {db.timestamp_now}
       );
   """
   )
