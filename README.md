# Web Automated Testing Project

This project is aimed at automating web testing using the Robot Framework and SeleniumLibrary.

## Overview

The project consists of the following components:
- Test suite written in Robot Framework
- HTML frontend for initiating tests without writing code
- Python backend using Flask for serving the frontend and executing tests

## Installation

To set up the project, follow these steps:

1. Clone the repository:
    ```
    git clone https://github.com/your_username/web-automated-testing.git
    ```

2. Install dependencies:
    ```
    pip install -r requirements.txt
    ```

## Usage

To run the project, execute the following command:
python main.py


Then, open your web browser and navigate to `http://localhost:5001` to access the HTML frontend. Enter the URL of the website you want to test and click the "Run Test" button to initiate the test.

## File Structure

- `main.py`: Python backend for serving the HTML frontend and executing tests.
- `test_suite.robot`: Test suite written in Robot Framework for web automation testing.
- `templates/index.html`: HTML frontend for initiating tests.
- `static/styles.css`: CSS styles for styling the HTML frontend.
- `static/script.js`: JavaScript file for handling user interactions on the HTML frontend.
- `requirements.txt`: List of Python dependencies.

## Contributing

Contributions are welcome! If you have any suggestions, bug fixes, or enhancements, feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
