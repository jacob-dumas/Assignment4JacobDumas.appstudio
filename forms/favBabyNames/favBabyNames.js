favBabyNames.onshow = function() {
    drpBaby.clear()
    console.log(FavBabyNames)
    for (i = 0; i < 5; i++)
        drpBaby.addItem(FavBabyNames[0][i])

    Image1.hidden = true
}

drpBaby.onclick = function(s) {
    if (typeof(s) == "object") {
        return
    } else {
        lblFavBabyNames.value = `Your favorite baby name was ${s}.`
        Image1.hidden = false
    }

}