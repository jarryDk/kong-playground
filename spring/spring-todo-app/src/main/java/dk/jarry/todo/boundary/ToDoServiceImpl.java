package dk.jarry.todo.boundary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dk.jarry.todo.entity.ToDo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;

@Repository
public class ToDoServiceImpl implements ToDoService {

    @Autowired
    EntityManager entityManager;

    public ToDoServiceImpl() {
    }

    @Transactional
    public ToDo create(ToDo toDo) {
        if (toDo.id != null) {
            throw new RuntimeException( //
                    "ToDo not valid.");
        }
        entityManager.persist(toDo);
        entityManager.flush();
        entityManager.refresh(toDo);

        return toDo;
    }

    @Transactional
    public ToDo read(Object id) {
        ToDo toDo = entityManager.find(ToDo.class, id);
        if (toDo != null) {
            return toDo;
        } else {
            throw new RuntimeException( //
                    "ToDo with id of " + id + " does not exist.");
        }
    }

    @Transactional
    public ToDo update(Long id, ToDo toDo) {

        if (toDo.id == null) {
            toDo.id = id;
        }

        if (read(id) != null) {
            return entityManager.merge(toDo);
        } else {
            throw new RuntimeException( //
                    "ToDo with id of " + id + " does not exist.");
        }
    }

    @Transactional
    public void delete(Object id) {

        ToDo toDo = read(id);

        if (toDo != null) {
            entityManager.remove(toDo);
        } else {
            throw new RuntimeException( //
                    "ToDo with id of " + id + " does not exist.");
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<ToDo> list(Integer start, Integer limit) {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<ToDo> criteriaQuery = criteriaBuilder.createQuery(ToDo.class);

        Root<ToDo> from = criteriaQuery.from(ToDo.class);

        criteriaQuery.select(from);
        criteriaQuery.orderBy( //
                criteriaBuilder.asc(from.get("subject")), //
                criteriaBuilder.desc(from.get("id")));

        Query jpqlQuery = entityManager.createQuery(criteriaQuery);

        jpqlQuery.setFirstResult((start > 0 ? start - 1 : 0));
        jpqlQuery.setMaxResults((limit > 0 ? limit : 100));

        return jpqlQuery.getResultList();

    }

}
