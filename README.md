# Rock Paper Scissors Game

## Overview

This project is a Ruby on Rails application implementing the classic 'Rock, Paper, Scissors' game with an additional twist of including 'Hammer'. The 'Hammer' option beats both 'Paper' and 'Scissors' but loses to 'Rock'. The server's bet is fetched from the [rolz.org API](https://rolz.org/api/?1d4.json), which returns values between 1 and 4. In case the API call fails, a fallback mechanism generates a random choice locally.

## Features

- **Classic Gameplay**: Choose between Rock, Paper, Scissors, or Hammer.
- **Additional Rule**: 'Hammer' added as a fourth option.
- **API Integration**: Fetches the server's bet from an external API.
- **Fallback Mechanism**: Generates a random bet locally if the API call fails.
- **Responsive Design**: User-friendly interface with responsive design elements.

## Technologies Used

- **Ruby**: 2.6.6
- **Rails**: 6.1
- **Webpack**: For asset management
- **RSpec**: For testing

## Prerequisites

Ensure you have the following installed:

- **Ruby**: 2.6.6 (Install using RVM or rbenv)
- **Bundler**: To manage gem dependencies

## Installation

1. **Clone the Repository**:
   ```
   git clone https://github.com/skyfusion89/rock-paper-scissors.git
   cd rock-paper-scissors
   ```

2. **Install Dependencies**:
   ```
   gem install bundler
   bundle install
   ```

## Running the Application

1. **Start the Rails Server**:
   ```
   rails server
   ```
   The application will be available at `http://localhost:3000`.

2. **Access the Game**:
   Open your web browser and navigate to `http://localhost:3000` to start playing.

## Running Tests

This project uses RSpec for testing. To run the test suite, execute:

```
bundle exec rspec
```

## Project Structure

- **Controllers**: Handles the game's logic and interactions.
- **Models**: Manages the game's data and rules.
- **Views**: Renders the user interface.
- **Services**: Contains the logic for fetching the server's bet and fallback mechanisms.
- **Specs**: Contains the test cases for ensuring the correctness of the application.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## Acknowledgements

- [Ruby on Rails](https://rubyonrails.org/)
- [RSpec](https://rspec.info/)
- [Rolz.org API](https://rolz.org/api/?1d4.json)

---
