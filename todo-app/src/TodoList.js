import React from 'react';

function TodoList({ todos, removeTodo }) {
  return (
    <ul className="todo-list">
      {todos.map((todo, index) => (
        <li className="todo-item" key={index}>
          {todo}
          <button className="remove-button" onClick={() => removeTodo(index)}>
            Remove
          </button>
        </li>
      ))}
    </ul>
  );
}

export default TodoList;
