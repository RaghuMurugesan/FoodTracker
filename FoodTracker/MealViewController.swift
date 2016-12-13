//
//  ViewController.swift
//  FoodTracker
//
//  Created by rag on 11/20/16.
//  Copyright © 2016 rag. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value id either passed by 'MealTableViewCOntroller' in 'prepareForSegue(_:sender)'
     or constructed as part of adding a new meal.
     */
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle User's text field input through delegate callbacks.
        nameTextField.delegate = self
        
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the Keyboard
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary contains several representation of the image, and this uses the original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set photoImageView to the selectedImage
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    // This method lets you configure a view controller before it is presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when save button is pressed.
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
    }
    
    // MARK: Actions

    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the Keyboard.
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure viewController is notified when user picks an image
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
}
