package com.example.todoapp.dao;


import com.example.todoapp.model.Todo;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class TodoDao {
    private final JdbcTemplate jdbc;

    public TodoDao(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    private RowMapper<Todo> rowMapper = (rs, rowNum) -> {
        Todo t = new Todo();
        t.setId(rs.getInt("id"));
        t.setTitle(rs.getString("title"));
        t.setDescription(rs.getString("description"));
        t.setDone(rs.getBoolean("done"));
        t.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        return t;
    };

    public List<Todo> findAll() {
        return jdbc.query("SELECT * FROM todos ORDER BY created_at DESC", rowMapper);
    }

    public Todo findById(int id) {
        return jdbc.queryForObject("SELECT * FROM todos WHERE id = ?", new Object[]{id}, rowMapper);
    }

    public int save(Todo t) {
        if (t.getId() == null) {
            return jdbc.update(
                    "INSERT INTO todos (title, description, done) VALUES (?, ?, ?)",
                    t.getTitle(), t.getDescription(), t.isDone()
            );
        } else {
            return jdbc.update(
                    "UPDATE todos SET title = ?, description = ?, done = ? WHERE id = ?",
                    t.getTitle(), t.getDescription(), t.isDone(), t.getId()
            );
        }
    }

    public int deleteById(int id) {
        return jdbc.update("DELETE FROM todos WHERE id = ?", id);
    }
}

