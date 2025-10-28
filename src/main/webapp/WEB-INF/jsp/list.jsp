<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord | To-Do List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
        }
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        .table th {
            background-color: #f1f3f5;
        }
        .btn {
            border-radius: 30px;
        }
        .header-bar {
            background: linear-gradient(135deg, #007bff, #00c6ff);
            color: white;
            padding: 1.5rem;
            border-radius: 0 0 20px 20px;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        .header-bar h1 {
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="header-bar">
    <h1><i class="bi bi-check2-square me-2"></i>To-Do List</h1>
    <p class="mb-0">Gérez vos tâches efficacement</p>
</div>

<div class="container">
    <div class="d-flex justify-content-end mb-3">
        <a href="${pageContext.request.contextPath}/todos/new" class="btn btn-primary">
            <i class="bi bi-plus-circle me-1"></i> Nouvelle tâche
        </a>
    </div>

    <div class="card p-3">
        <table class="table table-hover align-middle">
            <thead class="table-light">
            <tr>
                <th>Titre</th>
                <th>Description</th>
                <th>Statut</th>
                <th>Date de création</th>
                <th class="text-end">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="t" items="${todos}">
                <tr>
                    <td><strong>${t.title}</strong></td>
                    <td>${t.description}</td>
                    <td>
                        <c:choose>
                            <c:when test="${t.done}">
                                <span class="badge bg-success"><i class="bi bi-check-circle"></i> Terminé</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-warning text-dark"><i class="bi bi-hourglass-split"></i> En cours</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${t.createdAt}</td>
                    <td class="text-end">
                        <a href="${pageContext.request.contextPath}/todos/edit/${t.id}" class="btn btn-sm btn-outline-secondary">
                            <i class="bi bi-pencil"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/todos/delete/${t.id}"
                           onclick="return confirm('Supprimer cette tâche ?')"
                           class="btn btn-sm btn-outline-danger ms-1">
                            <i class="bi bi-trash"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
