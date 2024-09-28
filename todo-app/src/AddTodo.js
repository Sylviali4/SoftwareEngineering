import React, { useState } from 'react';

function AddTodo({ addTodo }) {
  const [newTodo, setNewTodo] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!newTodo.trim()) return;
    addTodo(newTodo);
    setNewTodo(''); // Clear the input after adding
  };

  return (
    <form className="add-todo-form" onSubmit={handleSubmit}>
      <input
        className="todo-input"
        type="text"
        value={newTodo}
        onChange={(e) => setNewTodo(e.target.value)}
        placeholder="Add a new todo"
      />
      <button className="add-button" type="submit">Add Todo</button>
    </form>
  );
}

export default AddTodo;
