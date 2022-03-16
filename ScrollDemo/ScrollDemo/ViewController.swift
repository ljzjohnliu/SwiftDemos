//
//  ViewController.swift
//  ScrollDemo
//
//  Created by ByteDance on 2022/3/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewWillLayoutSubviews() {
        scrollview.zoomScale = 1
        scrollview.frame = view.bounds
        imageview.frame = view.bounds
    }

    @IBAction func tapimageview(_ sender: UITapGestureRecognizer) {
        print(#function)
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageview
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageview.image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
}
