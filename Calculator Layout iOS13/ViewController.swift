//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var mainResult = 0.0
	var strResult = ""
	var numberOnScreen : Double = 0
	var previousNumber : Double = 0
	var performingMath = false
	var operation = 0
	
	@IBOutlet weak var resultView: UILabel!
	@IBAction func numbers(_ sender: UIButton) {
		if performingMath == true {
			resultView.text = String((sender as AnyObject).tag - 1)
			numberOnScreen = Double(resultView.text!)!

		   performingMath = false
		} else {
			
			resultView.text = resultView.text! + String(sender.tag-1)

   //numberOnScreen = Double(resultView.text!)!

   }
	}
	
	func clearText(){
		resultView.text = "0"

	   previousNumber = 0;

	   numberOnScreen = 0;

	   operation = 0;
		performingMath = false
		print("Yay! You brought your towel!")
	}
	
	@IBAction func buttons(_ sender: UIButton) {
		if sender.tag == 11 {
			
			let alert = UIAlertController(title: "Clear with Towel?", message: "", preferredStyle: .alert)

			alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
				self.clearText()
			
				
}))
			alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
				print("NOOOO! You didnt bring your towel!")
}))

			self.present(alert, animated: true)
		}
		if resultView.text != "" && sender.tag != 11 && sender.tag != 16{
			previousNumber = Double(resultView.text!)!

	   if sender.tag == 12 { //Divide

		resultView.text = "/";

	   }

	   if sender.tag == 13 { //Multiply

		resultView.text = "x";

	   }

	   if sender.tag == 14 { //Subtract

		resultView.text = "-";

	   }

	   if sender.tag == 15 { //Add

		resultView.text = "+";

	   }

	   operation = sender.tag

	   performingMath = true;

	   }

		else if sender.tag == 16 {

	   if operation == 12{ //Divide

		resultView.text = String(previousNumber / numberOnScreen)

	   }

	   else if operation == 13{ //Multiply

		resultView.text = String(previousNumber * numberOnScreen)

	   }

	   else if operation == 14{ //Subtract

		resultView.text = String(previousNumber - numberOnScreen)

	   }

	   else if operation == 15{ //Add

		resultView.text = String(previousNumber + numberOnScreen)

	   }

	   else if sender.tag == 11{

		resultView.text = "0"

	   previousNumber = 0;

	   numberOnScreen = 0;

	   operation = 0;
		performingMath = false
		}
	}

	
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		resultView.text = "0"
		numberOnScreen = 0
		previousNumber = 0
        // Do any additional setup after loading the view.
    }

//	let exp = NSExpression(format:"3+3")
//	println(exp.expressionValueWithObject(nil, context: nil))

}

