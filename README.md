Project based on the problem statement: 

- Build Rails App that provides search API to Mobile client.
- Rails app Stores data of Authors, Books, and Reviews.
- Authors model consists of Name, Author Bio (Long 50-100 lines), Profile Pic, Academics(Text), Awards(text). 
- Books model consists of Name of Book, Short Description, Long Description, Books Chapter Index, Date of Publication, Genre(Multiple). 
- Review Model consists of Name of Reviewer, Star rating(Out of 5), Review title, Review Description(Text).
- Reviews are written for Books.
- Use the faker gem to populate each of these models. Authors with 100 Records. Books with 500 Records. Reviews model with 250 records.
- For Genre, populate from the list ( Science fiction.Satire.Drama.Action and Adventure.Romance.Mystery.Horror.Self help. Fantasy) 
=> Write an API endpoint that can accept text such as “fantasy books” or “Mark Angelo” and returns the JSON results from all three models that match with text.
- The API needs to be authenticated using a token-based authentication. You could use OAuth 2.0 based authentication.


=========================================================================================

HERE ARE THE INSTRUCTIONS TO SET UP THE PROJECT:

Steps to setup the project on the local system are as follows: 

Step 1 - Clone from this link https://github.com/divyansh-23/mobile_api.git 

Step 2 - Now run [ rake db:create ]

Step 3 - Run [ rake db:migrate ]

Step 4 - Run  [ rake db:seed ]

Step 5 - Run [ bundle install ]

Step 6 - Now switch on rails server

Step 7 - Now hit a "POST" request through postman on the url ( http://localhost:3000/oauth/token )
              You need to provide these Keys and Values to get the access token. [ username => divyansh@example.com] [ password => 123456789 ] [ grant_type => password ]
              "OR" you can directly hit the "POST" request with this url ( http://localhost:3000/oauth/token?username=divyansh@example.com&password=123456789&grant_type=password )
              
Note: (1) You will get the "access_token" in the response for the request. (Check image "first_step_get_request" for reference attached with this mail)
(2) Now copy the access token.

Step 8 - Now hit the "GET" request with postman on the url ( http://localhost:3000/api/users/search ).
              You need to provide the key-value pairs to get the response such as [ access_token => "Paste the access token which you copied in STEP 7" ] [ keyword => "YOUR KEYWORD TO SEARCH" ]
               (Check image "second_step_get_request" for reference attached with this mail)

Step 9 - Check the response, you will be able to see the JSON response with all the matched records in the database.
