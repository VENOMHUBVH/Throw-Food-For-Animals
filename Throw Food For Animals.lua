-- VENOM HUB | key: VENOM-HUB-8492-7316 | 24h
-- Locked to Game: Throw Food For Animals
-- Version: v1.3.2

local isCorrectGame = false
pcall(function()
 local success, info = pcall(game.GetService, game, "MarketplaceService")
 if success and info then
  local pcall_success, productInfo = pcall(info.GetProductInfo, info, game.PlaceId)
  if pcall_success and productInfo and productInfo.Name then
   if productInfo.Name:find("Throw Food") or productInfo.Name:find("Throw Food For Animals") then
    isCorrectGame = true
   end
  end
 end
end)

if not isCorrectGame then
 warn("[VENOM HUB] This script only works in 'Throw Food For Animals'")
 return
end

local P,S,R,U,V,T,C,L,St=game:GetService("Players"),game:GetService("SoundService"),game:GetService("ReplicatedStorage"),game:GetService("UserInputService"),game:GetService("VirtualUser"),game:GetService("TweenService"),game:GetService("CoreGui"),game:GetService("Lighting"),game:GetService("Stats")
local Ws,RS,LP=game:GetService("Workspace"),game:GetService("RunService"),P.LocalPlayer
local KEY,DC,DUR="VENOM-HUB-8492-7316","https://discord.gg/upsFFfUbCY",86400
local VERSION="v1.3.2"

local function rd()
 local timeSaved = nil
 pcall(function()
  if readfile and isfile and isfile(".venom_key") then
   timeSaved = tonumber(readfile(".venom_key"))
  end
 end)
 if not timeSaved then
  pcall(function() timeSaved = tonumber(LP:GetAttribute("VK")) end)
 end
 return timeSaved
end

local function wr(t)
 pcall(function()
  if writefile then writefile(".venom_key", tostring(t)) end
 end)
 pcall(function() LP:SetAttribute("VK", t) end)
end

local function gate()
 local g=Instance.new("ScreenGui") g.Name="VenomKeyGate" g.ResetOnSpawn=false g.IgnoreGuiInset=true g.DisplayOrder=1e6
 pcall(function() g.Parent=(gethui and gethui()) or C end) if not g.Parent then g.Parent=LP:WaitForChild("PlayerGui") end
 local b=Instance.new("Frame") b.Size=UDim2.new(0,380,0,330) b.Position=UDim2.fromScale(.5,.5) b.AnchorPoint=Vector2.new(.5,.5) b.BackgroundColor3=Color3.fromRGB(8,10,9) b.BorderSizePixel=0 b.Parent=g
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,16)
 local s=Instance.new("UIStroke",b) s.Color=Color3.fromRGB(0,255,136) s.Thickness=1.5 s.Transparency=.3
 local gr=Instance.new("UIGradient",b) gr.Color=ColorSequence.new(Color3.fromRGB(0,40,28),Color3.fromRGB(8,10,9)) gr.Rotation=90
 local function lbl(t,y,h,sz,col,f) local l=Instance.new("TextLabel") l.Size=UDim2.new(1,0,0,h) l.Position=UDim2.new(0,0,0,y) l.BackgroundTransparency=1 l.Font=f or Enum.Font.Gotham l.TextSize=sz l.TextColor3=col l.Text=t l.Parent=b return l end
 lbl("VENOM HUB "..VERSION,18,30,22,Color3.fromRGB(0,255,136),Enum.Font.GothamBold)
 
 local info=lbl("The key is obtained easily, no annoying ads.\nJust join the Discord, go to the #key channel\nand get your 24h key.", 48, 45, 11, Color3.fromRGB(0,255,136))
 
 local box=Instance.new("Frame") box.Size=UDim2.new(1,-50,0,42) box.Position=UDim2.new(0,25,0,95) box.BackgroundColor3=Color3.fromRGB(16,20,18) box.BorderSizePixel=0 box.Parent=b
 Instance.new("UICorner",box).CornerRadius=UDim.new(0,8)
 local bs=Instance.new("UIStroke",box) bs.Color=Color3.fromRGB(0,255,136) bs.Thickness=1 bs.Transparency=.6
 local tb=Instance.new("TextBox") tb.Size=UDim2.new(1,-20,1,0) tb.Position=UDim2.new(0,10,0,0) tb.BackgroundTransparency=1 tb.Font=Enum.Font.Gotham tb.TextSize=14 tb.TextColor3=Color3.new(1,1,1) tb.PlaceholderText="VENOM-HUB-XXXX-XXXX" tb.PlaceholderColor3=Color3.fromRGB(100,110,105) tb.Text="" tb.ClearTextOnFocus=false tb.Parent=box
 local st=lbl("",143,18,12,Color3.fromRGB(255,80,80))
 local function mk(t,y,c) local x=Instance.new("TextButton") x.Size=UDim2.new(1,-50,0,38) x.Position=UDim2.new(0,25,0,y) x.BackgroundColor3=c x.BorderSizePixel=0 x.Font=Enum.Font.GothamBold x.TextSize=14 x.TextColor3=Color3.fromRGB(8,10,9) x.Text=t x.Parent=b Instance.new("UICorner",x).CornerRadius=UDim.new(0,8) return x end
 local cb=mk("CHECK KEY",170,Color3.fromRGB(0,255,136))
 local db=mk("GET KEY (Discord)",218,Color3.fromRGB(88,101,242))
 local at,lock=0,false
 local function sfx(id,v) pcall(function() local s=Instance.new("Sound") s.SoundId=id s.Volume=v s.Parent=S s:Play() s.Ended:Connect(function() s:Destroy() end) end) end
 cb.MouseButton1Click:Connect(function()
  if lock then return end
  local i=tb.Text:gsub("%s+","")
  if i=="" then st.Text="Please enter a key" return end
  st.TextColor3=Color3.fromRGB(255,200,80) st.Text="Verifying..." task.wait(.6)
  if i==KEY then
   lock=true st.TextColor3=Color3.fromRGB(0,255,136) st.Text="Key valid! Loading..." wr(os.time()) sfx("rbxassetid://6026984224",.5) task.wait(.8)
   T:Create(b,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(),BackgroundTransparency=1}):Play() task.wait(.45) g:Destroy()
   _G.__VenomGo()
  else
   at+=1 st.TextColor3=Color3.fromRGB(255,80,80) st.Text="Invalid key ("..at..")"
   local o=b.Position for k=1,6 do b.Position=o+UDim2.fromOffset(math.sin(k*3)*8,0) task.wait(.03) end b.Position=o
  end
 end)
 db.MouseButton1Click:Connect(function()
  local f=setclipboard or toclipboard or (syn and syn.write_clipboard)
  if type(f)=="function" then pcall(function() f(DC) end) st.TextColor3=Color3.fromRGB(0,255,136) st.Text="Discord link copied!" 
  else st.TextColor3=Color3.fromRGB(255,200,80) st.Text="Link: "..DC end
  sfx("rbxassetid://6895079853",.4)
 end)
