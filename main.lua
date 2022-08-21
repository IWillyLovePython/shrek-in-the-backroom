--shreks in back room inf ammo
local gun = getsenv(game:GetService("Players").LocalPlayer.Backpack.Gun.HandgunScript)
setupvalue(gun.UpdateAmmo, 2, 10000000000)

--shreks in back room one hit gun
local metatable = getrawmetatable(game);
local oldmetatable = metatable.__namecall
setreadonly(metatable, false)

metatable.__namecall = newcclosure(function(remote,...)
   args = {...}
   method = tostring(getnamecallmethod())
   if method == "FireServer" and tostring(remote) == "TakeDamage" then
       args[2] = 100000000
       return oldmetatable(remote,unpack(args))
   end
   return oldmetatable(remote, ...)
end)

setreadonly(metatable, true)
