# Project Title
‘Chess With Frienemies' is a full stack Rails application that will allow users to sign into a pre-made account and connect with their friends to play games of chess. The application also provides users with a functional friends list, and a section for statistics on their previous games of chess.

## Getting Started
These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites/Versions
You will need to have the Ruby 3.2.2 and Rails 7.1.4.

### Installing
To install and use this repository on your local machine first clone down this repository, the [Users Backend Repository](https://github.com/frien-emies/users_BE).
Navigate through the console so that your are in the directories of each application.
Run `rails db:{drop,create,migrate,seed}` to establish the database. Then run `bundle install` to install all the gem dependencies. 

## Running the tests
To run the tests for this repository, simply run `bundle exec rspec spec` from the command line while in the frienemeies_users_BE projects directory. This will run all test files for the application. 

# API Endpoints
## Users Index
### Endpoint:
  - GET https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/users/user_id/index
### Response:
{
  "data": [
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "bob",
        "email": "bob@turing.com",
        "avatar": "app/assets/images/baby.jpg"
      }
    },
    {
      "id": "2",
      "type": "user",
      "attributes": {
        "username": "rob",
        "email": "rob@turing.com",
        "avatar": "app/assets/images/queen.jpg"
      }
    },
    {
      "id": "3",
      "type": "user",
      "attributes": {
        "username": "knob",
        "email": "knob@turing.com",
        "avatar": "app/assets/images/elephant.jpg"
      }
    },
    {
      "id": "4",
      "type": "user",
      "attributes": {
        "username": "jan",
        "email": "jan@turing.com",
        "avatar": "app/assets/images/dog.jpg"
      }
    },
    {
      "id": "5",
      "type": "user",
      "attributes": {
        "username": "kat",
        "email": "kat@turing.com",
        "avatar": "app/assets/images/cat.jpg"
      }
    },
    {
      "id": "6",
      "type": "user",
      "attributes": {
        "username": "abdul",
        "email": "abdul@turing.com",
        "avatar": "app/assets/images/queen.jpg"
    }
    },
    {
      "id": "7",
      "type": "user",
      "attributes": {
        "username": "jeff",
        "email": "jeff@turing.com",
        "avatar": "app/assets/images/bones.jpg"
      }
    }
  ]
}

## User Show
### Endpoint:
  - GET https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/users/user_id
### Response:
{
  "data": {
    "type": "user",
    "id": 1,
    "attributes": {
      "email": "bob@turing.com",
      "username": "bob",
      "avatar": "app/assets/images/baby.jpg"
    }
  }
}

## Users Search
### Endpoint:
  - GET https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/users/search?query=j
### Response:
{
  "data": [
    {
      "id": "4",
      "type": "user",
      "attributes": {
        "username": "jan",
        "email": "jan@turing.com",
        "avatar": "app/assets/images/dog.jpg"
      }
    },
    {
      "id": "7",
      "type": "user",
      "attributes": {
        "username": "jeff",
        "email": "jeff@turing.com",
        "avatar": "app/assets/images/bones.jpg"
      }
    }
  ]
}

## Friends List
### Endpoint:
  - GET https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/users/user_id/friends
### Response:
{
  "data": [
    {
      "id": "4",
      "type": "user",
      "attributes": {
        "username": "jan",
        "email": "jan@turing.com",
        "avatar": "app/assets/images/dog.jpg"
      }
    },
    {
      "id": "7",
      "type": "user",
      "attributes": {
        "username": "jeff",
        "email": "jeff@turing.com",
        "avatar": "app/assets/images/bones.jpg"
      }
    }
  ]
}

## Add Friend
### Endpoint:
  - POST https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/users/1/add_friend
  - Required JSON from FE:
  {
    "user_id": 5
  }
### Response:
{
  "data": "You've added a friend!"
}

## Login
### Endpoint:
  - POST https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/sessions
  - Required JSON from FE:
  {
    "email": "bob@turing.com",
    "password": "ihateruby"
  }
### Response:
{
  "data": {
    "type": "user",
    "id": 1,
    "attributes": {
      "email": "bob@turing.com",
      "username": "bob",
      "avatar": "app/assets/images/baby.jpg"
    }
  }
}

## Logout
### Endpoint:
  - DELETE https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/api/v1/sessions
  - Required JSON from FE:
  {
    "user_id": 1
  }
### Response:
{
  "data": {
    "type": "user",
    "id": 1,
    "attributes": {
       "message": "User successfully logged out."
    }
  }
}

## Deployment Link
  - [Heroku](https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com)

## Built With
  - [Frien-emies Github Org](https://github.com/frien-emies)
  - [Users Backend Repository (this application)](https://github.com/frien-emies/users_BE)
  - [Github Project Board](https://github.com/orgs/frien-emies/projects/2/views/1)

## Authors & Contributors 
- **Austin Kenny** - *BE and FE Engineer* -
    [GitHub](https://github.com/AustinKCodes)
- **Cory Bretsch** - *BE and FE Engineer* -
    [GitHub](https://github.com/CoryBretsch)
- **Lance Nelson** - *BE and FE Engineer* -
    [GitHub](https://github.com/LancePants97)
