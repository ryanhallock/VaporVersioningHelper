# VaporVersioningHelper

Have you ever wanted to support older implementations of your API routes?

For example most popular web apps have a example.com/v1/ or api.example.com/v2/ etc...

I wanted to make this easier by porting all of v1 to v2 if it does not already exist in v2. This allows you to create new routes and deprecate old ones.

I want to retain the functionality. I also wanted to implement some key middleware that is missing. Presumably cause the IETF is still underway for deprecation [here](https://datatracker.ietf.org/doc/draft-ietf-httpapi-deprecation-header/)

# TODO

[x] Implement core functionality.
[ ] Create documentation and examples.
[ ] Create test cases.
