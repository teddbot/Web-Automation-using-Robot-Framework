from flask import Flask, request, render_template_string, jsonify
from robot.api import TestSuiteBuilder
import os
import subprocess
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# Specify the path to the ChromeDriver executable
chromedriver_path = '/opt/homebrew/bin/chromedriver'

# Create a Service object
chrome_service = Service(executable_path=chromedriver_path)

# Create Chrome options
chrome_options = webdriver.ChromeOptions()
# Add any additional options as needed
# chrome_options.add_argument('--headless')  # Example: Run Chrome in headless mode

# Pass the Service object and Chrome options to the Chrome WebDriver constructor
driver = webdriver.Chrome(service=chrome_service, options=chrome_options)


app = Flask(__name__)

@app.route('/')
def index():
    return render_template_string(open('templates/index.html').read())

@app.route('/run-test', methods=['POST'])
def run_test():
    data = request.get_json()
    url = data['url']

    # Run the test suite using subprocess to pass the URL as a command-line argument
    result = subprocess.run(['robot', '--variable', f'URL:{url}', 'test_suite.robot'], capture_output=True, text=True)

    # Return the result to the frontend
    return jsonify({
        'return_code': result.returncode,
        'stdout': result.stdout,
        'stderr': result.stderr
    })

if __name__ == '__main__':
    app.run(debug=True, port=5001)
