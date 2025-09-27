local Main = game:HttpGet("https://gitlab.com/cooldawghaha/gitlabswitch/-/raw/main/MainBranch?ref_type=heads")
local Alternate = game:HttpGet("https://gitlab.com/cooldawghaha/gitlabswitch/-/raw/main/AlternateBranch.lua?ref_type=heads") -- ALWAYS TRY MAIN BRANCH FIRST, AS THIS ONE HAS NOT BEEN TESTED FOR BUGS
getgenv().saveconfig = false -- set to true if u want ur configs to be saved each time!
loadstring(Main)()
