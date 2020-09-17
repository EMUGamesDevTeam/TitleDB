import discord, os, asyncio
from sanic import Sanic
from discord.ext import commands
from sanic.response import json
from dotenv import load_dotenv
from threading import Thread
load_dotenv()
token = os.getenv("TOKEN")
loop = asyncio.get_event_loop()
app = Sanic(__name__)

#@app.route("/bot/get_data", methods=["POST"])
#@bot.event
#async def get_tdb_data(request):
#    channel = bot.get_channel(745965602472198144)
#    await channel.send("eeeee")
#    return json({
#        "parsed": True,
#        "url": request.url,
#        "body": request.body.decode("UTF-8")
#    })

class EGBot(commands.Bot):
    def __init__(self):
        super().__init__(command_prefix="eg.")


    def run(self, *args, **kwargs):
        try:
            loop.create_task(self.start(token))
        except KeyboardInterrupt:
            pass
        except discord.LoginFailure:
            print("Invalid token.")
        finally:
            loop.create_task(self.logout())
            for task in asyncio.all_tasks(loop):
                task.cancel()
            loop.create_task(self.logout())
            print("Shutting down...")

    async def send_test(self, obj):
#        await self.wait_until_ready()
        channel = self.get_channel(int(745965602472198144))
        await channel.send(obj)

    async def on_ready(self):
        print("Logged in.")
        self.load_extension("bot")
        await self.send_test("eeeee")

    @app.route("/bot/get_data", methods=["POST"])
    async def get_tdb_data(request):
        await EGBot().send_test("eeeee")
        return json({
            "parsed": True,
            "url": request.url,
            "body": request.body.decode("UTF-8")
        })

@app.listener('after_server_start')
async def bot_startup(app, loop):
    app.add_task(EGBot().start(token))

@app.listener('before_server_stop')
async def stop_bot(app, loop):
    await EGBot().logout()

app.run(host="0.0.0.0", port=8765)

loop.run_forever()
