# AuthorShelf
AuthorShelf is an iOS application that displays a list of authors with their images, names, and links. Users can mark their favorite authors and refresh the data.

===> Features

1.Splash screen with a centered image.
2.Dynamic TableView displaying authors with images, titles, descriptions, and clickable checkboxes.
3.Smooth scrolling experience with on-demand image loading.
4.Pull-to-refresh functionality to reload data.
5.Alerts and dialogs based on user interactions.


===> Requirements

iOS 12.0+
Xcode 11+
Swift 5.0+


===> Installation

1. Clone the repository:
  https://github.com/SudharshanGundlaKunta/AuthorShelf.git
  
2. Navigate to the project directory:
  cd AuthorShelf
  
3. Install dependencies:
   pod install

4. Open the project in Xcode:
   open AuthorShelf.xcworkspace
   

===> Usage

1. Run Application
  -Select the target device or simulator.
  -Click on the Run button in Xcode or press Cmd + R.
  
2. Interact with the app:
  - The splash screen will be displayed for 5 seconds.
  - The TableView will display a list of authors fetched from the server.
  - Pull down to refresh the data.
  - Click on the checkbox to mark an author as a favorite.
  - Click on a cell to see a dialog if the author is marked as favorite, otherwise see an alert.
