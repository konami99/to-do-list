import React, { useEffect } from "react";

const App = () => {
  useEffect(() => {
    // post to api todos edit
    const postTodo = async() => {
      const response = await fetch("/todos.json", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          todo: { title: "New Task", description: "Task details", completed: false }
        }),
      });

      const data = await response.json();
      console.log(data);
    };

    postTodo();
  }, []);

  return (
    <h1>Hello from React!</h1>
  );
}

export default App;