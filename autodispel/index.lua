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
    if evt.Type == AddRemoveEventType.Added then
        local isBeneficial = (evt.Enchantment.Flags + EnchantmentFlags.Beneficial) == evt.Enchantment.Flags        
        if isBeneficial == false then
            print ("Detected a debuff i think: ", evt.Enchantment.Category)          
            print("Cat: ", evt.Enchantment.Category, " Type:", evt.Type, "Flags:", evt.Enchantment.Flags)
            useDispelGem()
        end
    end
end

game.Character.OnEnchantmentsChanged.Add(handleEnchantmentChanged)



