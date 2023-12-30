var userId = 1; 

// Fetch and filter using Promises
fetch('https://jsonplaceholder.typicode.com/posts')
  .then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    return response.json();
  })
  .then(posts => {
    const userPosts = posts.filter(post => post.userId === userId);

    console.log(`User ${userId} Posts using Promises:`, userPosts);
  })
  .catch(error => {
    console.error('Error fetching or filtering data using Promises:', error);
  });

// Fetch and filter using async/await

async function fetchAsync() {
    try {
        const response = await fetch('https://jsonplaceholder.typicode.com/posts');
        const posts = await response.json();
        const userPosts = posts.filter(post => post.userId === userId);
    
        console.log(`User ${userId} Posts using async/await:`, userPosts);
    } catch (error) {
        console.error('Error fetching or filtering data using async/await:', error);
    }
}