package dk.jarry.todo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class ToDo {
    @Id
    @SequenceGenerator( //
            name = "todosSequence", //
            sequenceName = "todos_id_seq", //
            allocationSize = 1, //
            initialValue = 10)
    @GeneratedValue( //
            strategy = GenerationType.SEQUENCE, //
            generator = "todosSequence")
    public Long id;
    public String subject;
    public String body;
}
