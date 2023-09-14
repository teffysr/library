<h1 align="center">Mercat</h1>

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
    
    Get a book:
    GET http://localhost:3000/books/:id

    Create a book:
    POST http://localhost:3000/books
        body: {
            "available":true,
            "editorial":":"Editorial Planeta",
            "author":"Jonathan Freedland",
            "title":"El maestro de la fuga"
        }

    Update a book
    PATCH http://localhost:3000/books/:id
        body: {
            "available":true,
            "editorial":":"Editorial Planeta",
            "author":"Jonathan Freedland",
            "title":"La partida final"
        }

#### User
    List of users:
    GET http://localhost:3000/users
    
    Get a user:
    GET http://localhost:3000/users/:id

    Create a user:
    POST http://localhost:3000/users
        body: {
            "identification": "DNI 14000007",
            "name": "Sandra Barneda",
            "address": "Las Palmas 358, Castelar, Bs. As.",
            "email": "sandra@test.com",
            "phone": "541163587412",
        }

    Update a user
    PATCH http://localhost:3000/users/:id
        body: {
            "identification": "DNI 14000007",
            "name": "Sandra Barneda",
            "address": "742 de Evergreen Terrace, Springfield, EE. UU.",
            "email": "sandra@test.com",
            "phone": "541163500002",
        }
#### Loan
    List of loans:
    GET http://localhost:3000/loans
    
    Get a loan:
    GET http://localhost:3000/loans/:id

    Create a loan:
    POST http://localhost:3000/loans
        body: {
            "user_id":3,
	        "book_id":6
        }

    Return a loan
    PATCH http://localhost:3000/loans/:id/return

