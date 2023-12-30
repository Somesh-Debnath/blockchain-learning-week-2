// Fetch using Promises
fetch('https://jsonplaceholder.typicode.com/todos/1')
  .then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    return response.json();
  })
  .then(data => {
    console.log('Data fetched using Promises:', data);
  })
  .catch(error => {
    console.error('Error fetching data using Promises:', error);
  });

// Fetch using async/await

async function fetchAsync() {
    try {
        const response = await fetch('https://jsonplaceholder.typicode.com/todos/1');
        const data = await response.json();
        console.log('Data fetched using async/await:', data);
    } catch (error) {
        console.error('Error fetching data using async/await:', error);
    }
}