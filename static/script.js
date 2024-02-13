document.getElementById('testForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var url = document.getElementById('urlInput').value;
    if (url.trim() === '') {
        alert('Please enter a URL.');
        return;
    }

    runTest(url);
});

function runTest(url) {
    var testResults = document.getElementById('testResults');
    testResults.innerHTML = 'Running test...';

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/run-test', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.return_code === 0) {
                    testResults.innerHTML = 'Test Passed';
                } else {
                    testResults.innerHTML = 'Test Failed<br>' + response.stderr;
                }
            } else {
                testResults.innerHTML = 'Error: ' + xhr.statusText;
            }
        }
    };
    xhr.send(JSON.stringify({ url: url }));
}
