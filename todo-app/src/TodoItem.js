import React from 'react';

function TodoItem({ todo, index, removeTodo }) {
  return (
    <div className="todo-item">
      <span>{todo}</span>
      <button onClick={() => removeTodo(index)}>Remove</button>
    </div>
  );
}

export default TodoItem;