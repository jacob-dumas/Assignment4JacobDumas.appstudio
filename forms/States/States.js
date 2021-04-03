// global variables for database calls
let req = ""
let query = ""
let results = ""
let pw = "Bailey10"  // ***** put your database password here
let netID = "jad64177"
let allCustomerData = []


// Takes states from array and populates dropdown

States.onshow=function(){
drpStates.clear()
 query = "SELECT * FROM customer"
    // Below change from my netID to yours (twice: user and database)    
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=jad64177&pass=" + pw + "&database=jad64177&query=" + query)

    if (req.status == 200) { //transit trip worked.        
           // see JSON results
           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)
        results = JSON.parse(req.responseText)
           // see if results are correct
           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)
        
        if (results.length == 0)    // no results were returned by the query
           lblMessage1.textContent = "There are no pets in the database."
        else {     
        // Now output the names of all the dogs into the textArea control:
        let message = ""
        for (i = 0; i < results.length; i++)
            drpStates.addItem(message + results[i][4] + "\n")
     } // end else

  } else   // the transit didn't work - bad wifi? server turned off?
        lblMessage1.textContent = "Error code: " + req.status
}


// Writes the code for showing the customer based on what was clicked.
drpStates.onclick=function(s){
  // this 'if' kicks user out if they  just clicked on control 
// but not on one item in the list.
    if (typeof(s) == "object")   
      return                    
    else {  // the user picked something
        drpStates.value = s // make dropdown show choice the user made
        let state = drpStates.value
        
query = "SELECT * from customer WHERE state =" + '"' + state + '"'
    // Below change from my netID to yours (twice: user and database)    
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=jad64177&pass=" + pw + "&database=jad64177&query=" + query)

    if (req.status == 200) { //transit trip worked.        
           // see JSON results
           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)
        results = JSON.parse(req.responseText)
           // see if results are correct
           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)
        
        if (results.length == 0)    // no results were returned by the query
           lblMessage1.textContent = "There are no pets in the database."
        else {     
        // Now output the names of all the customers associated with the state in the label control:
        let message = ""
        for (i = 0; i < results.length; i++)
            message = message + results[i][1] + "\n"
            lstgCustomer.addItem(message)
     } // end else

  } else   // the transit didn't work - bad wifi? server turned off?
        lblMessage1.textContent = "Error code: " + req.status

}
}

