local E, L, V, P, G, _ = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("BindPad")) then return; end

function addon:BindPad()
	local S = E:GetModule("Skins");

	BindPadFrame:StripTextures(true);
	BindPadFrame:CreateBackdrop("Transparent");
	BindPadFrame.backdrop:Point("TOPLEFT", 10, -11);
	BindPadFrame.backdrop:Point("BOTTOMRIGHT", -31, 71);

	for i = 1, 42 do
		local slot = _G["BindPadSlot" .. i];
		local slotIcon = _G["BindPadSlot" .. i .. "Icon"];
		local slotAddButton = _G["BindPadSlot" .. i .. "AddButton"];

		slot:SetNormalTexture(nil);
		slot:SetTemplate("Defaylt", true);
		slot:StyleButton(nil, nil, true);

		slotIcon:SetInside();
		slotIcon:SetTexCoord(unpack(E.TexCoords));
		slotIcon:SetDrawLayer("ARTWORK");

		_G["BindPadSlot" .. i .. "Border"]:SetTexture(1, 1, 0, 0.3);
		_G["BindPadSlot" .. i .. "Border"]:SetInside();

		slotAddButton:SetNormalTexture(nil);
		slotAddButton:SetPushedTexture(nil);
		slotAddButton:SetDisabledTexture(nil);
		slotAddButton:SetHighlightTexture(nil);

		slotAddButton.Text = slotAddButton:CreateFontString(nil, "OVERLAY");
		slotAddButton.Text:FontTemplate(nil, 22);
		slotAddButton.Text:Point("CENTER", 0, 0);
		slotAddButton.Text:SetText("+");
	end
	
	for i = 1, 4 do
		local tab = _G["BindPadFrameTab" .. i];
		S:HandleTab(tab);
		tab.backdrop:Point("TOPLEFT", 3, -8);
		tab.backdrop:Point("BOTTOMRIGHT", -3, -1);
	end
	
	for i = 1, 5 do
		local tab = _G["BindPadProfileTab" .. i];
		local tabSubIcon = _G["BindPadProfileTab" .. i .. "SubIcon"];
		tab:StripTextures();
		tab:SetTemplate("Defaylt", true);
		tab:StyleButton(nil, true);
		
		tab:GetNormalTexture():SetInside();
		tab:GetNormalTexture():SetTexCoord(unpack(E.TexCoords));
		tab:GetNormalTexture():SetDrawLayer("ARTWORK");
		
		tabSubIcon:SetTexCoord(unpack(E.TexCoords));
	end

	S:HandleCloseButton(BindPadFrameCloseButton);

	S:HandleCheckBox(BindPadFrameCharacterButton);
	S:HandleCheckBox(BindPadFrameShowHotkeysButton);
	S:HandleCheckBox(BindPadFrameTriggerOnKeydownButton);

	S:HandleButton(BindPadFrameExitButton);
end

addon:RegisterSkin("BindPad", addon.BindPad);