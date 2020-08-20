import discord
from discord.ext import commands

class EGBotB(commands.Cog):
    def __init__(self, bot):
        self.bot = bot

    @commands.command()
    async def lista(self, ctx):
        await ctx.send("Implementeremo questa funzione nel futuro™")

def setup(bot):
    bot.add_cog(EGBotB(bot))
