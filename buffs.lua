
local CreateFrame = CreateFrame
local CreateFontString = CreateFontString
local max = max

local hiddenBuffs = {
  ["Unholy Presence"] = true
}

local function postCreate(self, button, icons, index, debuff)
  -- icons.showDebuffType = true
  -- icons.disableCooldown = true
  
  button:SetBackdrop({
      bgFile = [[Interface\ChatFrame\ChatFrameBackground]], 
      insets = { top = -1, bottom = -1, left = -1, right = -1 }
    }
  )
  
  if index == -1 then
    button:SetBackdropColor(1,0,0)
  else
    button:SetBackdropColor(0,0,0)
  end
  
  button.icon:SetTexCoord(.06, .94, .06, .94)
  button.icon:SetDrawLayer('ARTWORK')
  button.overlay:SetTexture()
  
  -- button.time = button:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
  -- button.time:SetPoint('TOPLEFT', button)
end



local function aurasFilter(icons, unit, icon, name, rank, texture, count, dtype, duration, expiration, caster)
  if( not hiddenBuffs[name] ) then
    return true
  else
    return false
  end
end

local function style(self)
  local rows = 2
  local columns = 5
  
  self.Buffs = CreateFrame('Frame', nil, UIParent)
  self.Buffs:SetPoint('TOPLEFT', 5, -5)
  self.Buffs.initialAnchor = 'TOPLEFT'
  self.Buffs['growth-x'] = 'DOWN'
  self.Buffs['growth-y'] = 'RIGHT'
  self.Buffs.spacing = 4
  self.Buffs.size = 26
  self.Buffs:SetHeight(110)
  self.Buffs:SetWidth(400)
  
  self.PostCreateAuraIcon = postCreate
  -- self.PostUpdateAuraIcon = postUpdate
  self.CustomAuraFilter = aurasFilter
  
  BuffFrame:UnregisterAllEvents()
  BuffFrame:Hide()
end

oUF:RegisterStyle('SCBuffs', style)
oUF:SetActiveStyle('SCBuffs')

oUF:Spawn('player')