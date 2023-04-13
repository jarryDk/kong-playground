package dk.jarry.todo.boundary;

import java.util.List;

import dk.jarry.todo.entity.ToDo;

public interface ToDoService {

    public ToDo create(ToDo toDo);

    public ToDo read(Object id);

    public ToDo update(Long id, ToDo toDo);

    public void delete(Object id);

    public List<ToDo> list(Integer start, Integer limit);

}
