# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

    - true

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

    -  User has_many :bizlists
    -  Bizlist has_many :businesses
    -  Business has_many :business_reviews
    -  Review has_many :business_reviews  

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    -  Bizlist belongs_to :user
    -  BusinessReview belongs_to :business
    -  BusinessReview belongs_to :review
    -  Business belongs_to bizlist

- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

    -  Business has_many :reviews, through: :business_reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

    -  Business has_many :reviews, through: :business_reviews
    -  Review has_many :businesses, through: :business_reviews


- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

    User
      - validates_length_of :username, minimum: 4, maximum: 16
      - validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    Bizlist  
      - validates :name, presence: true

    Business
      - validates :name, presence: true
      - validates :address, presence: true, uniqueness: true

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

    - Business.search(params)  URL: /biz_search
    - Business.last_day  URL: /biz_filter_within_last_24_hours

- [x] Include signup (how e.g. Devise)

    - signup page located at /users/new
    - form_for collects user[:email], user[:username], user[:password] and
      user[:password_confirmation]         
    - passes the data to the UsersController #create method
    - creates the new user with strong params + user validations
    - sets the session[:user_id] to the newly created user to allow user login

- [x] Include login (how e.g. Devise)  

    - login page located at /login.
    - form_for collects user[:email] and user[:password]
    - passes the data to the SessionsController #create method
    - finds user in the database via email
    - uses bcrypt's has_secure_password to authenticate the user's password
    - once authenticated, it sets the session[:user_id] to allow user login


- [x] Include logout (how e.g. Devise)

    - logout is located within the menu as a link_to (present when logged in)
    - logout_path within the link_to sends application to Sessions#destroy
    - session is cleared, logging out user and redirecting to the home page

- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

    - nested index resource per logged in user -> /users/:id/bizlists
    - nested show resource per logged in user -> /users/:id/bizlists/:id

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

    - nested new resource per logged in user -> /users/:id/bizlists/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

    - all forms within application display validation errors
    - example -> /users/new

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
