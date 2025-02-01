<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Cargo</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Editar Cargo</h1>
  <form action="cargos" method="post">
    <input type="hidden" name="action" value="editar">
    <input type="hidden" name="idCargo" value="${cargo.idCargo}">
    <div class="form-group">
      <label for="cargo">Cargo:</label>
      <input type="text" class="form-control" id="cargo" name="cargo" value="${cargo.cargo}" required>
    </div>
    <div class="form-group">
      <label for="descripcionCargo">Descripción:</label>
      <textarea class="form-control" id="descripcionCargo" name="descripcionCargo" required>${cargo.descripcionCargo}</textarea>
    </div>
    <div class="form-group">
      <label for="jefatura">Jefatura:</label>
      <select class="form-control" id="jefatura" name="jefatura" required>
        <option value="true" ${cargo.jefatura ? 'selected' : ''}>Sí</option>
        <option value="false" ${!cargo.jefatura ? 'selected' : ''}>No</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Actualizar</button>
  </form>
</div>
</body>
</html>