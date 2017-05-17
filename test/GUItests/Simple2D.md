### Start tau-argus

* In menu, click "Help"
* Click "Options..."
* Select "Free solver"
* Type `1` in box between "(modular)" and "min"
* Click"OK"
* In menu, click "File"
* Click "Open Microdata..." 
* In pop-up
  * Click top-most "..."-button
  * In next pop-up
    * Find `tau_testW.asc`
    * Click "Open"
  * Click "OK"
* Click "Specify"
* Click "Tables..."
* In panel "Explanatory Variables"
  * Select "Size"
  * Click ">>"-button
  * Select "Region" in "Explanatory Variables"
  * Click ">>"-button
* In panel "Cell items"
  * Select "Var2"
  * Click ">>"-button next to "Response variable"
  * Select "Variable" under "Cost variable"
  * Type `1.0` in box next to "Lambda"
* In panel "Parameters"
  * Select "P%-rule"
  * Select "P%-rule"-tab
  * Type `15` in first box on row "Ind-1" (under "P")
  * Type `1` in second box on row "Ind-1" (under "N")
* Unselect
  * "Minimum frequency"
  * "Zero unsafe"
  * "Apply weights"
  * "Missing=safe"
* Click "v"-button next to Parameters-panel
* Click "Compute Tables" at bottom of the window
* In panel "Suppress" 
  * Choose "Modular"
  * Click "Suppress"
  * In pop-up
    * Select all three options
    * Click "OK"
  * In pop-up 
    * Click "OK"
* In menu, click "Output"
* Click "Save Table..."
* Select "Code-value"
* Under "General Options"
  * Select "Add status"
  * Select "Embed spanning variables in quotes"
  * Unselect other options
* In box above "Write table"-button type `Simple2D.txt`
* Click "Write table"
* In pop-up
  * Click "Yes"
* In next pop-up
  * Click "No"
### Close tau-argus 

