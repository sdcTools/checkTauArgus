### Start tau-argus

*

* Click "File"
* Click "Open Microdata..." 
* Choose microdata file
  * Click "..."-button
  * Find `tau_testW.asc`
  * Click "OK"
* Click "Specify"
* Click "Tables..."
* In panel "Explanatory Variables"
  * Select "Size"
  * Click ">>"-button
  * Select "Region" in " Explanatory Variables"
  * Click ">>"-button
* In panel "Cell items"
  * Select "Var2"
  * Click ">>"-button next to "Response variable"
  * Select "Variable" under "Cost variable"
  * Type "1.0" in box next to "Lambda"
* In panel "Parameters"
  * Select "P%-rule"
  * Select "P%-rule"-tab
  * Type "15" in box "Ind-1 P"
  * Type "1" in box "Ind-1 N"
* Unselect
  * "Minimum frequency"
  * "Zero unsafe"
  * "Apply weights"
  * Missing=safe
* Click "v"-button next to Parameters-panel
* Click "Compute Tables" at bottom of the window
* In panel "Suppress" 
  * Choose "Modular"
  * Click "Suppress"
  * In pop-up
    * Select all three options
    * Click "OK"
  * In po-up 
    * Click "OK"
