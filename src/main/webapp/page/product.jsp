<%@page import="java.util.List" %>
<%@page import="com.example.template_admin.entity.Products" %>
<%@include file="/include/head.jsp"%>
<%@include file="/include/header.jsp"%>
<div id="layoutSidenav">
    <%@include file="/include/navbar.jsp"%>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Tables</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="home">Dashboard</a></li>
                    <li class="breadcrumb-item active">Products</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header" style="justify-content: space-between; display: flex">
                        <div>
                            <i class="fas fa-table me-1"></i>
                            List products
                        </div>
                        <div>
                            <i class="fas fa-plus me-1"></i>
                            <a href="#" data-toggle="modal" data-target="#createProductModal" style="color: blue; text-decoration: none">Create Products</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Thumbnail</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Thumbnail</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                List<Products> products = (List<Products>) request.getAttribute("products");
                                for (Products product : products) {
                            %>
                            <tr>
                                <td><%= product.getId()%></td>
                                <td><%= product.getName()%></td>
                                <td><%= product.getQuantity()%></td>
                                <td><%= product.getDescription()%></td>
                                <td><img src="<%= product.getImage()%>" width="100" height="100"> </td>
                                <td><%= product.getPrice()%></td>
                                <td><%= product.getCategory()%></td>
                                <td>
                                    <a href="editProduct?id=<%= product.getId() %>" class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i></a>

                                    <button onclick="deleteStudent(<%= product.getId() %>)" class="btn btn-danger"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createProductModalLabel">Create Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="product" method="POST">
                    <div class="form-row mb-3">
                        <div class="form-group">
                            <label for="exampleInputPasswordId" class="form-label">ID</label>
                            <input type="number" name="id" class="form-control" id="exampleInputPasswordId">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" id="exampleInputEmail1">
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleInputEmail6" class="form-label">Image</label>
                        <input type="file" name="image" class="form-control" id="exampleInputEmail6">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleInputEmail7" class="form-label">Category</label>
                        <input type="text" name="category" class="form-control" id="exampleInputEmail7">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleInputEmail" class="form-label">Description</label>
                        <input type="text" name="description" class="form-control" id="exampleInputEmail">
                    </div>
                    <div class="form-row mb-3">
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="form-label">Price</label>
                            <input type="number" name="price" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword3" class="form-label">Quantity</label>
                            <input type="number" name="quantity" class="form-control" id="exampleInputPassword3">
                        </div>
                    </div>
                    <button style="width: 100%;" type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="/include/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function deleteStudent(id) {
        fetch('editProduct?id=' + id, {
            method: 'DELETE',
        })
            .then(response => response.text())
            .then(data => {
               alert("m muon xoa ko ")
                location.reload();
            })
            .catch((error) => {

            });
    }
</script>
<script>
    // Initialize DataTables plugin
    $(document).ready(function() {
        $('#datatablesSimple').DataTable();
    });
</script>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        max-width: 600px;
        margin-top: 50px;
    }
    .form-row {
        display: flex;
        gap: 10px;
    }
    .form-group {
        flex: 1;
    }
    .form-group label {
        font-weight: bold;
    }

    .card {
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        background: white;
    }
</style>
<script>
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Area Chart Example
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
            datasets: [{
                label: "Sessions",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 40000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });

    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June"],
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: [4215, 5312, 6251, 7841, 9821, 14984],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 15000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Pie Chart Example
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["Blue", "Red", "Yellow", "Green"],
            datasets: [{
                data: [12.21, 15.58, 11.25, 8.32],
                backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
            }],
        },
    });


</script>