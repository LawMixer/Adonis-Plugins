local RestrictToLevel = 100; --// Players must be level X or higher in the admin ranks
local PlayerFinders = {  --// Player finders to restrict
  "all",
  "others",
  "nonadmins",
  "@everyone",
  "admins",
  "$group",
  "%team",
  "team-",
  "group-",
  "#number",
  "radius-"
}


return function()
  local Admin = server.Admin;
  local Functions = server.Functions;
  local Finders = Functions.PlayerFinders;

  for _, ind in next, PlayerFinders do
    local finder = Finders[ind];
    if finder then
      local oldFunc = finder.Function;
      finder.Function = function(msg, plr, ...)
        if Admin.GetLevel(plr) >= RestrictToLevel then
          return oldFunc(msg, plr, ...);
        end
      end
    end
  end
end
