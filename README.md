# ExpensesBot iOS
Keep track of your expenses with this cutting edge, rocket science, web3, blockchain technology - nah just an iOS app fren

## Implementation details
- MVVM architecture
- All UI implemented using SwiftUI (only caveat is UIKit's UIImagePickerController at CameraView using UIViewControllerRepresentable)
- Storage using SwiftData
- Some ViewModels were suppressed since there wasn’t value/code to be isolated
- Focused UX on functionality and utility
- Implemented tests on code that we have ownership (meaning. we don't want to test SwiftUI, SwiftData)
- A single UI test added for the golden path of the app - Expense creation, listing, details