CreateThread(function()
	while true do
		Wait(50)
	if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({actionhud = "showhudmoney", showhud = false})
	elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
			SendNUIMessage({actionhud = "showhudmoney", showhud = true})
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accounts = data.accounts
	for k,v in pairs(accounts) do
		local account = v
		if account.name == "bank" then
			SendNUIMessage({actionhud = "setValue", key = "bankmoney", value = account.money.." $"})
		end
	end

	-- Job
	local job = data.job
	SendNUIMessage({actionhud = "setValue", key = "job", value = job.label, icon = job.name})

	-- Money
	SendNUIMessage({actionhud = "setValue", key = "money", value = data.money.." $"})
end)

RegisterNetEvent("ui:toggle") 
AddEventHandler("ui:toggle", function(show) 
	SendNUIMessage({actionhud = "showhudmoney", showhud = show}) 
end)

RegisterNetEvent('esx:setAccountMoney') 
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "bank" then
		SendNUIMessage({actionhud = "setValue", key = "bankmoney", value = account.money.." $"})
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  SendNUIMessage({actionhud = "setValue", key = "job", value = job.label, icon = job.name})
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
	SendNUIMessage({actionhud = "setValue", key = "money", value = e.." $"})
end)