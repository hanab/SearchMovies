# SearchMovies

## Features

  * The application allows user to search for a movie title and shows a list of movies with that tile 
  * If there is not search result it shows a no movie found lable and hides the table view
  
## Technologies

### UIKit

 * UITableView
 * UISearchbar
 * ...

## Networking and data parsing
* For networking URLSession class is used , and no third party library is used for networking or json parsing
* For Json parsing codable is used

### XCTest

* XCTest class was used to write small unit tests for some of the functions in the project.
* Unit test was writen for conversion of imdbRating string to a double rating which at a maximum can be 5
* Unit test was writien for checking when the tableview is displayed and when no result label is displayed
* Other unit test for json parsing and network layer and etc was written 

## Things to improve

 * More tests can be written
 * A spinner could be added to make the UI look better when the response is slow
 
 ## To Run the App
  * open the xcode project file and press the run button
  
 ## Answers to Questions
 * Q: At a high level, how does your app work?
 * A: The application allows user to search for a movie title and shows a list of movies with that tile and  If there is not search result it shows a no movie found lable and hides the table view
 * Q: What design decisions did you make and why?
 * A: I used MVC becuase the functionality the app has currently is too small and the view controller is small, I could have used MVVM but I decided not to used it as the view controler is not very big.
 * A: I used Cosmo third party library since it is very easy to use and has all the functionalites I have
 * A: I used URLSession and codable instead of third party libraries as they are simplier to use abd easly testable.
 * Q: What documentation, websites, papers, etc. did you consult for this assignment?
 * A: I mostly used my old repos in this github account as a refrence
 * Q: What third-party libraries or other tools does your application use? How did you choose each library or framework you used?
 * A: I used Cosmo for star rating and used Cocaopods to install it. I chose Cosmo because it is simple to use and has all the functionalities I need including voic over support
 * Q: How long did you spend on this exercise? If you had unlimited time to spend on this, how would you spend it and how would you prioritize each item?
 * A: I spend about 4hrs on the exercise. If I had more time I would have spent it to create a better UI, add more tests and add more functionalites such as when clikcing on a tableview cell showing a detail view 

