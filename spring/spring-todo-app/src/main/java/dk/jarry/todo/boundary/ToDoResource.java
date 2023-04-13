package dk.jarry.todo.boundary;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import dk.jarry.todo.entity.ToDo;


@RestController
@RequestMapping("/todos")
public class ToDoResource {

	private static final Logger log = LoggerFactory.getLogger(ToDoResource.class);

	@Autowired
	ToDoService toDoService;

	@Bean
	public CommandLineRunner demo() {
		return (args) -> {
			ToDo toDo;
			for( int i = 0 ; i < 10; i++ ) {
				toDo = new ToDo();
				toDo.subject = "init-subject";
				toDo.body = "init-body";
				toDo = toDoService.create(toDo);
				log.info(toDo.toString());
			}
		};
	}


	@PostMapping
	public ToDo create(ToDo toDo) {
		return toDoService.create(toDo);
	}

	@GetMapping("{id}")
	public ToDo read(@PathVariable("id") Long id) {
		return toDoService.read(id);
	}

	@PutMapping("{id}")
	public ToDo update(@PathVariable("id") Long id, ToDo toDo) {
		return toDoService.update(id, toDo);
	}

	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Long id) {
		toDoService.delete(id);
	}

	@GetMapping("list")
	public List<ToDo> list( //
			@DefaultValue("0") @RequestParam("from") Integer from, //
			@DefaultValue("100") @RequestParam("limit") Integer limit) {
		return toDoService.list(from, limit);
	}

}