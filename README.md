
# Stripe API basic ruby app

Notes:
- In order to make a charge, app requires a http app to server stripe.js and handle callback [Stripe HTML form](https://stripe.com/docs/stripe-js/elements/quickstart)
- Purpose of this example is to build a comprehension around what a server app can do without the use of Rails and how to tie in a module such as Stripe.

## Getting started with students
1. ```bundle init```
2. ```touch main.rb .gitignore .env README.md```
3. ```bundle```

## Stages
1. build main.rb (add gems)
2. implement stripe
3. implement dotenv to get environment variable for stripe
4. implement charge with stripe (record id)
5. implement charge retrieval with charge id
6. build server.rb
7. implement do_GET in Routes class and serve basic page
8. implement index.html
9. integrate dotenv and erb with index.html
10. implement do_POST in Routes class and serve post response
11. implement charge by stripe