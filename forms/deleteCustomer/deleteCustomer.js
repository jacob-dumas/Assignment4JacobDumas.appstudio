
// Takes customers from array and populates dropdown

deleteCustomer.onshow=function(){
drpCustomers.clear()
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
            drpCustomers.addItem(message + results[i][1] + "\n")
     } // end else

  } else   // the transit didn't work - bad wifi? server turned off?
        lblMessage1.textContent = "Error code: " + req.status
}


// Writes the code for showing the customer based on what was clicked.
drpCustomers.onclick=function(s){
  // this 'if' kicks user out if they  just clicked on control 
// but not on one item in the list.
    if (typeof(s) == "object")   
      return                    
    else {  // the user picked something
        drpCustomers.value = s // make dropdown show choice the user made
        let customerNameDel = drpCustomers.value
        console.log(`${customerNameDel}`)
    
    // make sure the pet name is in the database before you try to 
    // delete it
    let found = false
    for (i = 0; i < results.length; i++) {
        if (customerNameDel == results[i][1]){
            found = true
            break // if found the item in the database jump out of loop
        }
    }
    if (found == false) 
       lblMessage5.textContent = "That customer name is not in the database."
    else if (found == true) {
      query = "DELETE FROM customer WHERE name = '" + customerNameDel + "'"
      alert(query)
      
      req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=" + netID + "&pass=" + pw + "&database=jad64177&query=" + query)
      if (req.status == 200) //transit worked.
            if (req.responseText == 500)    // means the insert succeeded
                lblMessage5.textContent = `You have successfully deleted the customer named ${customerNameDel}`
            else
                lblMessage5.textContent = `There was a problem deleting ${customerNameDel} from the database.`
      else  // transit error
        lblMessage5.textContent = `Error: ${req.status}`
    } // found is true
} // end event handler
}


// Refreshing the Page 
btnRefresh.onclick=function(){
  deleteCustomer.reset()
}
