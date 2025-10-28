package com.example.todoapp.controller;



import com.example.todoapp.dao.TodoDao;
import com.example.todoapp.model.Todo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/todos")
public class TodoController {

    private final TodoDao todoDao;

    public TodoController(TodoDao todoDao) {
        this.todoDao = todoDao;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("todos", todoDao.findAll());
        return "list"; // maps to /WEB-INF/jsp/list.jsp
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("todo", new Todo());
        return "form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Todo todo) {
        todoDao.save(todo);
        return "redirect:/todos";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("todo", todoDao.findById(id));
        return "form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        todoDao.deleteById(id);
        return "redirect:/todos";
    }
}

