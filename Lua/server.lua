local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())

print("[69TB] 조준점 시스템 로드 완료 ( 사용법 : /조준점 )")

RegisterCommand("조준점", function(source, args, rawCommand)
    local user_id = vRP.getUserId({source})
    if user_id then
        TriggerClientEvent("toggleCrosshair", source)
    end
end)