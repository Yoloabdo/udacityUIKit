//
//  ViewController.swift
//  MemeApp
//
//  Created by Abdulrhman  eaita on 4/20/16.
//  Copyright © 2016 Abdulrhman eaita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var topTextField: UITextField! {
        didSet{
            topTextField.delegate = self
        }
    }
    @IBOutlet weak var camerBtn: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var bottomTextField: UITextField! {
        didSet{
            bottomTextField.delegate = self
        }
    }

    @IBOutlet weak var imagePickerView: UIImageView!
    
    
    // MARK: Variables
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.whiteColor(),        NSForegroundColorAttributeName : UIColor.clearColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : 22.0    ]
    
    let NotficCenter = NSNotificationCenter.defaultCenter()
    var viewMoved = false

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        camerBtn.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
//        topTextField.defaultTextAttributes = memeTextAttributes
//        bottomTextField.defaultTextAttributes = memeTextAttributes
//        
        subscribeToKeyboardNotifications()
        
    }
    @IBAction func pickImage(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .SavedPhotosAlbum
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion:nil)
    }
    @IBAction func shootImage(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion:nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePickerView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    // MARK: Saving the meme
    
    @IBAction func saveImage(sender: UIBarButtonItem) {
        
        let firstItem = "Share it now"
        let secondItem = generateMemedImage()
        
        
        let shareController = UIActivityViewController(activityItems: [firstItem, secondItem], applicationActivities: nil)
        self.presentViewController(shareController, animated: true, completion: nil)
    }


    
    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        self.navigationController?.navigationBar.hidden = true
        toolBar.hidden = true
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame,
                                     afterScreenUpdates: true)
        let memedImage : UIImage =
            UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // TODO:  Show toolbar and navbar  
        self.navigationController?.navigationBar.hidden = false
        toolBar.hidden = false
        
        
        return memedImage
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    
    // KeyBoard adjustment for view response

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    func subscribeToKeyboardNotifications() {
        NotficCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NotficCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotficCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NotficCenter.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if viewMoved == false {
            UIView.animateWithDuration(0.2, animations: {
                self.view.frame.origin.y -= self.getKeyboardHeight(notification)
            })
            viewMoved = true
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if viewMoved == true {
            
            view.frame.origin.y += getKeyboardHeight(notification)
            viewMoved = false
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
}

