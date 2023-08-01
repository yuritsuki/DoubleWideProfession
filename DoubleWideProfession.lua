TradeSkillFrame:SetAttribute("UIPanelLayout-width", 695) --orig 384

TradeSkillFrame:SetWidth(695)

--widen the skill level statusbar
TradeSkillRankFrame:ClearAllPoints()
TradeSkillRankFrame:SetPoint("TOPLEFT", 75, -38)
TradeSkillRankFrame:SetWidth(575)

--Widen the skill rank border
TradeSkillRankFrameBorder:SetTexture([[Interface\AddOns\DoubleWideProfession\Textures\BarBorder]])
TradeSkillRankFrameBorder:ClearAllPoints()
TradeSkillRankFrameBorder:SetPoint("LEFT", -4, 0)
TradeSkillRankFrameBorder:SetWidth(584); TradeSkillRankFrameBorder:SetHeight(17)

--Move the skill rank string
TradeSkillRankFrameSkillRank:ClearAllPoints()
TradeSkillRankFrameSkillRank:SetPoint("CENTER", TradeSkillRankFrame, 0, 1)

--Move the "Have Available" checkbox
TradeSkillFrameAvailableFilterCheckButton:ClearAllPoints()
TradeSkillFrameAvailableFilterCheckButton:SetPoint("TOPLEFT", 70, -50)


--Move the editbox and expand it
TradeSkillFrameEditBox:ClearAllPoints()
TradeSkillFrameEditBox:SetPoint("TOPLEFT", 77, -72)
TradeSkillFrameEditBox:SetWidth(185)

--Add a reset button to the editbox
local resbutton = CreateFrame("Button", "TradeSkillFrameEditBoxResetButton", TradeSkillFrameEditBox)
resbutton:SetWidth(38); resbutton:SetHeight(38)
resbutton:SetNormalTexture([[Interface\Buttons\CancelButton-Up]])
resbutton:SetPushedTexture([[Interface\Buttons\CancelButton-Down]])
resbutton:SetHighlightTexture([[Interface\Buttons\CancelButton-Highlight]], "ADD")
resbutton:SetScript("OnClick", function(self)
	if TradeSkillFrameEditBox:HasFocus() then
		TradeSkillFrameEditBox:SetText("")
	else
		TradeSkillFrameEditBox:SetText(SEARCH)
	end
end)
resbutton:SetPoint("LEFT", TradeSkillFrameEditBox, "RIGHT", -5, -2)

TRADE_SKILLS_DISPLAYED = 19

CreateFrame("Button", "TradeSkillSkill9", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill8, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill10", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill9, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill11", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill10, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill12", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill11, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill13", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill12, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill14", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill13, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill15", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill14, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill16", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill15, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill17", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill16, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill18", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill17, "BOTTOMLEFT")
CreateFrame("Button", "TradeSkillSkill19", TradeSkillFrame, "TradeSkillSkillButtonTemplate"):SetPoint("TOPLEFT", TradeSkillSkill18, "BOTTOMLEFT")

--Tradeskill skills list
TradeSkillSkill1:ClearAllPoints()
TradeSkillSkill1:SetPoint("TOPLEFT", 22, -100)
TradeSkillListScrollFrame:ClearAllPoints()
TradeSkillListScrollFrame:SetPoint("TOPLEFT", 22, -96)
TradeSkillListScrollFrame:SetHeight(310)


--The stuff which shows reagents and what produced
TradeSkillDetailScrollFrame:ClearAllPoints();
TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", TradeSkillListScrollFrame, "TOPRIGHT", 35, -2)
TradeSkillDetailScrollFrame:SetWidth(298)
TradeSkillDetailScrollFrame:SetHeight(310)

--Move the exit button to bottom left
TradeSkillCancelButton:ClearAllPoints()
TradeSkillCancelButton:SetPoint("CENTER", TradeSkillFrame, "TOPLEFT", 613, -422)

--Texture mucking about now
for i, region in ipairs({TradeSkillFrame:GetRegions()}) do
	if region:IsObjectType("Texture") then
		if region:GetTexture() == [[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]] then
			region:Hide()
		end
	end
end

--Add the mid section by messing with glue and newspaper clippings
local function CreateTex(parent, tex, layer, width, height, ...)
	local texf = parent:CreateTexture(nil, layer)
	texf:SetPoint(...)
	texf:SetTexture(tex)
	texf:SetWidth(width); texf:SetHeight(height)
	return texf
end


--Scrollbar fix
CreateTex(TradeSkillListScrollFrame, [[Interface\ClassTrainerFrame\UI-ClassTrainer-ScrollBar]], "BACKGROUND", 30, 97.4, "LEFT", TradeSkillListScrollFrame, "RIGHT", -3, 0):SetTexCoord(0, 0.46875, 0.2, 0.9609375)

--for these textures we need to fill 311 pixels
--Top filling in
CreateTex(TradeSkillFrame, [[Interface\AddOns\DoubleWideProfession\Textures\Top]], "BORDER", 311, 256, "TOPLEFT", 256, 0)

--bottom filling in
local bot = CreateTex(TradeSkillFrame, [[Interface\AddOns\DoubleWidProfession\Textures\Bot]], "BORDER", 311, 256, "BOTTOMLEFT", TradeSkillFrameBottomLeftTexture, "BOTTOMRIGHT")

local orig = TradeSkillFrame_SetSelection
local function SetSelectionHelper(...)
	if IsTradeSkillLinked() then
		bot:SetTexture([[Interface\AddOns\DoubleWideProfession\Textures\InspectBot]])
	else
		bot:SetTexture([[Interface\AddOns\DoubleWideProfession\Textures\Bot]])
		TradeSkillFrameBottomRightTexture:SetTexture([[Interface\PaperDollInfoFrame\SkillFrame-BotRight]])
	end
	return ...
end

function TradeSkillFrame_SetSelection(...)
	return SetSelectionHelper(orig(...))
end
	