package dk.jarry.todo.boundary;

import java.util.List;

import jakarta.annotation.PostConstruct;
import jakarta.inject.Inject;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.DefaultValue;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.QueryParam;

import dk.jarry.todo.entity.ToDo;

@Path("/todos")
public class ToDoResource {

	@Inject
	ToDoService toDoService;

	@PostConstruct
	public void init(){
		ToDo toDo = new ToDo();
		toDo.subject = "init-subject";
		toDo.body = "init-body";
		toDo = toDoService.create(toDo);
		System.out.println(toDo.toString());
	}

	@POST
	public ToDo create(ToDo toDo) {
		return toDoService.create(toDo);
	}

	@GET
	@Path("{id}")
	public ToDo read(@PathParam("id") Long id) {
		return toDoService.read(id);
	}

	@PUT
	@Path("{id}")
	public ToDo update(@PathParam("id") Long id, ToDo toDo) {
		return toDoService.update(id, toDo);
	}

	@DELETE
	@Path("{id}")
	public void delete(@PathParam("id") Long id) {
		toDoService.delete(id);
	}

	@GET
	public List<ToDo> list( //
			@DefaultValue("0") @QueryParam("from") Integer from, //
			@DefaultValue("100") @QueryParam("limit") Integer limit) {
		return toDoService.list(from, limit);
	}

}