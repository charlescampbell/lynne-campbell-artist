# Lynne Campbell - Artist

Simple web application for my grandmother so that she can upload her art for
advertisement easily.

----

## Contributing

### Development

#### Setup

Make sure to run `bundle install` to ensure you can develop.

#### Rails

`bin/rails server`: Starts the application locally for development on localhost:3000
`bin/rails console`: Starts up the rails console for debugging

#### Commiting to the repository

This project follows the conventional commit specification detailed here
`www.conventionalcommits.org`

`fix` : Any small fix to the code base
`refactor` : Refactoring of code
`feat` : A finished feature with full functionality
`docs` : Documentation changes
`test` : Any form of testing
`lint` : Rubocop fixes

#### Pull Requests

Before raising a pull request make sure that rubocop and rspec both come back
passing.

`make pr`: Runs rubocop and rspec local

### Release

To create a release run `make new-version` this will tag the release based on
the commit history and automatically bump the version and generate the changelog.

### User Experience Guidelines

The basic UX for this website is courtecy of colourlib.