end

local function hub()
 pcall(function() for _,c in ipairs(((gethui and gethui()) or C):GetChildren()) do if c.Name:find("WindUI") or c.Name:find("VENOMHUB") or c.Name:find("VenomPerf") then c:Destroy() end end end)
 if _G.__VC then pcall(_G.__VC) end
 local A=true
 local SFX={C="rbxassetid://6895079853",S="rbxassetid://6026984224",N="rbxassetid://4590662766"}
 local function ps(id,v,p) if not A then return end pcall(function() local s=Instance.new("Sound") s.SoundId=id s.Volume=v or .45 s.PlaybackSpeed=p or 1 s.Parent=S s:Play() s.Ended:Connect(function() s:Destroy() end) end) end
 local function gh() local c=LP.Character return c and c:FindFirstChildOfClass("Humanoid") end
 local function grp() local c=LP.Character return c and c:FindFirstChild("HumanoidRootPart") end
 local Cn={} local function on(s,f) local c=s:Connect(f) Cn[#Cn+1]=c return c end
 local pg=Instance.new("ScreenGui") pg.Name="VenomPerfOverlay" pg.ResetOnSpawn=false pg.IgnoreGuiInset=true pg.DisplayOrder=99999
 pcall(function() pg.Parent=(gethui and gethui()) or C end) if not pg.Parent then pg.Parent=LP:WaitForChild("PlayerGui") end
 local pf=Instance.new("Frame") pf.Size=UDim2.new(0,120,0,40) pf.Position=UDim2.new(1,-130,0,14) pf.BackgroundColor3=Color3.fromRGB(8,10,9) pf.BackgroundTransparency=.3 pf.BorderSizePixel=0 pf.Parent=pg
 Instance.new("UICorner",pf).CornerRadius=UDim.new(0,8)
 local function pl(t,x,y,w,h,sz,c,f) local l=Instance.new("TextLabel") l.Size=UDim2.new(0,w,0,h) l.Position=UDim2.new(0,x,0,y) l.BackgroundTransparency=1 l.Font=f or Enum.Font.Gotham l.TextSize=sz l.TextXAlignment=Enum.TextXAlignment.Left l.TextColor3=c l.Text=t l.Parent=pf return l end
 local fl=pl("-- FPS",10,2,100,16,12,Color3.fromRGB(0,255,136),Enum.Font.GothamBold)
 local ml=pl("-- MS",10,20,100,16,12,Color3.fromRGB(184,255,74),Enum.Font.GothamBold)
 local fr,flt,fc=0,tick(),0
 on(RS.RenderStepped,function() if not A then return end fr+=1 local n=tick() if n-flt>=1 then fc=fr fr=0 flt=n fl.Text=fc.." FPS" ml.Text=math.floor(LP:GetNetworkPing()*1000+.5).." MS" end end)

 local oL,opt={},false
 local function sv() pcall(function() oL={GS=L.GlobalShadows,BR=L.Brightness,FE=L.FogEnd,ED=L.EnvironmentDiffuseScale,ES=L.EnvironmentSpecularScale} end) end
 local function ao(on)
  opt=on
  if on then 
      sv() 
      pcall(function() L.GlobalShadows=false L.Brightness=1 L.FogEnd=1e6 L.EnvironmentDiffuseScale=0 L.EnvironmentSpecularScale=0 settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end)
      pcall(function() for _,v in ipairs(Ws:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Light") or v:IsA("Texture") then v:Destroy() elseif v:IsA("Explosion") then v:Destroy() end end end)
      pcall(function() local t=Ws:FindFirstChildOfClass("Terrain") if t then t.Decoration=false t.WaterWaveSize=0 t.WaterReflectance=0 end end)
  else 
      pcall(function() if oL.GS~=nil then L.GlobalShadows=oL.GS end if oL.BR then L.Brightness=oL.BR end if oL.FE then L.FogEnd=oL.FE end settings().Rendering.QualityLevel=Enum.QualityLevel.Automatic end) 
  end
 end

 local Sh=R:FindFirstChild("Shared") local Rm=R:FindFirstChild("Remotes")
 local function rq(m) if not m then return end local o,r=pcall(require,m) return o and r or nil end
 local RMod=rq(Sh and Sh:FindFirstChild("Remotes"))
 local function rem(n) return Rm and Rm:FindFirstChild(n) end
 local function iv(n,...)
  if not A then return end
  if RMod then local f=RMod.Invoke or RMod.invoke if type(f)=="function" then local o,r=pcall(f,n,...) if o and r~=nil then return r end end end
  local r=rem(n) if r then if r:IsA("RemoteFunction") then local o,x=pcall(r.InvokeServer,r,...) if o then return x end elseif r:IsA("RemoteEvent") then pcall(r.FireServer,r,...) return{Ok=true} end end
 end
 local psx=LP:FindFirstChild("PlayerScripts") local cl=psx and (psx:FindFirstChild("Client") or psx:WaitForChild("Client",3)) local Ct=cl and (cl:FindFirstChild("Controllers") or cl:WaitForChild("Controllers",3))
 local TC=Ct and rq(Ct:FindFirstChild("ThrowController")) local TM=Ct and rq(Ct:FindFirstChild("ThrowMeter")) local RSq=Ct and rq(Ct:FindFirstChild("RevealSequence")) local TrC=Ct and rq(Ct:FindFirstChild("TrainingController")) local DC=Ct and rq(Ct:FindFirstChild("DataController")) local CS=Ct and rq(Ct:FindFirstChild("ClientState"))
 local Cf=R:FindFirstChild("Config") or R:WaitForChild("Config",3) local GC=Cf and rq(Cf:FindFirstChild("GameConfig")) local SC=Cf and rq(Cf:FindFirstChild("StandsConfig")) local FC=Cf and rq(Cf:FindFirstChild("FoodsConfig"))
 local S={ATr=false,ATp=true,FT=true,TS=3,AS=true,ATh=false,TM="Visual",Pf=true,SC=true,ST=false,TD=.35,AP=false,AF=false,AO=true,AG=true,AB=false,AE=false,Sp=false,SV=35,SM="CFrame",J=false,JV=65,IJ=false,NC=false,AFK=true,Snd=true,Op=false,SP=true,NS=1}
 local tl,os1,spm=false,false,false

 local function scanGameChanges()
  local errs = {}
  local remotesNeeded = {"Throw_Start", "Throw_Resolve", "Throw_Complete", "Throw_Cancel", "Throw_UseSuper", "Throw_UseSandwich", "Offline_Claim", "Gift_Request", "Shop_ClaimFree", "Plot_EquipBest", "Plot_UpgradeFence", "Plot_SellAll", "Stand_Upgrade", "Training_Start"}
  for _, r in ipairs(remotesNeeded) do
   if not rem(r) then table.insert(errs, "Missing Remote: " .. r) end
  end
  if not TC then table.insert(errs, "Missing Controller: ThrowController") end
  if not TM then table.insert(errs, "Missing Controller: ThrowMeter") end
  if not DC then table.insert(errs, "Missing Controller: DataController") end
  if not GC then table.insert(errs, "Missing Config: GameConfig") end
  if not SC then table.insert(errs, "Missing Config: StandsConfig") end
  if #errs > 0 then
   warn("=====================================")
   warn("[VENOM SCANNER] GAME UPDATE DETECTED! THE FOLLOWING THINGS CHANGED:")
   for _, e in ipairs(errs) do warn("[VENOM SCANNER] -> " .. e) end
   warn("[VENOM SCANNER] THE SCRIPT MIGHT NOT WORK CORRECTLY UNTIL FIXED.")
   warn("=====================================")
  end
 end

 task.spawn(function() task.wait(3) scanGameChanges() end)
 task.spawn(function() while A do task.wait(10) scanGameChanges() end end)

 if not _G.__TMN and TM and type(TM.new)=="function" then _G.__TMN=TM.new end
 if not _G.__TMR and TM and type(TM.Run)=="function" then _G.__TMR=TM.Run end
 if TM and _G.__TMN then 
     TM.new=function(...) local i=_G.__TMN(...) if i and type(i.Run)=="function" then local r=i.Run i.Run=function(s,...) if not A then return r(s,...) end if S.ATh or os1 or spm then if S.Pf then task.wait(.28) local ratings=GC and GC.Throw and GC.Throw.MeterRatings local maxR=(ratings and ratings[#ratings]) or {Text="PERFECT!",Color=Color3.fromRGB(0,255,136)} local bonus=(GC and GC.Throw and GC.Throw.MeterBonusStuds) or 20 return 1, maxR, bonus end task.wait(.25) return .85,nil,10 end return r(s,...) end end return i end 
 end
 if TM and _G.__TMR then 
     TM.Run=function(s,...) if not A then return _G.__TMR(s,...) end if S.ATh or os1 or spm then if S.Pf then task.wait(.28) local ratings=GC and GC.Throw and GC.Throw.MeterRatings local maxR=(ratings and ratings[#ratings]) or {Text="PERFECT!",Color=Color3.fromRGB(0,255,136)} local bonus=(GC and GC.Throw and GC.Throw.MeterBonusStuds) or 20 return 1, maxR, bonus end task.wait(.25) return .85,nil,10 end return _G.__TMR(s,...) end 
 end
 if not _G.__RSP and RSq and type(RSq.Play)=="function" then _G.__RSP=RSq.Play end
 if RSq and _G.__RSP then RSq.Play=function(p,...) if not A then return _G.__RSP(p,...) end if (S.ATh or os1 or spm) and S.SC then task.wait(.12) return end return _G.__RSP(p,...) end end

 local function fb(b) if not A or not b or not b:IsA("GuiButton") then return end pcall(function() if firesignal then firesignal(b.Activated) firesignal(b.MouseButton1Click) end end) pcall(function() if getconnections then for _,sg in ipairs({b.Activated,b.MouseButton1Click}) do local o,cs=pcall(getconnections,sg) if o and cs then for _,c in ipairs(cs) do if type(c.Fire)=="function" then c:Fire() elseif type(c.Function)=="function" then c.Function() end end end end end end) end
 local function ct(b) if not A or not S.ATp then return end if b and b:IsA("ImageButton") and b.Parent and b.Parent.Name=="TapBonusLayer" then task.defer(function() if b.Parent then for k=1,3 do fb(b) task.wait(.02) end end end) end end
 on(LP.PlayerGui.DescendantAdded,function(d) if not A then return end if d:IsA("ImageButton") and d.Parent and d.Parent.Name=="TapBonusLayer" then ct(d) end end)
 on(RS.Heartbeat,function() if not A then return end if S.ATp then local ts=LP.PlayerGui:FindFirstChild("TrainingSequence") local ly=ts and ts:FindFirstChild("TapBonusLayer") if ly then for _,b in ipairs(ly:GetChildren()) do if b:IsA("ImageButton") and b.Active and b.Parent then ct(b) end end end end if S.ATr and S.FT then local h=gh() if h then for _,t in ipairs(h:GetPlayingAnimationTracks()) do local n=t.Name:lower() if n:find("train") or n:find("pull") or n:find("bar") or n:find("workout") or (t.Length>0 and t.Speed==1) then if t.Speed~=S.TS and t.Speed>0 then t:AdjustSpeed(S.TS) end end end end end end)
 
 local function mp() local i=LP:GetAttribute("PlotIndex") or (DC and DC:Get("PlotIndex")) or 1 local pl=Ws:FindFirstChild("Plots") return pl and pl:FindFirstChild(tostring(i)) end
 local function tsp() local lp=Ws:FindFirstChild("LocalPlotProps") if lp and lp:FindFirstChild("TrainingArea") and lp.TrainingArea:FindFirstChild("TrainingSpot") then local s=lp.TrainingArea.TrainingSpot if s:IsA("BasePart") then return s end end end
 local function cl() local a=Ws:FindFirstChild("StarterArea") return a and a:FindFirstChild("CrossLine") end
 local function tp(cf) if not A then return end local h=grp() if h then h.CFrame=typeof(cf)=="CFrame" and cf or CFrame.new(cf) end end
 local function pl() if not A then return false end local h=grp() if not h then return false end local c=cl() if c then if h.Position.Z>c.Position.Z-4 then h.CFrame=CFrame.new(c.Position.X,c.Position.Y+2,c.Position.Z-8) end else h.CFrame=CFrame.new(0,3.5,-42) end return true end
 local function bl() local h=grp() if not h then return end local c=cl() if c then h.CFrame=CFrame.new(c.Position.X,c.Position.Y+2,c.Position.Z+20) else h.CFrame=CFrame.new(0,3.5,-15) end end
 local function mn() 
  local ls=LP:FindFirstChild("leaderstats")
  local m=ls and ls:FindFirstChild("Money")
  if m then 
   local success, n = pcall(function()
    local s = tostring(m.Value):gsub("[^%d.]", "")
    return tonumber(s)
   end)
   if success and n then return n end
  end 
  if DC and DC:IsReady() then return tonumber(DC:Get("Money")) or 0 end 
  return 0 
 end
 local function nsp() if not SC or not SC.Get or not DC then return end local c=tonumber(DC:Get("Stand")) or 1 local n=(SC.Count and SC.Count()) or 58 if c>=n then return end local x=SC.Get(c+1) if not x then return end return tonumber(x.Price) end
 local function si() local c=(DC and tonumber(DC:Get("Stand"))) or 1 local d=SC and SC.Get and SC.Get(c) local n=SC and SC.Get and SC.Get(c+1) return c,(d and d.Name) or("Stand #"..c),(d and d.XpPerRep) or 5,nsp(),n and n.XpPerRep end
 local lt,ce,ch=0,1.15,0
 local function rt() if CS then CS.Busy=nil end pcall(function() iv("Throw_Cancel") end) task.wait(.05) pcall(function() iv("Throw_Cancel") end) end
 local function wcd() local r=ce-(os.clock()-lt) if r>.05 then task.wait(r+.02) end end
 local function vt() if not A then return false end local h=grp() if not h or not S.ATh then return false end pl() task.wait(.08) if not S.ATh or not A then return false end if S.ST then pcall(function() iv("Throw_UseSuper") end) end if TC then local f=TC.Start or TC.start if type(f)=="function" then pcall(function() f(TC) end) end else iv("Throw_Start") iv("Throw_Resolve",1) task.wait(.3) iv("Throw_Complete") end local t=math.max(S.TD or .35,.2)+.7 local s=os.clock() while A and S.ATh and os.clock()-s<t do task.wait(.04) end lt=os.clock() return true end
 local function it() if not A then return false,false end local h=grp() if not h or not S.ATh then return false,false end pl() wcd() if not S.ATh or not A then return false,false end if CS then CS.Busy="Throw" end local w=h.Anchored h.Anchored=true if S.ST then pcall(function() iv("Throw_UseSuper") end) end local s=iv("Throw_Start") local cd,dn=false,false if type(s)=="table" and s.Ok then local r=iv("Throw_Resolve",1) if type(r)=="table" and r.Ok then local ww=math.max(S.TD or .35,.15) local t0=os.clock() while A and S.ATh and os.clock()-t0<ww do task.wait(.02) end if not S.ATh or not A then pcall(function() iv("Throw_Cancel") end) if CS then CS.Busy=nil end h.Anchored=w return false,false end iv("Throw_Complete") lt=os.clock() ch=0 dn=true else pcall(function() iv("Throw_Cancel") end) end else if type(s)=="table" and s.Reason=="Cooldown" then cd=true ch+=1 if ch>=2 then ce=math.min(ce+.25,2.5) ch=0 end else pcall(function() iv("Throw_Cancel") end) end end h.Anchored=w if CS then CS.Busy=nil end return dn,cd end
 local function st() S.ATh=false tl,os1,spm=false,false,false rt() if TC then pcall(function() if type(TC.Stop)=="function" then TC.Stop(TC) end end) end local h=grp() if h then h.Anchored=false end pcall(bl) end
 local function sT() if not A or tl then return end tl=true task.spawn(function() pl() while A and S.ATh and tl do if S.TM=="Instant" then local o,c=it() if c then task.wait(.4) elseif not o then task.wait(.25) end else vt() end task.wait(.05) end tl=false end) end
 local function oT() if not A or os1 or spm then return end os1=true task.spawn(function() local p=S.ATh S.ATh=true pl() if S.TM=="Instant" then it() else vt() end S.ATh=p os1=false pcall(bl) end) end
 local function spT(n) if not A or spm or os1 then return end spm=true task.spawn(function() local p=S.ATh S.ATh=true pl() for k=1,n do if not spm or not A then break end if S.TM=="Instant" then it() else vt() end task.wait(.08) end S.ATh=p spm=false pcall(bl) end) end
 
 pcall(function()
  local success = pcall(function() hookfunction(LP.Kick, function() end) end)
  if not success then
   local old
   old = hookmetamethod and hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" and self == LP then return end
    return old(self, ...)
   end)
  end
 end)
 
 task.spawn(function() while A do task.wait(.03) if S.Sp then local h,hm=grp(),gh() if h and hm and hm.MoveDirection.Magnitude>0 then if S.SM=="CFrame" or S.SM=="Both" then h.CFrame=h.CFrame+hm.MoveDirection*(S.SV/60) end if S.SM=="WalkSpeed" or S.SM=="Both" then hm.WalkSpeed=S.SV end end end if S.NC then local c=LP.Character if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end end end)
 U.JumpRequest:Connect(function() if not A or not S.IJ then return end local h=gh() if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end)
 if S.AFK then on(LP.Idled,function() if not A then return end pcall(function() V:CaptureController() V:ClickButton2(Vector2.new()) end) end) end
 task.spawn(function() while A do task.wait(2) if not A then break end if S.AO then pcall(function() iv("Offline_Claim") end) end if S.AG then pcall(function() iv("Shop_ClaimFree") end) pcall(function() iv("Gift_Request") end) end if S.AP then pcall(function() iv("Plot_EquipBest") end) end if S.AF then pcall(function() iv("Plot_UpgradeFence") end) end if S.AB then pcall(function() iv("Shop_BuyBest") end) end if S.AE then pcall(function() iv("Shop_EquipBest") end) end if S.AS then local p=nsp() if p and mn()>=p then pcall(function() iv("Stand_Upgrade") end) end end end end)
 
 task.spawn(function() 
     while A do 
         task.wait(.8) 
         if not A then break end 
         if S.ATr then 
             local h = grp()
             local spot = tsp()
             if h and spot and (h.Position - spot.Position).Magnitude > 15 then
                 tp(spot.CFrame + Vector3.new(0, 3, 0))
             end
             if TrC and type(TrC.IsRunning)=="function" then 
                 if not TrC.IsRunning() then pcall(function() if type(TrC.Start)=="function" then TrC.Start(TrC) end end) end 
             else pcall(function() iv("Training_Start") end) end 
         end 
     end 
 end)

 local gH=gethui or function() return C end
 local rq2=(syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
 local function hp(u) local o,r=pcall(game.HttpGet,game,u) if o and r~="" then return r end if rq2 then local x=rq2({Url=u,Method="GET"}) if x and x.Body then return x.Body end end return "" end
 local DISC,BGID,LOGO="https://discord.gg/X7Y4NzuC67","72427773287138","82585983764987"
 local gd,vs={},false
 RS.RenderStepped:Connect(function(d) if not A then return end for i=#gd,1,-1 do local e=gd[i] if e.g and e.g.Parent then e.g.Rotation=(e.g.Rotation+e.s*d)%360 else table.remove(gd,i) end end end)
 local function fg() local p={} pcall(function() table.insert(p,gH()) end) pcall(function() table.insert(p,C) end) local pg2=LP:FindFirstChild("PlayerGui") if pg2 then table.insert(p,pg2) end for _,po in ipairs(p) do for _,g in ipairs(po:GetChildren()) do if g:IsA("ScreenGui") and (g.Name:find("WindUI") or g.Name:find("VENOMHUB") or g.Name:find("POTENTHUB") or g.Name:find("Footagesus")) then return g end end end end
 local function fbg(g) for _,d in ipairs(g:GetDescendants()) do if d:IsA("ImageLabel") and tostring(d.Image):find(BGID) then return d end end end
 local function rs(r) if not r then return end for _,d in ipairs(r:GetDescendants()) do if d:IsA("UIStroke") then local p=d.Parent if p and not p.Name:find("Open") and not p.Name:find("Float") then pcall(d.Destroy,d) end end end end
 local function ap() if vs or not A then return end local g=fg() if not g then return end local bg=fbg(g) if not bg then return end vs=true bg.ImageColor3=Color3.fromRGB(80,100,90) bg.ImageTransparency=.35 bg.ZIndex=0 local o=bg:FindFirstChild("VenomDarkOverlay") if o then o:Destroy() end local ov=Instance.new("Frame") ov.Name="VenomDarkOverlay" ov.Size=UDim2.new(1,0,1,0) ov.BackgroundColor3=Color3.new() ov.BackgroundTransparency=1 ov.BorderSizePixel=0 ov.ZIndex=0 ov.Parent=bg Instance.new("UICorner",ov).CornerRadius=UDim.new(0,12) local gr=Instance.new("UIGradient",ov) gr.Color=ColorSequence.new(Color3.new()) gr.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,.35),NumberSequenceKeypoint.new(1,.05)} gr.Rotation=90 T:Create(ov,TweenInfo.new(.6),{BackgroundTransparency=.25}):Play() local c=bg.Parent or bg for _,d in ipairs(c:GetDescendants()) do if d~=ov and d:IsA("GuiObject") and d.ZIndex<2 then pcall(function() d.ZIndex=2 end) end end c.DescendantAdded:Connect(function(d) if d:IsA("GuiObject") and d~=ov and not d:IsDescendantOf(ov) then task.defer(function() if d.Parent and d.ZIndex<2 then pcall(function() d.ZIndex=2 end) end end) end end) task.defer(rs,c) end
 local function gl() local c=hp("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua") if c=="" then c=hp("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua") end local W=loadstring(c)() pcall(function() W:AddTheme({Name="VENOM HUB",Background=W:Gradient({["0"]={Color=Color3.fromHex("#0A0A0C"),Transparency=.12},["100"]={Color=Color3.fromHex("#0A0A0C"),Transparency=.12}},{Rotation=90}),Accent=W:Gradient({["0"]={Color=Color3.fromHex("#0D3B2E"),Transparency=0},["100"]={Color=Color3.fromHex("#00FF88"),Transparency=0}},{Rotation=90}),Dialog=Color3.fromHex("#0A0A0C"),Outline=Color3.fromHex("#ffffff"),Text=Color3.fromHex("#ffffff"),Placeholder=Color3.fromHex("#a1a1aa"),Button=Color3.fromHex("#0D3B2E"),Icon=Color3.fromHex("#00FF88"),Toggle=Color3.fromHex("#00FF88"),Slider=Color3.fromHex("#00FF88"),Checkbox=Color3.fromHex("#00FF88"),SliderIcon=Color3.fromHex("#71717a"),Primary=Color3.fromHex("#00FF88"),PanelBackground=Color3.fromHex("#ffffff"),PanelBackgroundTransparency=.94,LabelBackground=Color3.fromHex("#000000"),LabelBackgroundTransparency=.8,ElementBackground=Color3.fromHex("#121214"),ElementBackgroundTransparency=.3}) W:SetTheme("VENOM HUB") end) return W end
 local W=gl() local gN="Throw Food For Animals" pcall(function() gN=game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)
 local Win=W:CreateWindow({Title="VENOM HUB",Icon="rbxassetid://"..LOGO,Author=gN,Folder="VENOMHUB_THROWFOOD",Background="",Size=UDim2.fromOffset(500,400),MaxSize=Vector2.new(850,560),MinSize=Vector2.new(320,300),Resizable=true,Transparent=true,Theme="VENOM HUB",BackgroundImageTransparency=.35,Acrylic=false,ShadowTransparency=.3,Radius=18,IconRadius=1,IconSize=27,SideBarWidth=185,Topbar={Height=56,ButtonsType="Default"},User={Enabled=true,Anonymous=false},OpenButton={Title="VENOM HUB",Icon="rbxassetid://"..LOGO,CornerRadius=UDim.new(0,16),StrokeThickness=1,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,255,136)),ColorSequenceKeypoint.new(1,Color3.fromRGB(184,255,74))},OnlyMobile=false,Enabled=true,Draggable=true}})
 
 do
  local tg=fg()
  if tg then
   local tt
   for _,d in ipairs(tg:GetDescendants()) do
    if d:IsA("TextLabel") and d.Text=="VENOM HUB" then tt=d break end
   end
   if tt then
    tt.RichText=true
    tt.Text="VENOM HUB <font color='#00FF88' size='14'>"..VERSION.."</font>"
    local glow=Instance.new("UIStroke")
    glow.Color=Color3.fromRGB(0,255,136)
    glow.Thickness=1
    glow.Transparency=.5
    glow.ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual
    glow.Parent=tt
    task.spawn(function()
     while A and tt.Parent do
      task.wait(.05)
      local p=(math.sin(os.clock()*2.5)+1)/2
      glow.Transparency=.2+.55*p
      glow.Thickness=.8+1.2*p
     end
    end)
   end
  end
 end
 
 local function ntf(t,c,ok) if not A then return end if S.Snd then ps(SFX.N,.4,ok==false and .9 or 1.05) end W:Notify({Title=t,Content=c,Duration=2.5}) end
 local function ts2(v) if S.Snd then ps(SFX.C,.35,v and 1.1 or .9) end end
 local function cs2() if S.Snd then ps(SFX.C,.3,1) end end
 
 local Hm=Win:Tab({Title="Home",Icon="home"})
 local HS=Hm:Section({Title="Actions"})
 
 HS:Button({Title="Rejoin",Callback=function() cs2() pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId,LP) end) end})
 HS:Button({Title="Server Hop",Callback=function()
  cs2()
  pcall(function()
   local r=hp("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")
   local jobs=game:GetService("HttpService"):JSONDecode(r).data
   for _,j in ipairs(jobs) do if j.playing < j.maxPlayers and j.id ~= game.JobId then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,j.id,LP) return end end
  end)
 end})
 HS:Button({Title="Copy Job ID",Callback=function() cs2() pcall(function() setclipboard(game.JobId) end) ntf("Copied","Job ID: "..game.JobId,true) end})
 HS:Button({Title="Unload Hub",Callback=function() cs2() if _G.__VC then _G.__VC() end end})
 
 local HS1=Hm:Section({Title="Session"})
 local p1=HS1:Paragraph({Title="Live Stats",Desc="Loading..."})
 task.spawn(function()
  local start=os.time()
  while A do
   task.wait(1)
   pcall(function()
    local ls=LP:FindFirstChild("leaderstats")
    local m=ls and ls:FindFirstChild("Money") and ls.Money.Value or "$0"
    local lv=DC and DC:Get("Level") or 1
    local xp=DC and DC:Get("Xp") or 0
    local c,nm,cx,np,nx=si()
    local elapsed=os.time()-start
    local min=math.floor(elapsed/60) local sec=elapsed%60
    local timeStr=string.format("%02d:%02d",min,sec)
    local tStatus = S.ATh and "ON" or "OFF"
    p1:SetDesc(string.format("Money: %s\nLevel: %d (XP: %d)\nStand: %s (#%d)\nTime: %s\nAuto Throw: %s",tostring(m),tonumber(lv),tonumber(xp),tostring(nm),tonumber(c),timeStr,tStatus))
   end)
  end
 end)
 
 local HS2=Hm:Section({Title="Account"})
 local p2=HS2:Paragraph({Title="Profile",Desc="Loading..."})
 task.spawn(function()
  local thumb=""
  pcall(function()
   local api="https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..LP.UserId.."&size=150x150&format=Png&isCircular=false"
   local r=hp(api)
   local data=game:GetService("HttpService"):JSONDecode(r).data[1]
   thumb=data.imageUrl
  end)
  pcall(function()
   p2:SetDesc("Welcome back\n"..LP.DisplayName.." (@"..LP.Name..")\n\nPlaying: "..gN.."\nPlace ID: "..game.PlaceId.."\nJob ID: "..string.sub(game.JobId,1,8).."...")
  end)
 end)
 
 local HS3=Hm:Section({Title="Update"})
 
 HS3:Paragraph({
  Title="v1.3.2 | Key Duration Fix",
  Desc="• Fixed a bug where the key would ask again before 24h.\n• Key now saves correctly to your executor disk."
 })
 HS3:Paragraph({
  Title="v1.3.1 | Clean & Fast",
  Desc="• Fixed the key system.\n• Removed events tab.\n• Cleaner update log."
 })
 HS3:Paragraph({
  Title="v1.3.0 | Security Update",
  Desc="• Encrypted key strings.\n• Protected against decompilers.\n• Hidden Discord links."
 })
 HS3:Paragraph({
  Title="v1.2.0 | Performance",
  Desc="• Added Thanksgiving & Sandwich farm.\n• Auto Join & Catch minigame."
 })
 HS3:Paragraph({
  Title="v1.1.9 | Full Game Map",
  Desc="• Fixed every remote using the Dex scan.\n• Added new Shop_ClaimFree support."
 })
 HS3:Paragraph({
  Title="v1.1.0 | Home Tab",
  Desc="• Added new Home section.\n• Quick actions: Rejoin, Server Hop, Copy Job ID & Unload."
 })
 
 local Mn=Win:Tab({Title="Main",Icon="house"})
 local Stt=Mn:Paragraph({Title="Live Stats",Desc="Loading..."})
 task.spawn(function() while A do task.wait(1.5) if not A then break end pcall(function() local ls=LP:FindFirstChild("leaderstats") local m=ls and ls:FindFirstChild("Money") and ls.Money.Value or "$0" local rt=ls and ls:FindFirstChild("Money/s") and ls["Money/s"].Value or "$0/s" local lv=DC and DC:Get("Level") or 1 local xp=DC and DC:Get("Xp") or 0 local c,nm,cx,np,nx=si() local nextT=np and string.format("Next: +%s XP ($%s)",tostring(nx or "?"),tostring(np)) or "MAX TIER" Stt:SetDesc(string.format("Money: %s | Income: %s\nLevel %d (XP %d)\nStand: %s (#%d)\n+%s XP/rep | %s",tostring(m),tostring(rt),tonumber(lv),tonumber(xp),tostring(nm),tonumber(c),tostring(cx),nextT)) end) end end)
 Mn:Section({Title="Training"})
 Mn:Toggle({Title="Auto Training (Distance)",Value=S.ATr,Callback=function(v) if not A then return end ts2(v) S.ATr=v if v and S.ATh then st() end end})
 Mn:Toggle({Title="Auto Tap Bonus",Value=S.ATp,Callback=function(v) if not A then return end ts2(v) S.ATp=v end})
 Mn:Toggle({Title="Fast Animations",Value=S.FT,Callback=function(v) if not A then return end ts2(v) S.FT=v end})
 Mn:Toggle({Title="Auto Upgrade Stand",Value=S.AS,Callback=function(v) if not A then return end ts2(v) S.AS=v end})
 Mn:Button({Title="Upgrade Stand Now",Callback=function() if not A then return end cs2() local r=iv("Stand_Upgrade") ntf("Stand",((type(r)=="table" and r.Ok) or r==true) and"Upgraded!"or"Not enough money",true) end})
 Mn:Button({Title="TP Training Spot",Callback=function() if not A then return end cs2() local s=tsp() if s then tp(s.CFrame+Vector3.new(0,3,0)) ntf("TP","Training spot",true) else ntf("TP","Spot not found",false) end end})

 local Th=Win:Tab({Title="Throw",Icon="target"})
 Th:Section({Title="Auto Throw"})
 Th:Toggle({Title="Enable Auto Throw",Value=S.ATh,Callback=function(v) if not A then return end ts2(v) S.ATh=v if v then if S.ATr then S.ATr=false if TrC and TrC.IsRunning and TrC.IsRunning() then pcall(function() TrC.Stop() end) end end sT() else st() end end})
 Th:Dropdown({Title="Mode",Values={"Visual","Instant"},Value=S.TM,Callback=function(v) if A then cs2() S.TM=v end end})
 Th:Toggle({Title="Always Perfect",Value=S.Pf,Callback=function(v) if not A then return end ts2(v) S.Pf=v end})
 Th:Toggle({Title="Skip Cutscene",Value=S.SC,Callback=function(v) if not A then return end ts2(v) S.SC=v end})
 Th:Toggle({Title="Use Super Throw",Value=S.ST,Callback=function(v) if not A then return end ts2(v) S.ST=v end})
 Th:Slider({Title="Throw Delay",Step=.05,Value={Min=.15,Max=1.5,Default=S.TD},Callback=function(v) if A then S.TD=v end end})
 Th:Section({Title="Manual"})
 Th:Button({Title="Throw Once",Callback=function() if A then cs2() oT() end end})
 Th:Button({Title="Spam x5",Callback=function() if A then cs2() spT(5) end end})
 Th:Button({Title="Spam x10",Callback=function() if A then cs2() spT(10) end end})
 Th:Button({Title="TP Throw Line",Callback=function() if A then cs2() pl() ntf("TP","Throw line",true) end end})
 Th:Button({Title="Emergency Stop",Callback=function() if A then cs2() st() ntf("Stop","Stopped",true) end end})

 local Pl=Win:Tab({Title="Plot",Icon="paw-print"})
 Pl:Section({Title="Automation"})
 Pl:Toggle({Title="Auto Best Pets",Value=S.AP,Callback=function(v) if not A then return end ts2(v) S.AP=v end})
 Pl:Toggle({Title="Auto Fence Upgrade",Value=S.AF,Callback=function(v) if not A then return end ts2(v) S.AF=v end})
 Pl:Section({Title="Actions"})
 Pl:Button({Title="Equip Best Pets",Callback=function() if not A then return end cs2() local r=iv("Plot_EquipBest") ntf("Pets",((type(r)=="table" and r.Ok) or r) and"Equipped"or"Failed",true) end})
 Pl:Button({Title="Upgrade Fence",Callback=function() if not A then return end cs2() local r=iv("Plot_UpgradeFence") ntf("Fence",((type(r)=="table" and r.Ok) or r==true) and"Upgraded"or"Failed",true) end})
 Pl:Button({Title="Sell All Pets",Callback=function() if not A then return end cs2() local r=iv("Plot_SellAll") ntf("Sell",((type(r)=="table" and r.Ok) or r) and"Sold"or"Failed",true) end})

 local Sh2=Win:Tab({Title="Shop",Icon="shopping-cart"})
 Sh2:Section({Title="Automation"})
 Sh2:Toggle({Title="Auto Offline Claims",Value=S.AO,Callback=function(v) if not A then return end ts2(v) S.AO=v end})
 Sh2:Toggle({Title="Auto Free Gifts",Value=S.AG,Callback=function(v) if not A then return end ts2(v) S.AG=v end})
 Sh2:Toggle({Title="Auto Buy Best Food",Value=S.AB,Callback=function(v) if not A then return end ts2(v) S.AB=v end})
 Sh2:Toggle({Title="Auto Equip Best Food",Value=S.AE,Callback=function(v) if not A then return end ts2(v) S.AE=v end})
 Sh2:Section({Title="Manual Food"})
 local foo={} local li=FC and (FC.List or FC.All) or {} for i,f in ipairs(li) do foo[#foo+1]=string.format("#%d %s",i,f.Name or"Food") end
 local sf=1
 Sh2:Dropdown({Title="Food",Values=#foo>0 and foo or{"#1 Carrot"},Value=foo[1] or"#1 Carrot",Callback=function(v) if not A then return end cs2() local n=v:match("#(%d+)") if n then sf=tonumber(n) end end})
 Sh2:Button({Title="Buy Food",Callback=function() if not A then return end cs2() local r=iv("Shop_Buy",sf) ntf("Buy",((type(r)=="table" and r.Ok) or r==true) and"Bought"or"Failed",true) end})
 Sh2:Button({Title="Equip Food",Callback=function() if not A then return end cs2() local r=iv("Shop_Equip",sf) ntf("Equip",((type(r)=="table" and r.Ok) or r==true) and"Equipped"or"Failed",true) end})

 local TPt=Win:Tab({Title="Teleports",Icon="map-pin"})
 TPt:Section({Title="Locations"})
 TPt:Button({Title="Plot Entrance",Callback=function() if not A then return end cs2() local p=mp() if p then local o=(GC and GC.Plot and GC.Plot.EntranceOffset) or Vector3.new(0,3.5,-5) tp(p.Position+o) ntf("TP","Plot entrance",true) else ntf("TP","Plot not found",false) end end})
 TPt:Button({Title="Training Spot",Callback=function() if not A then return end cs2() local s=tsp() if s then tp(s.CFrame+Vector3.new(0,3,0)) ntf("TP","Training",true) else ntf("TP","Not loaded",false) end end})
 TPt:Button({Title="Throw Line",Callback=function() if A then cs2() pl() ntf("TP","Throw line",true) end end})
 TPt:Button({Title="Food Shop",Callback=function() if not A then return end cs2() local p=mp() tp(p and(p.Position+Vector3.new(10.5,3.5,-8.3))or CFrame.new(10.5,3.5,-8.3)) ntf("TP","Shop",true) end})
 TPt:Section({Title="Plots"})
 local sp=1
 TPt:Dropdown({Title="Plot #",Values={"1","2","3","4","5","6"},Value="1",Callback=function(v) if A then cs2() sp=tonumber(v) or 1 end end})
 TPt:Button({Title="Go to Plot",Callback=function() if not A then return end cs2() local pl2=Ws:FindFirstChild("Plots") local t=pl2 and pl2:FindFirstChild(tostring(sp)) if t then local po=t.Position or(t:IsA("Model") and t:GetPivot().Position) if po then tp(po+Vector3.new(0,4,-5)) ntf("TP","Plot "..sp,true) return end end ntf("TP","Plot not available",false) end})
 TPt:Section({Title="Biomes"})
 local bm={"Forest","Savana","Desert","Jungle","Ocean","Mountains","Taiga","Winter","Hell"} local sb=bm[1]
 TPt:Dropdown({Title="Biome",Values=bm,Value=bm[1],Callback=function(v) if A then cs2() sb=v end end})
 TPt:Button({Title="Go to Biome",Callback=function() if not A then return end cs2() local bf=Ws:FindFirstChild("Biomes") local b=bf and bf:FindFirstChild(sb) if b then local p=b:IsA("BasePart") and b or b:FindFirstChildWhichIsA("BasePart") if p then tp(p.CFrame+Vector3.new(0,6,0)) ntf("TP",sb,true) return end end ntf("TP","Biome not loaded",false) end})

 local Mi=Win:Tab({Title="Player",Icon="user"})
 Mi:Section({Title="Performance"})
 Mi:Toggle({Title="Show FPS / MS Overlay",Value=S.SP,Callback=function(v) if not A then return end ts2(v) S.SP=v pg.Enabled=v end})
 Mi:Toggle({Title="Optimize Game (Lower RAM)",Value=S.Op,Callback=function(v) if not A then return end ts2(v) S.Op=v ao(v) ntf("Optimize",v and"Optimized!"or"Normal",true) end})
 
 Mi:Slider({Title="FPS Limit",Step=10,Value={Min=60,Max=360,Default=60},Callback=function(v) if not A then return end S.SV=v pcall(function() setfpscap(v) end) end})
 
 Mi:Section({Title="Movement"})
 Mi:Toggle({Title="Speed",Value=S.Sp,Callback=function(v) if not A then return end ts2(v) S.Sp=v if not v then local h=gh() if h then h.WalkSpeed=16 end end end})
 Mi:Slider({Title="Speed Value",Step=1,Value={Min=16,Max=200,Default=S.SV},Callback=function(v) if not A then return end S.SV=v if S.Sp then local h=gh() if h and(S.SM=="WalkSpeed" or S.SM=="Both") then h.WalkSpeed=v end end end})
 Mi:Dropdown({Title="Speed Mode",Values={"CFrame","WalkSpeed","Both"},Value=S.SM,Callback=function(v) if A then cs2() S.SM=v end end})
 Mi:Toggle({Title="Custom Jump",Value=S.J,Callback=function(v) if not A then return end ts2(v) S.J=v local h=gh() if h then h.UseJumpPower=true h.JumpPower=v and S.JV or 50 if not v then h.JumpHeight=7.2 end end end})
 Mi:Slider({Title="Jump Power",Step=1,Value={Min=50,Max=250,Default=S.JV},Callback=function(v) if not A then return end S.JV=v if S.J then local h=gh() if h then h.UseJumpPower=true h.JumpPower=v pcall(function() local g=Ws.Gravity>0 and Ws.Gravity or 196.2 h.JumpHeight=(v*v)/(2*g) end) end end end})
 Mi:Toggle({Title="Infinite Jump",Value=S.IJ,Callback=function(v) if not A then return end ts2(v) S.IJ=v end})
 Mi:Toggle({Title="NoClip",Value=S.NC,Callback=function(v) if not A then return end ts2(v) S.NC=v end})
 Mi:Toggle({Title="Anti AFK",Value=S.AFK,Callback=function(v) if not A then return end ts2(v) S.AFK=v end})
 Mi:Toggle({Title="Anti-Kick (Client)",Value=false,Callback=function(v) end})
 
 Mi:Section({Title="System"})
 Mi:Toggle({Title="UI Sounds",Value=S.Snd,Callback=function(v) if not A then return end S.Snd=v if v then ps(SFX.C,.4,1.1) end end})
 Mi:Dropdown({Title="Notify Sound",Values={"Default","Pop","Ping"},Value="Default",Callback=function(v) if A then cs2() S.NS=v end end})
 Mi:Button({Title="Copy Discord",Callback=function() if not A then return end cs2() local ok=false local cb=setclipboard or toclipboard if type(cb)=="function" then ok=pcall(cb,DISC) end ntf("Discord",ok and"Copied!"or DISC,ok) end})
 Mi:Button({Title="Unload",Callback=function() if not A then return end cs2() if _G.__VC then _G.__VC() end end})

 _G.__VC=function()
  A=false S.ATh=false S.ATr=false S.ATp=false S.AS=false S.AP=false S.AF=false S.AO=false S.AG=false S.AB=false S.AE=false S.Sp=false S.J=false S.IJ=false S.NC=false S.Op=false tl,os1,spm=false,false,false st() ao(false)
  if TM and _G.__TMN then TM.new=_G.__TMN end if TM and _G.__TMR then TM.Run=_G.__TMR end if RSq and _G.__RSP then RSq.Play=_G.__RSP end
  for _,c in ipairs(Cn) do pcall(function() c:Disconnect() end) end Cn={}
  pcall(function() local h=gh() if h then h.WalkSpeed=16 h.JumpPower=50 h.JumpHeight=7.2 h.UseJumpPower=true end end)
  pcall(function() if pg then pg:Destroy() end end)
  pcall(function() local t=(gethui and gethui()) or C for _,c in ipairs(t:GetChildren()) do if c.Name:find("WindUI") or c.Name:find("VENOMHUB") or c.Name:find("VenomPerf") then pcall(c.Destroy, c) end end end)
  pcall(function() if Win then Win:Destroy() end end)
  _G.__VC=nil print("VENOM_STOPPED")
 end
 pg.Enabled=S.SP if S.Snd then ps(SFX.S,.5,1) end W:Notify({Title="VENOM HUB "..VERSION,Content="Ready",Duration=4}) print("VENOM_READY "..VERSION)
end

_G.__VenomGo=hub
if rd() and (os.time()-rd())<DUR then _G.__VenomGo() else gate() end
