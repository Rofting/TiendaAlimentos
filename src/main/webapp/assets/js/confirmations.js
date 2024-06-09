document.addEventListener('DOMContentLoaded', function() {
    const deleteButtons = document.querySelectorAll('.btn-delete');
    const editButtons = document.querySelectorAll('.btn-edit');

    deleteButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            if (!confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                event.preventDefault();
            }
        });
    });

    editButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            if (!confirm('¿Estás seguro de que deseas editar este elemento?')) {
                event.preventDefault();
            }
        });
    });
});
