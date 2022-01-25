get url from ImagePicker
```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

  if let imgUrl = info[UIImagePickerControllerImageURL] as? URL{
    let imgName = imgUrl.lastPathComponent
    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    let localPath = documentDirectory?.appending(imgName)

    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    let data = UIImagePNGRepresentation(image)! as NSData
    data.write(toFile: localPath!, atomically: true)
    //let imageData = NSData(contentsOfFile: localPath!)!
    let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
    print(photoURL)
  }

  APPDEL.window?.rootViewController?.dismiss(animated: true, completion: nil)
}
```

set constraints
```swift
videoButton.translatesAutoresizingMaskIntoConstraints = false
videoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
videoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
videoButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
videoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

```
set action
```swift
imageButton.addTarget(self, action: #selector(imageButtonClicked(button:)), for: .touchUpInside)
```
```swift
@objc func imageButtonClicked(button: UIButton) {
  //Code
}
```
