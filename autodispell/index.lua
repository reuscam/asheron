require "bit32"

function useDispelGem()
    print("Attempting to find Empyrean Rune of Dispel")
    for equipObj in game.Character.Inventory do
       if (equipObj.name == "Empyrean Rune of Dispel") then
            print("Using Empyrean Rune of Dispel") 
            game.Actions.ObjectUse(equipObj.id)
       end
    end
end

function handleEnchantmentChanged(evt)
    --[autodispell] Enchantment Cat:  EnduranceRaising Effect:  0  Type: Added
    if evt.Type == AddRemoveEventType.Added then
        --isBeneficial = bit32.band(evt.Enchantment.Flags.toNumber(), EnchantmentFlags.Beneficial)
        local isBeneficial = (evt.Enchantment.Flags + EnchantmentFlags.Beneficial) == evt.Enchantment.Flags        
        if isBeneficial == false then
            print ("Detected a debuff i think: ", evt.Enchantment.Category)          
            print("Cat: ", evt.Enchantment.Category, " Type:", evt.Type, "Flags:", evt.Enchantment.Flags)
            useDispelGem()
        end
    end
end

game.Character.OnEnchantmentsChanged.Add(handleEnchantmentChanged)
--game.OnScriptEnd.Once(function()
--    game.Character.OnEnchantmentsChanged.Remove(handleEnchantmentChanged)
--  end)



