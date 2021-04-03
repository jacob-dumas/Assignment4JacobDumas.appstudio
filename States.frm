{
  "!type": "Form",
  "_uuid": "55f58acb28ee43f3ac12f7ca810c2e7f",
  "HTML": "",
  "attributes": "",
  "background": "",
  "backgroundimage": "",
  "borderColor": "",
  "borderStyle": "",
  "borderWidth": "",
  "cached_js": "// global variables for database calls\nlet req = \"\"\nlet query = \"\"\nlet results = \"\"\nlet pw = \"Bailey10\"  // ***** put your database password here\nlet netID = \"jad64177\"\nlet allCustomerData = []\n\n\n// Takes states from array and populates dropdown\n\nStates.onshow=function(){\ndrpStates.clear()\n query = \"SELECT * FROM customer\"\n    // Below change from my netID to yours (twice: user and database)    \n    req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=jad64177&pass=\" + pw + \"&database=jad64177&query=\" + query)\n\n    if (req.status == 200) { //transit trip worked.        \n           // see JSON results\n           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)\n        results = JSON.parse(req.responseText)\n           // see if results are correct\n           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)\n        \n        if (results.length == 0)    // no results were returned by the query\n           lblMessage1.textContent = \"There are no pets in the database.\"\n        else {     \n        // Now output the names of all the dogs into the textArea control:\n        let message = \"\"\n        for (i = 0; i < results.length; i++)\n            drpStates.addItem(message + results[i][4] + \"\\n\")\n     } // end else\n\n  } else   // the transit didn't work - bad wifi? server turned off?\n        lblMessage1.textContent = \"Error code: \" + req.status\n}\n\n\n// Writes the code for showing the customer based on what was clicked.\ndrpStates.onclick=function(s){\n  // this 'if' kicks user out if they  just clicked on control \n// but not on one item in the list.\n    if (typeof(s) == \"object\")   \n      return                    \n    else {  // the user picked something\n        drpStates.value = s // make dropdown show choice the user made\n        let state = drpStates.value\n        \nquery = \"SELECT * from customer WHERE state =\" + '\"' + state + '\"'\n    // Below change from my netID to yours (twice: user and database)    \n    req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=jad64177&pass=\" + pw + \"&database=jad64177&query=\" + query)\n\n    if (req.status == 200) { //transit trip worked.        \n           // see JSON results\n           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)\n        results = JSON.parse(req.responseText)\n           // see if results are correct\n           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)\n        \n        if (results.length == 0)    // no results were returned by the query\n           lblMessage1.textContent = \"There are no pets in the database.\"\n        else {     \n        // Now output the names of all the customers associated with the state in the label control:\n        let message = \"\"\n        for (i = 0; i < results.length; i++)\n            message = message + results[i][1] + \"\\n\"\n            lstgCustomer.addItem(message)\n     } // end else\n\n  } else   // the transit didn't work - bad wifi? server turned off?\n        lblMessage1.textContent = \"Error code: \" + req.status\n\n}\n}\n\n",
  "cached_js_script_hash": "bd0e4b962446fb7b30a5fed54ce586ce",
  "children": [
    {
      "!type": "Dropdown_bs4",
      "_uuid": "a58b23d2bfb74522ab630415e87fd5ba",
      "align": "",
      "appearance": " btn-secondary",
      "backgroundColor": "",
      "badge": "",
      "badgeAppearance": " badge-info",
      "blockLevel": "",
      "borderColor": "",
      "borderStyle": "",
      "borderWidth": "",
      "bottom": "auto",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "class": "",
      "color": "",
      "disabled": "",
      "display": "",
      "dropdown": "dropdown",
      "expanded_pmp": true,
      "filter": "false",
      "filterPlaceholder": "Search...",
      "fontFamily": "",
      "fontSize": "",
      "fontStyle": "",
      "fontWeight": "",
      "groupStyle": "",
      "grouping": "",
      "height": "auto",
      "hidden": "",
      "icon": "caret",
      "id": "drpStates",
      "items": "",
      "left": 35,
      "mAll": "",
      "mBottom": "",
      "mLeft": "",
      "mRight": "",
      "mTop": "",
      "onclick": "drpStates.onclick()",
      "onmousedown": "",
      "onmousemove": "",
      "onmouseout": "",
      "onmouseup": "",
      "onresize": "",
      "ontouchend": "",
      "ontouchmove": "",
      "ontouchstart": "",
      "outline": "",
      "pAll": "",
      "pBottom": "",
      "pLeft": "",
      "pRight": "",
      "pTop": "",
      "popBody": "Body",
      "popClose": "hover",
      "popPosition": "",
      "popStyle": "popover",
      "popTitle": "Title",
      "right": "auto",
      "script": "",
      "size": " btn-md",
      "style": "",
      "top": 32,
      "value": "States",
      "width": "auto"
    },
    {
      "!type": "Listgroup_bs4",
      "_uuid": "356e08e6bdc34d0480ba4ef6e9b15a3d",
      "appearances": "default\nsuccess\ninfo\ndanger",
      "backgroundColor": "",
      "bottom": "auto",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "class": "",
      "color": "",
      "disabled": "",
      "display": "",
      "expanded_pmp": true,
      "fontFamily": "",
      "fontSize": "",
      "fontStyle": "",
      "fontWeight": "",
      "height": "auto",
      "hidden": "",
      "icons": "",
      "id": "lstgCustomer",
      "itemBadges": "1\n2\n3\n4",
      "items": "",
      "left": 35,
      "listStyle": "ul",
      "mAll": "",
      "mBottom": "",
      "mLeft": "",
      "mRight": "",
      "mTop": "",
      "onclick": "",
      "onmousedown": "",
      "onmousemove": "",
      "onmouseout": "",
      "onmouseup": "",
      "onresize": "",
      "ontouchend": "",
      "ontouchmove": "",
      "ontouchstart": "",
      "pAll": "",
      "pBottom": "",
      "pLeft": "",
      "pRight": "",
      "pTop": "",
      "popBody": "Body",
      "popClose": "hover",
      "popPosition": "",
      "popStyle": "popover",
      "popTitle": "Title",
      "right": "auto",
      "script": "",
      "style": "",
      "top": 122,
      "width": "180px"
    },
    {
      "!type": "Label_bs4",
      "_uuid": "e97b2d7a77404c328af385d7e9c6a948",
      "appearance": "primary",
      "backgroundColor": "",
      "borderRadius": "0",
      "bottom": "auto",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "class": "",
      "color": "",
      "display": "",
      "expanded_pmp": true,
      "fontFamily": "",
      "fontSize": "",
      "fontStyle": "",
      "fontWeight": "",
      "height": 6,
      "hidden": "",
      "id": "lblCustomer",
      "labelStyle": "text",
      "left": 36,
      "mAll": "",
      "mBottom": "",
      "mLeft": "",
      "mRight": "",
      "mTop": "",
      "onclick": "",
      "onmousedown": "",
      "onmousemove": "",
      "onmouseout": "",
      "onmouseup": "",
      "onresize": "",
      "ontouchend": "",
      "ontouchmove": "",
      "ontouchstart": "",
      "pAll": "",
      "pBottom": "",
      "pLeft": "",
      "pRight": "",
      "pTop": "",
      "right": "auto",
      "script": "",
      "style": "",
      "top": 298,
      "value": "",
      "width": 91
    }
  ],
  "class": "",
  "designHeight": 0,
  "designWidth": 0,
  "expanded_pmp": true,
  "fullScreen": "true",
  "height": 460,
  "id": "States",
  "language": "JavaScript",
  "left": "0",
  "locked": false,
  "modal": "false",
  "onhide": "",
  "onkeypress": "",
  "onresize": "",
  "onshow": "States.onshow()",
  "openMode": "none",
  "parentForm": "",
  "position": "absolute",
  "script": "// global variables for database calls\nlet req = \"\"\nlet query = \"\"\nlet results = \"\"\nlet pw = \"Bailey10\"  // ***** put your database password here\nlet netID = \"jad64177\"\nlet allCustomerData = []\n\n\n// Takes states from array and populates dropdown\n\nStates.onshow=function(){\ndrpStates.clear()\n query = \"SELECT * FROM customer\"\n    // Below change from my netID to yours (twice: user and database)    \n    req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=jad64177&pass=\" + pw + \"&database=jad64177&query=\" + query)\n\n    if (req.status == 200) { //transit trip worked.        \n           // see JSON results\n           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)\n        results = JSON.parse(req.responseText)\n           // see if results are correct\n           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)\n        \n        if (results.length == 0)    // no results were returned by the query\n           lblMessage1.textContent = \"There are no pets in the database.\"\n        else {     \n        // Now output the names of all the dogs into the textArea control:\n        let message = \"\"\n        for (i = 0; i < results.length; i++)\n            drpStates.addItem(message + results[i][4] + \"\\n\")\n     } // end else\n\n  } else   // the transit didn't work - bad wifi? server turned off?\n        lblMessage1.textContent = \"Error code: \" + req.status\n}\n\n\n// Writes the code for showing the customer based on what was clicked.\ndrpStates.onclick=function(s){\n  // this 'if' kicks user out if they  just clicked on control \n// but not on one item in the list.\n    if (typeof(s) == \"object\")   \n      return                    \n    else {  // the user picked something\n        drpStates.value = s // make dropdown show choice the user made\n        let state = drpStates.value\n        \nquery = \"SELECT * from customer WHERE state =\" + '\"' + state + '\"'\n    // Below change from my netID to yours (twice: user and database)    \n    req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=jad64177&pass=\" + pw + \"&database=jad64177&query=\" + query)\n\n    if (req.status == 200) { //transit trip worked.        \n           // see JSON results\n           console.log(`req.responseText is a JSON string that looks like this: ${req.responseText}`)\n        results = JSON.parse(req.responseText)\n           // see if results are correct\n           console.log(`The parsed JSON string is converted to a JS object (an array of arrays): ${results} where results[0] is ${results[0]}, the first array in the JS results object.`)\n        \n        if (results.length == 0)    // no results were returned by the query\n           lblMessage1.textContent = \"There are no pets in the database.\"\n        else {     \n        // Now output the names of all the customers associated with the state in the label control:\n        let message = \"\"\n        for (i = 0; i < results.length; i++)\n            message = message + results[i][1] + \"\\n\"\n            lstgCustomer.addItem(message)\n     } // end else\n\n  } else   // the transit didn't work - bad wifi? server turned off?\n        lblMessage1.textContent = \"Error code: \" + req.status\n\n}\n}\n\n",
  "setFocusID": "",
  "style": "",
  "theme": "",
  "top": "0",
  "width": 320,
  "_functions": [
    {
      "!type": "Form",
      "_uuid": "b824f03a87a2486fa7de63ecd79db376",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "expanded_pmp": true,
      "id": "States.onshow",
      "location": [
        11,
        12
      ],
      "script": "",
      "signature": "States.onshow()"
    },
    {
      "!type": "Form",
      "_uuid": "e89ab7974e08400f9427de4da35e7e76",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "expanded_pmp": true,
      "id": "drpStates.onclick",
      "location": [
        40,
        41
      ],
      "script": "",
      "signature": "drpStates.onclick(s)"
    }
  ]
}