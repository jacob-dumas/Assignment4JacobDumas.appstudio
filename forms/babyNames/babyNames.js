let BabyNames = ["Olivia", "Emma", "Ava", "Sophia", "Isabella", "Charlotte", "Amelia", "Mia", "Harper", "Evelyn", "Abigail", "Emily", "Ella", "Elizabeth", "Camila", "Luna", "Sofia", "Avery", "Mila", "Aria"]
let FavBabyNames = []






babyNames.onshow = function() {
    for (i = 0; i < BabyNames.length; i++)
        selBaby.addItem(BabyNames[i])
}




btnBaby.onclick=function(){
  FavBabyNames.push(selBaby.text)
  ChangeForm(favBabyNames)
}
