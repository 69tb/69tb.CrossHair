local crosshairEnabled = false

RegisterNetEvent("toggleCrosshair")
AddEventHandler("toggleCrosshair", function()
    crosshairEnabled = not crosshairEnabled
    if crosshairEnabled then
        TriggerEvent("chat:addMessage", { args = { "[시스템]", "조준점이 활성화되었습니다." } })
    else
        TriggerEvent("chat:addMessage", { args = { "[시스템]", "조준점이 비활성화되었습니다." } })
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if crosshairEnabled then
            local centerX, centerY = 0.5, 0.5
            local radius = 0.001
            local segments = 32
            
            for i = 0, 360, 360 / segments do
                local angle = math.rad(i)
                local x = centerX + math.cos(angle) * radius
                local y = centerY + math.sin(angle) * radius
                DrawRect(x, y, 0.001, 0.001, 255, 255, 255, 255)
            end
        else
            HideHudComponentThisFrame(14)
        end
    end
end)