<%@include file="includes/header.jsp"%>
<head>
    <link href="style.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Teachers:ital,wght@0,400..800;1,400..800&display=swap" rel="stylesheet">
</head>
<main>
    <section class="py-5 container">
        <% if (id==0) {%>
        <h3 class="text-danger">New Product</h3>
        <% } else { %>
        <h3 class="text-danger">Modify Product</h3>
        <% } %>
        <br/>
        <form class="row g-3 needs-validation bg-dark border-dark" method="post" enctype="multipart/form-data" id="edit-form">
            <div class="mb-3  text-white bg-dark">
                <label for="product_name" class="form-label">Name</label>
                <input type="text" name="product_name" class="form-control" id="product_name" placeholder="Name product"
                    <% if (id !=0) {%> value="<%=products.getProduct_name()%>"<% }%>>
            </div>
            <div class="mb-3  text-white bg-dark">
                <label for="description" class="form-label">Description</label>
                <input type="text" name="description" class="form-control" id="description" placeholder="Description"
                    <% if (id !=0) {%> value="<%=products.getDescription()%>"<% }%>>
            </div>
            <div class="mb-3  text-white bg-dark">
                <label for="product_status" class="form-label">Product Status</label>
                <input type="text" name ="product_status" class="form-control" id="product_status" placeholder=".."
                    <% if (id !=0) {%> value="<%=products.getProduct_status()%>"<% }%>>
            </div>
            <div class="col-md-2  text-white bg-dark">
                <label for="sale_price" class="form-label">Sale Price</label>
                <input type="text" name ="sale_price" class="form-control" id="sale_price" placeholder="18,00"
                <% if (id !=0) {%> value="<%= CurrencyUtils.format(products.getSale_price()) %>"<% }%>>
            </div>
            <div class="col-md-2  text-white bg-dark">
                <label for="release_date" class="form-label">Release Date</label>
                <input type="date" name="release_date" class="form-control" id="release_date" placeholder="dd/mm/yyyy"
                <% if (id !=0) {%> value="<%=DateUtils.format(products.getRelease_date())%>"<% }%>>
            </div>
<%--            Implementacion de desplegable con informacion dinamica de la BD de la tabla de proveedores--%>
            <div class="col-md-2  text-white bg-dark">
                    <label for="id_supplier" class="form-label">Supplier Id</label>
                    <select class="form-select" aria-label="Selector de Proveedor" name="id_supplier" id="id_supplier">
                        <option selected>
                            <% if (id !=0) {%>
                            <%=products.getId_supplier()%>
                            <%} else {%>
                            Id Supplier/Name
                            <%}%>
                        </option>
                <%
                    try {
                        Database.connect();
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    List<Suppliers> listsuppliers = null;
                    listsuppliers = Database.jdbi.withExtension(SuppliersDao.class, dao -> dao.getAllSuppliers());
                    for (Suppliers suppliers : listsuppliers) {
                %>
                        <option value="<%=suppliers.getId_supplier()%>"><%=suppliers.getId_supplier()%>:&nbsp;<%=suppliers.getName()%></option>
                <%
                    }
                %>
                </select>
            </div>
            <div class="col-md-4  text-white bg-dark">
                <label for="image" class="form-label">Image</label>
                <input type="file" name="image" class="form-control" id="image">
            </div>

            <div class="col-12  text-white bg-dark">
                    <input type="submit" value="Send" id="edit-button"/>
            </div>
            <input type="hidden" name="id_product" value="<%=id%>"/>
        </form>
        <br/>
        <div id="result"></div>
        <br/>
        <p><a href="index.jsp" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Back to initial menu</a></p>
    </section>
</main>

<%@include file="includes/footer.jsp"%>