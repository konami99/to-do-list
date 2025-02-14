import React, { useEffect } from "react";
import { Link } from "react-router-dom";

const Index = () => {
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
    <div>
      <h1 className="text-4xl font-bold underline">Index</h1>
      <ul>
        <li><Link to="/todo/1">View Todo 1</Link></li>
        <li><Link to="/todo/2">View Todo 2</Link></li>
      </ul>
    </div>
  );
}

export default Index;