<p align="center"><img src="https://github-production-user-asset-6210df.s3.amazonaws.com/18340584/267901588-edf5e0cc-9a96-4c3a-af60-ae3e9fe97fad.png" width="300" >
</p>

<p align="center">Challenge</p>

### Source
    git clone https://github.com/teffysr/library.git 

### Download Project Dependencies
    bundle install 


### Run tests
    bundle exec rspec

### Endpoints Library
#### Books
    List of books:
    GET http://localhost:3000/books
        https://library-mercat.fly.dev/books
    
    Get a book:
    GET http://localhost:3000/books/:id
        https://library-mercat.fly.dev/books/:id

    Create a book:
    POST http://localhost:3000/books
         https://library-mercat.fly.dev/books
        body: {
            "available":true,
            "editorial":":"Editorial Planeta",
            "author":"Jonathan Freedland",
            "title":"El maestro de la fuga"
        }

    Update a book
    PATCH http://localhost:3000/books/:id
          https://library-mercat.fly.dev/books/:id 
        body: {
            "available":true,
            "editorial":":"Editorial Planeta",
            "author":"Jonathan Freedland",
            "title":"La partida final"
        }
    
    Delete a book:
    DELETE http://localhost:3000/books/:id
        https://library-mercat.fly.dev/books/:id

#### User
    List of users:
    GET http://localhost:3000/users
        https://library-mercat.fly.dev/users
    
    Get a user:
    GET http://localhost:3000/users/:id
        https://library-mercat.fly.dev/users/:id

    Create a user:
    POST http://localhost:3000/users
         https://library-mercat.fly.dev/users
        body: {
            "identification": "DNI 14000007",
            "name": "Sandra Barneda",
            "address": "Las Palmas 358, Castelar, Bs. As.",
            "email": "sandra@test.com",
            "phone": "541163587412",
        }

    Update a user
    PATCH http://localhost:3000/users/:id
          https://library-mercat.fly.dev/users/:id  
        body: {
            "identification": "DNI 14000007",
            "name": "Sandra Barneda",
            "address": "742 de Evergreen Terrace, Springfield, EE. UU.",
            "email": "sandra@test.com",
            "phone": "541163500002",
        }
    Delete a user:
    DELETE http://localhost:3000/user/:id
        https://library-mercat.fly.dev/user/:id

#### Loan
    List of loans:
    GET http://localhost:3000/loans
        https://library-mercat.fly.dev/loans/

    Get a loan:
    GET http://localhost:3000/loans/:id
        https://library-mercat.fly.dev/loans/:id

    Create a loan:
    POST http://localhost:3000/loans
         https://library-mercat.fly.dev/loans
        body: {
            "user_id":3,
	        "book_id":6
        }

    Return a loan
    PATCH http://localhost:3000/loans/:id/return
          https://library-mercat.fly.dev/loans/:id/return

