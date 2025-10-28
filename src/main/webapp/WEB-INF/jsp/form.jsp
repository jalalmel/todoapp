<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Nouvelle tâche | To-Do List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f5;
            font-family: 'Inter', sans-serif;
        }
        .card {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            border: none;
        }
        .btn {
            border-radius: 30px;
        }
        h2 {
            font-weight: 600;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="card">
    <h2 class="mb-4 text-center">
        <i class="bi bi-pencil-square me-2"></i>
        <c:out value="${todo.id == null ? 'Nouvelle tâche' : 'Modifier la tâche'}" />
    </h2>

    <form action="${pageContext.request.contextPath}/todos/save" method="post">
        <input type="hidden" name="id" value="${todo.id}" />

        <div class="mb-3">
            <label class="form-label">Titre</label>
            <input type="text" name="title" class="form-control" required value="${todo.title}">
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" rows="3" class="form-control">${todo.description}</textarea>
        </div>

        <div class="form-check form-switch mb-4">
            <input class="form-check-input" type="checkbox" name="done" value="true" ${todo.done ? 'checked' : ''}>
            <label class="form-check-label">Marquer comme terminée</label>
        </div>

        <div class="d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/todos" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i> Retour
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-save me-1"></i> Enregistrer
            </button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
